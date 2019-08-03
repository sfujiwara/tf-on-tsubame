#!/bin/sh
#$ -cwd
#$ -l f_node=2
#$ -l h_rt=1:00:00
#$ -N hello_mpi
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
mpirun -npernode 4 -n 8 -x LD_LIBRARY_PATH bash task.sh
