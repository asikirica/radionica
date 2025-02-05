#!/bin/bash
#SBATCH --job-name=ray_omp
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=256MB
#SBATCH --output=py-%j.out
#SBATCH --partition=RC232

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

python problem.py "$OMP_NUM_THREADS"
