#!/bin/sh
#$ -cwd
#$ -l f_node=1
#$ -l h_rt=1:00:00
#$ -N tfkeras_horovod
#$ -o logs/
#$ -e logs/

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module purge
module load python/3.6.5
module load cuda/9.0.176
module load cudnn/7.4
module load nccl/2.4.2
module load openmpi/2.1.2-opa10.9-t3

# Load virtual environment
source ~/venv-tf1.12/bin/activate

# Run script
mpirun -npernode 4 -n 8 -x LD_LIBRARY_PATH python task.py
