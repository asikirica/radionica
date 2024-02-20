#!/bin/bash
#SBATCH --job-name=omp_test
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=128MB
#SBATCH --output=omp-%j.out
#SBATCH --partition=computes_thin

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

./pi 100000 $SLURM_CPUS_PER_TASK

