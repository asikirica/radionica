#!/bin/bash
#SBATCH --job-name=mpi_test
#SBATCH --time=00:10:00
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

./sum