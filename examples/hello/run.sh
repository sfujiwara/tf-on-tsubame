#!/bin/bash

#$ -cwd
#$ -l cpu_4=1
#$ -l h_rt=0:10:00
#$ -N hello
#$ -o logs/
#$ -e logs/

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module load cuda/12.3.2
module load cudnn/8.9.7
module load nccl/2.20.5
module load openmpi/5.0.2-intel

# Run script
echo "hello"
pwd
nvidia-smi
printenv
sleep 30
