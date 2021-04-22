#!/bin/bash

ycsb_dir="/home/khaled/Documents/khaled/advancedDB/ycsb-0.17.0"
ycsb=$ycsb_dir/bin/ycsb

host="-p memcached.hosts=127.0.0.1"

for i in {a..f}
do
    results_dir=results/memcached_workload${i}_results
    mkdir -p $results_dir
    $ycsb load memcached -s -P workloads/workload${i} $host -threads 1 &&

    for j in {1..5}
    do
        $ycsb run memcached -s -P workloads/workload${i} $host -threads 1 > ${results_dir}/memcached_workload${i}_run${j}_stats 2> ${results_dir}/memcached_workload${i}_run${j}_log 
    done

done


