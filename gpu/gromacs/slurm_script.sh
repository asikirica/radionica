#!/bin/bash
#SBATCH --job-name=gpu_test
#SBATCH --time=00:60:00
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=gpu-%j.out
#SBATCH --partition=comp_gpu

mpiexec -d $SLURM_NTASKS --cpu-bind depth gmx mdrun -pin on -v -deffnm nvt