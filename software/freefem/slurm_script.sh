#!/bin/bash
#SBATCH --job-name=freefem
#SBATCH --time=00:30:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4096MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

FreeFem++ he.edp