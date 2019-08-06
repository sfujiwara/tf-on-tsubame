#!/bin/sh
#$ -cwd
#$ -l f_node=1
#$ -l h_rt=1:00:00
#$ -N tf_mirrored_strategy
#$ -o logs/
#$ -e logs/

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
echo "Load modules..."
module purge
module load python/3.6.5
module load cuda/10.0.130
module load cudnn/7.4
module load nccl/2.4.2

# Load virtual environment
source ~/venv-tf1.14/bin/activate

# Run script
python task.py
