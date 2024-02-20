#!/bin/bash
#SBATCH --job-name=mpi_test
#SBATCH --time=00:30:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=5
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

# set solver
solver=simpleFoam

# modify decomposeParDict and decompose
sed -i "s/numberOfSubdomains.*[0-9][0-9]*;/numberOfSubdomains $SLURM_NTASKS;/g" system/decomposeParDict
decomposePar -fileHandler collated > log.decomposePar

# run
mpirun -np $SLURM_NTASKS $solver -parallel -fileHandler collated > log.LOGGIT 2>&1