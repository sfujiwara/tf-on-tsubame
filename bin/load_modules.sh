#!/bin/bash

module purge
module load python/3.6.5
module load cuda/10.0.130
module load intel cuda openmpi

# Create virtual environment
python3 -m venv tf
source tf/bin/activate

# pip install --user python modules
