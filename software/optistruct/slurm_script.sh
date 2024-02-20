#!/bin/bash
#SBATCH --job-name=optistruct
#SBATCH --time=00:30:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=computes_thin

# solver path
solver=/scratch/opt2/Altair_HW_2021.1/altair/scripts/optistruct

# infiniband support
export I_MPI_FABRICS=ofi

# hostnames / node names
srun /bin/hostname | sort > hostfile

# run
$solver bridge.fem -np $SLURM_NTASKS