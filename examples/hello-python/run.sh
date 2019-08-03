#!/bin/sh
#$ -cwd
#$ -l f_node=1
#$ -l h_rt=1:00:00
#$ -N hello
#$ -v GPU_COMPUTE_MODE=1

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module load python/3.6.5
module load cuda/10.0.130
module load cudnn/7.4
module load nccl/2.4.2
module load openmpi/2.1.2-opa10.9-t3

# Run script
python examples/hello-python/hello.py
