# Setup an environment for Python 3.6.5 and TensorFlow

# Load modules
module purge
module load python/3.6.5
module load intel cuda openmpi

# Create virtual environment
python3 -m venv tf
source tf/bin/activate

# pip install --user python modules
