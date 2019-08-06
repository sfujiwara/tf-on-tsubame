# tf.keras + MirroredStrategy

echo "Load modules..."
module purge
module load python/3.6.5
module load cuda/10.0.130
module load cudnn/7.4
module load nccl/2.4.2

# Show loaded modules
echo "Show module list"
module list

# Create virtual environment for tf.keras + MirroredStrategy
python3 -m venv ~/venv-tf1.14
source ~/venv-tf1.14/bin/activate

# Install latest pip
echo "Install latest pip"
curl https://bootstrap.pypa.io/get-pip.py -o ~/get-pip.py
python ~/get-pip.py

# Install Python packages
echo "Install Python packages..."
pip install tensorflow-gpu==1.14.0
pip install tensorflow-datasets

# Show Python packages
pip list
