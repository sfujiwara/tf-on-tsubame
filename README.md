# Distributed TensorFlow on TSUBAME

## Login Node

Access to the login node:

```bash
ssh dlh19u20@login.t3.gsic.titech.ac.jp -i ~/.ssh/t3-key -YC
```

Set `GROUP`:

```bash
GROUP=tgz-dlh19g00
```

Note that `dlh19u20` and `tgz-dlh19g00` are user name and group name of @sfujiwara. You have to replace it with your user name.

## Setup

```bash
qrsh -g $GROUP -l s_gpu=1 -l h_rt=00:10:00
```

## Storage

- `/home/0/${USER}`
  - Home directory to be installed some softwares for the user
  - `echo ${HOME}`
- `/gs/hs1/${GROUP}/`
  - Shared storage to be save large data (for machine learning)

```
t3-user-info disk group -g ${GROUP_NAME}
```
