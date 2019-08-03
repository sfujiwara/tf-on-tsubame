# Distributed TensorFlow on TSUBAME 3.0

## Access to login node

Access to the login node from your local machine:

```bash
ssh dlh19u20@login.t3.gsic.titech.ac.jp -i ~/.ssh/t3-key -YC
```

Note that `dlh19u20` is user name of [@sfujiwara](https://github.com/sfujiwara).
You have to replace it with your user name.

## Setup

### Clone this repository

```bash
git clone https://github.com/sfujiwara/tf-on-tsubame.git
```

### Set group to environment variable

Note that `GROUP` in `.env` should be modified for your group.
`tgz-dlh19g00` is group name of [@sfujiwara](https://github.com/sfujiwara).

```bash
cd tf-on-tsubame
source .env

echo $GROUP
```

### Login to GPU node

We have to setup our environment, for example install Python modules, on a computation node with GPU.
Thus, we login to a computation node at first.

```bash
# Logint with interactive job
qrsh -g $GROUP -l s_gpu=1 -l h_rt=00:10:00

# Change directory
cd tf-on-tsubame
```

### Run setup script

```bash
source bin/setup.sh
```

The script

- Load modules
- Create virtual environment `venv-tf` for Python
- Install Python modules

## Storage

- `/gs/hs1/$GROUP/`
  - Shared storage to be save large data (for machine learning)

```
t3-user-info disk group -g $GROUP
```
