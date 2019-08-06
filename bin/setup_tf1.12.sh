# tf.keras + Horovod

echo "Load modules..."
module purge
module load python/3.6.5
module load cuda/9.0.176
module load cudnn/7.4
module load nccl/2.4.2
module load openmpi/2.1.2-opa10.9-t3

# Show loaded modules
echo "Show module list"
module list

# Create virtual environment
echo "Create virtual environment..."
python3 -m venv ~/venv-tf1.12
source ~/venv-tf1.12/bin/activate

# Install latest pip
echo "Install latest pip"
curl https://bootstrap.pypa.io/get-pip.py -o ~/get-pip.py
python ~/get-pip.py

# Install Python packages
echo "Install Python packages..."
pip install tensorflow-gpu==1.12.0
pip install horovod

# Show Python packages
pip list
