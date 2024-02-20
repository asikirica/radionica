#!/bin/bash
#SBATCH --job-name=gromacs
#SBATCH --time=00:30:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2048MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun -np $SLURM_NTASKS gmx_mpi mdrun -deffnm MD_5NM_WATER -nsteps 10000