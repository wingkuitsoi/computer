:: This script builds llama-cpp-python from source with CUDA GPU acceleration on Windows.
:: Repository: https://github.com/abetlen/llama-cpp-python.git

@echo off

:: Installing Dependencies
conda install cmake ninja -c conda-forge
pip install scikit-build-core

:: Install compilers
conda install -c conda-forge compilers vs2019_win-64

:: Custom build
set "CMAKE_ARGS=-DLLAMA_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=89 -DLLAMA_CURL=OFF"
set "FORCE_CMAKE=1"
set "CMAKE_GENERATOR=Ninja"
cd .\llama
pip install --no-cache-dir --no-build-isolation -v .
