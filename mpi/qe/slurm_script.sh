#!/bin/bash
#SBATCH --job-name=mpi_test
#SBATCH --time=00:30:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun --bind-to core -np $SLURM_NTASKS pw.x -i input.inp