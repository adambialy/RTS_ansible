#!/bin/bash

# Check if NVIDIA drivers are installed
if ! nvidia-smi &> /dev/null; then
  echo "NVIDIA drivers are not installed or GPU is not detected."
  exit 1
fi

# Print GPU information
nvidia-smi

# Run a simple GPU benchmark (use 'nvidia-smi' for real-time usage)
echo "Running GPU benchmark..."
nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader,nounits

# Test GPU performance (you can use other GPU benchmark tools if installed)
# Example: nvidia-smi dmon -s 1
# This will display real-time GPU usage statistics

# Test CUDA installation (if you have CUDA installed)
if command -v nvcc &> /dev/null; then
  echo "Checking CUDA version..."
  nvcc --version
else
  echo "CUDA is not installed."
fi

# Test cuDNN installation (if you have cuDNN installed)
if [ -e /usr/local/cuda/include/cudnn_version.h ]; then
  echo "Checking cuDNN version..."
  cat /usr/local/cuda/include/cudnn_version.h
else
  echo "cuDNN is not installed."
fi

# Check for GPU compute capability (you may want to customize the version)
# Example: Compute Capability 7.0 (Tesla V100)
gpu_cc="7.0"
gpu_name=$(nvidia-smi --query-gpu=name --format=csv,noheader,nounits)
if [[ "$gpu_name" == *"Tesla"* && "$gpu_name" == *"$gpu_cc"* ]]; then
  echo "GPU compute capability is compatible."
else
  echo "GPU compute capability is not compatible."
fi

# Additional tests can be added as needed

echo "GPU test completed."

