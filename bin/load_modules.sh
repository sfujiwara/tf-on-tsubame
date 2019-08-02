#!/bin/bash

module purge
module load python/3.6.5
module load cuda/10.0.130
module load intel cuda openmpi

# Show loaded modules
module list
