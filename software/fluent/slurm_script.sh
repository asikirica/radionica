#!/bin/bash
#SBATCH --job-name=fluent
#SBATCH --time=00:60:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=22
#SBATCH --mem-per-cpu=1024MB
#SBATCH --output=logit-%j.out
#SBATCH --partition=RC232

# set solver
fluentpath=<PATH>/ANSYS21/v211/fluent/bin

# modify .jou script
sed -i "4s@<PATH>@$(pwd)@" simulation.jou

# run
$fluentpath/fluent 3ddp -meshing -g -t$SLURM_NTASKS -i simulation.jou > simulation.out 2>&1
