#!/bin/bash

python3 -m venv tf
source tf/bin/activate

python3.6 -m pip install -U pip
pip install tensorflow-gpu==1.14.0
pip install horovod==0.13.11
