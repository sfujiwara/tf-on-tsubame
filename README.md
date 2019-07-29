# Distributed TensorFlow on TSUBAME

## Login Node

Access to the login node:

```bash
ssh dlh19u20@login.t3.gsic.titech.ac.jp -i ~/.ssh/t3-key -YC
```

Set `GROUP_NAME`:

```bash
GROUP_NAME=tgz-dlh19g00
```

Note that `dlh19u20` and `tgz-dlh19g00` are user name and group name of @sfujiwara. You have to replace it with your user name.

## Storage

In our case, the shared disk is mounted in `/gs/hs1/${GROUP_NAME}/`. You can check the disk as below:

```
t3-user-info disk group -g ${GROUP_NAME}
```
