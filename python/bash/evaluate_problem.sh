#!/bin/bash
#SBATCH --job-name=case
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1024MB
#SBATCH --partition=computes_thin

python3 problem.py