import os
import sys
import time
import ray
from collections import Counter

# initialize ray and set ncpus
num_cpus = int(sys.argv[1])
ray.init(address=os.environ["ip_head"])
print(f"This cluster consists of {len(ray.nodes())} nodes and {ray.cluster_resources()['CPU']} CPUs.")

# remote function
@ray.remote
def f():
    time.sleep(1)
    return ray._private.services.get_node_ip_address()

# The following takes one second (assuming that ray was able to access all of the allocated nodes).
for i in range(60):
    start = time.time()
    ip_addresses = ray.get([f.remote() for _ in range(num_cpus)])
    print(Counter(ip_addresses))
    end = time.time()
    print(end - start)