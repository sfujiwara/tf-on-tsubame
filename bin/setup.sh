#!/bin/bash

# Purge and load modules
echo "Load modules..."
module purge
module load cuda/12.3.2
module load cudnn/8.9.7
module load nccl/2.20.5
module load openmpi/5.0.2-intel

# Show loaded modules
echo "Show module list"
module list

# Create virtual environment
echo "Create virtual environment..."
python -m venv .venv
source .venv/bin/activate

# Install Python packages
echo "Install Python packages..."
pip install -U pip
pip install tensorflow==2.16.1
pip install horovod==0.28.1

# Show Python packages
pip list
