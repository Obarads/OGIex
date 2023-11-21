import torch

from shap_e.diffusion.sample import sample_latents
from shap_e.diffusion.gaussian_diffusion import diffusion_from_config
from shap_e.models.download import load_model, load_config
from shap_e.util.notebooks import create_pan_cameras, decode_latent_images, gif_widget
from shap_e.util.image_util import load_image
import argparse
import os

def main(input_path, output_path):
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    xm = load_model('transmitter', device=device)
    model = load_model('image300M', device=device)
    diffusion = diffusion_from_config(load_config('diffusion'))

    batch_size = 1
    guidance_scale = 3.0

    # To get the best result, you should remove the background and show only the object of interest to the model.
    image = load_image(input_path)

    latent = sample_latents(
        batch_size=batch_size,
        model=model,
        diffusion=diffusion,
        guidance_scale=guidance_scale,
        model_kwargs=dict(images=[image]),
        progress=True,
        clip_denoised=True,
        use_fp16=True,
        use_karras=True,
        karras_steps=64,
        sigma_min=1e-3,
        sigma_max=160,
        s_churn=0,
    )[0]


    render_mode = 'nerf' # you can change this to 'stf' for mesh rendering
    size = 64 # this is the size of the renders; higher values take longer to render.

    cameras = create_pan_cameras(size, device)
    images = decode_latent_images(xm, latent, cameras, rendering_mode=render_mode)
    images[0].save(output_path, save_all=True, append_images=images[1:], duration=100, loop=0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--input_file_path', type=str, required=True, help='input image path')
    parser.add_argument('--output_gif_file_path', type=str, required=True, help='output gif path')
    args = parser.parse_args()

    main(args.input_file_path, args.output_gif_file_path)

