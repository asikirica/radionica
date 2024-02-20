#!/bin/bash
#SBATCH --job-name=radioss
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

# solver path
solver=/scratch/opt2/Altair_HW_2021.1/altair/scripts/radioss

# infiniband support
export I_MPI_FABRICS=shm

# hostnames / node names
srun /bin/hostname | sort > hostfile

# run
$solver cube_TYPE7_0000.rad -np $SLURM_NTASKS