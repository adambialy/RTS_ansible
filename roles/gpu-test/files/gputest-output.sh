#!/bin/bash

# Output file
output_file="/tmp/gpu-test-output.txt"
html_out="/var/www/html/gou-test-out.html"

# Check if NVIDIA drivers are installed
if ! nvidia-smi &> /dev/null; then
  echo "NVIDIA drivers are not installed or GPU is not detected." | tee "$output_file"
  exit 1
fi

# Redirect all output to the specified file from this point
exec > "$output_file"

# Print GPU information
nvidia-smi

# Run a simple GPU benchmark
echo "Running GPU benchmark..."
nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader,nounits

# Test CUDA installation
if command -v nvcc &> /dev/null; then
  echo "Checking CUDA version..."
  nvcc --version
else
  echo "CUDA is not installed."
fi

# Test cuDNN installation
if [ -e /usr/local/cuda/include/cudnn_version.h ]; then
  echo "Checking cuDNN version..."
  cat /usr/local/cuda/include/cudnn_version.h
else
  echo "cuDNN is not installed."
fi

# Check for GPU compute capability
gpu_cc="7.0"
gpu_name=$(nvidia-smi --query-gpu=name --format=csv,noheader,nounits)
if [[ "$gpu_name" == *"Tesla"* && "$gpu_name" == *"$gpu_cc"* ]]; then
  echo "GPU compute capability is compatible."
else
  echo "GPU compute capability is not compatible."
fi

# Additional tests can be added as needed

echo "GPU test completed."

cat ${output_file} | txt2html > ${html_out}

# Close the output file and stop redirecting output
exec > /dev/tty


