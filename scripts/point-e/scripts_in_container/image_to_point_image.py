from PIL import Image
import torch
from tqdm.auto import tqdm

from point_e.diffusion.configs import DIFFUSION_CONFIGS, diffusion_from_config
from point_e.diffusion.sampler import PointCloudSampler
from point_e.models.download import load_checkpoint
from point_e.models.configs import MODEL_CONFIGS, model_from_config
from point_e.util.plotting import plot_point_cloud

import os
import argparse


def main(input_file_path, output_file_path):
    os.makedirs(os.path.dirname(output_file_path), exist_ok=True)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    print("creating base model...")
    base_name = "base40M"  # use base300M or base1B for better results
    base_model = model_from_config(MODEL_CONFIGS[base_name], device)
    base_model.eval()
    base_diffusion = diffusion_from_config(DIFFUSION_CONFIGS[base_name])

    print("creating upsample model...")
    upsampler_model = model_from_config(MODEL_CONFIGS["upsample"], device)
    upsampler_model.eval()
    upsampler_diffusion = diffusion_from_config(DIFFUSION_CONFIGS["upsample"])

    print("downloading base checkpoint...")
    base_model.load_state_dict(load_checkpoint(base_name, device))

    print("downloading upsampler checkpoint...")
    upsampler_model.load_state_dict(load_checkpoint("upsample", device))

    sampler = PointCloudSampler(
        device=device,
        models=[base_model, upsampler_model],
        diffusions=[base_diffusion, upsampler_diffusion],
        num_points=[1024, 4096 - 1024],
        aux_channels=["R", "G", "B"],
        guidance_scale=[3.0, 3.0],
    )

    # Load an image to condition on.
    img = Image.open(input_file_path)

    # Produce a sample from the model.
    samples = None
    for x in tqdm(
        sampler.sample_batch_progressive(batch_size=1, model_kwargs=dict(images=[img]))
    ):
        samples = x

    pc = sampler.output_to_point_clouds(samples)[0]
    fig = plot_point_cloud(
        pc, grid_size=3, fixed_bounds=((-0.75, -0.75, -0.75), (0.75, 0.75, 0.75))
    )
    fig.savefig(output_file_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input_file_path", type=str)
    parser.add_argument("--output_file_path", type=str)
    args = parser.parse_args()
    main(args.input_file_path, args.output_file_path)
