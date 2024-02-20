#!/bin/bash
#SBATCH --job-name=gpu_test
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=gpu-%j.out
#SBATCH --partition=comp_gpu

./vectorAdd