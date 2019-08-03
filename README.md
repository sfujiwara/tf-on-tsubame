# Distributed TensorFlow on TSUBAME 3.0

## Login Node

Access to the login node:

```bash
ssh dlh19u20@login.t3.gsic.titech.ac.jp -i ~/.ssh/t3-key -YC
```

Set `GROUP`:

```bash
GROUP=tgz-dlh19g00
```

Note that `dlh19u20` and `tgz-dlh19g00` are user name and group name of [@sfujiwara](https://github.com/sfujiwara). You have to replace it with your user name.

## Setup

### Clone this repository

```bash
git clone https://github.com/sfujiwara/tf-on-tsubame.git
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
- Create virtual environment `tf` for Python
- Install Python modules

## Storage

- `/home/0/${USER}`
  - Home directory to be installed some softwares for the user
  - `echo ${HOME}`
- `/gs/hs1/${GROUP}/`
  - Shared storage to be save large data (for machine learning)

```
t3-user-info disk group -g ${GROUP_NAME}
```
