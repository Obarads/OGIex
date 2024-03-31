# CUDA
## CUDA 11.1
```bash
BASE_IMAGE=ogiex_cuda:cuda11.1_cudnn8.0_ubuntu18.04
docker build . -t $BASE_IMAGE  -f Dockerfile.cuda111
```