#!/bin/bash
#SBATCH --job-name=ray_mpi
#SBATCH --time=00:10:00
#SBATCH --nodes=3
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=15
#SBATCH --mem-per-cpu=128MB
#SBATCH --output=py-%j.out
#SBATCH --partition=RC232
#SBATCH --exclusive

set -x

let "worker_num=(${SLURM_NTASKS} - 1)"

let "total_cores=${worker_num} * ${SLURM_CPUS_PER_TASK}"

suffix='6379'
ip_head=`hostname`:$suffix
export ip_head

srun --nodes=1 --ntasks=1 --cpus-per-task=${SLURM_CPUS_PER_TASK} --nodelist=`hostname` ray start --head --block --dashboard-host 0.0.0.0 --port=6379 --num-cpus ${SLURM_CPUS_PER_TASK} &
sleep 20

srun --nodes=${worker_num} --ntasks=${worker_num} --cpus-per-task=${SLURM_CPUS_PER_TASK} --exclude=`hostname` ray start --address $ip_head --block --num-cpus ${SLURM_CPUS_PER_TASK} &
sleep 20


# code start
python -u problem.py "$SLURM_CPUS_PER_TASK"
