#!/bin/bash

module purge
module load python/3.6.5
module load cuda/10.0.130
module load intel cuda openmpi

# Show loaded modules
module list

# Create virtual environment
python3 -m venv ~/tf
source ~/tf/bin/activate

# Install Python packages
python3.6 -m pip install -U pip
pip install tensorflow-gpu==1.14.0
pip install horovod==0.13.11

# Show Python packages
pip list
