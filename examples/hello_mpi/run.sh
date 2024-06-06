#!/bin/bash

#$ -cwd
#$ -l f_node=2
#$ -l h_rt=1:00:00
#$ -N hello_mpi
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
mpirun -npernode 4 -n 8 -x LD_LIBRARY_PATH bash task.sh
