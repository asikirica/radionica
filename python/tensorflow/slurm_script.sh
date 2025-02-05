#!/bin/bash
#SBATCH --job-name=tensorflow
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=256MB
#SBATCH --output=py-%j.out
#SBATCH --partition=RC232
#SBATCH --exclusive

python tensorflow_study.py
