import torch
from diffusers import DiffusionPipeline


def main():
    pipe = DiffusionPipeline.from_pretrained(
        "stabilityai/stable-diffusion-xl-base-1.0",
        torch_dtype=torch.float16,
        use_safetensors=True,
        variant="fp16",
    )
    pipe = pipe.to("cuda")

    prompt = "A cat holding a sign that says hello world"
    negative_prompt = ""
    image = pipe(
        prompt=prompt,
        negative_prompt=negative_prompt,
    ).images[0]

    image.save("demo.png")


if __name__ == "__main__":
    main()
