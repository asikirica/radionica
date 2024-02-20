import sys
import ray
import socket
import time
from collections import Counter

# initialize ray and set ncpus for omp mode. required!
num_cpus = int(sys.argv[1])
ray.init(num_cpus=num_cpus)
print(f"This cluster consists of {len(ray.nodes())} nodes and {ray.cluster_resources()['CPU']} CPUs.")

# remote function
@ray.remote
def f():
    time.sleep(0.001)
    return socket.gethostbyname(socket.gethostname())

# jobs to "dispatch"
ip_addresses = ray.get([f.remote() for _ in range(100000)])

# output
for ip_address, num_tasks in Counter(ip_addresses).items():
    print(f'    {num_tasks} tasks on {ip_address}')