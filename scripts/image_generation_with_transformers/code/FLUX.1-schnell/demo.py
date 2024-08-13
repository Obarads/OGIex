import torch
from diffusers import FluxPipeline


def main():
    pipe = FluxPipeline.from_pretrained(
        "black-forest-labs/FLUX.1-schnell",
        torch_dtype=torch.bfloat16,
    )
    pipe.enable_model_cpu_offload()  # save some VRAM by offloading the model to CPU. Remove this if you have enough GPU power

    prompt = "A cat holding a sign that says hello world"
    negative_prompt = ""
    image = pipe(
        prompt,
        negative_prompt=negative_prompt,
        height=320,
        width=320,
        guidance_scale=0.0,
        output_type="pil",
        num_inference_steps=4,
        max_sequence_length=256,
        generator=torch.Generator("cpu").manual_seed(0),
    ).images[0]

    image.save("demo.png")


if __name__ == "__main__":
    main()
