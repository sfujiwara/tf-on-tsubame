#!/bin/bash

#$ -cwd
#$ -l node_q=1
#$ -l h_rt=00:10:00
#$ -N hello_tf
#$ -o logs/
#$ -e logs/

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module load cuda/12.3.2
module load cudnn/8.9.7
module load nccl/2.20.5
module load openmpi/5.0.2-intel

# Load virtual environment
source ~/tf-on-tsubame/.venv/bin/activate

# Run script
python task.py
