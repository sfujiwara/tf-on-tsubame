# Distributed TensorFlow on TSUBAME 4.0

## Access to login node

Access to the login node from your local machine:

```bash
ssh ug03757@login.t4.gsic.titech.ac.jp -YC
```

Note that `ug03757` is user name of [@sfujiwara](https://github.com/sfujiwara).
You have to replace it with your user name.

## Setup

### Clone this repository

```bash
# Clone repository
git clone https://github.com/sfujiwara/tf-on-tsubame.git
```

### Login to GPU node

We have to setup our environment, for example install Python modules, on a computation node with GPU.
Thus, we login to a computation node at first.

```bash
# Logint with interactive job
iqrsh -l h_rt=00:30:00
```

### Run setup script

```bash
cd tf-on-tsubame
```

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
