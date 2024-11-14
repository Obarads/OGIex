import torch
from diffusers import StableDiffusionXLPipeline


def main():
    # pipeline
    pipe = StableDiffusionXLPipeline.from_pretrained(
        "segmind/SSD-1B",
        torch_dtype=torch.float16,
        use_safetensors=True,
        variant="fp16",
    )
    pipe = pipe.to("cuda")

    prompt = "A cat holding a sign that says hello world"
    negative_prompt = "ugly, blurry, poor quality"
    image = pipe(
        prompt=prompt,
        negative_prompt=negative_prompt,
    ).images[0]

    image.save("demo.png")


if __name__ == "__main__":
    main()
