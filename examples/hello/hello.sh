
#!/bin/sh
#$ -cwd
#$ -l f_node=1
#$ -l h_rt=1:00:00
#$ -N hello
#$ -v GPU_COMPUTE_MODE=1

# Initialize module
. /etc/profile.d/modules.sh

# Load modules
module purge
module load python/3.6.5
module load intel cuda openmpi

# Run script
echo "hello"
pwd
nvidia-smi
