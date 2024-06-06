#!/bin/bash
#$ -cwd
#$ -l cpu_80=1
#$ -l h_rt=0:10:00
#$ -N hello
#$ -o logs/
#$ -e logs/

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module load python/3.6.5
module load cuda/10.0.130
module load cudnn/7.4
module load nccl/2.4.2
module load openmpi/2.1.2-opa10.9-t3

# Run script
echo "hello"
pwd
nvidia-smi
printenv
