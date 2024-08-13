import torch
from diffusers import StableDiffusion3Pipeline


def main():
    pipe = StableDiffusion3Pipeline.from_pretrained(
        "stabilityai/stable-diffusion-3-medium-diffusers",
        torch_dtype=torch.float16,
    )
    pipe = pipe.to("cuda")

    prompt = "A cat holding a sign that says hello world"
    negative_prompt = ""
    image = pipe(
        prompt,
        negative_prompt=negative_prompt,
        num_inference_steps=28,
        guidance_scale=7.0,
    ).images[0]

    image.save("demo.png")


if __name__ == "__main__":
    main()
