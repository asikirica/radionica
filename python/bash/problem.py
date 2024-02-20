import random as rd
import time

with open('case.txt', 'a') as file:
    for i in range(1000):
        file.write(f'Number {i}: {rd.random()} \n')
time.sleep(90)