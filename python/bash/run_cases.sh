#!/bin/bash

for i in {1..10}
do
	mkdir test_folder_$i
	cp evaluate_problem.sh test_folder_$i/
	cp problem.py test_folder_$i/
	cd test_folder_$i
	sed -i "s/1000/$i/g" problem.py
	sed -i "s/case/$i/g" problem.py
	sed -i "s/case/$i/g" evaluate_problem.sh
	eval "sbatch evaluate_problem.sh"
	echo "case $i started ..."
	cd ..
done
