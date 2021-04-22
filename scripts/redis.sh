#!/bin/bash

ycsb_dir="/home/khaled/Documents/khaled/advancedDB/ycsb-0.17.0"
ycsb=$ycsb_dir/bin/ycsb
host="-p redis.host=127.0.0.1 -p redis.port=6379"

for i in {a..f}
do
    results_dir=redis_workload${i}_results
    mkdir -p $results_dir
    $ycsb load redis -s -P workloads/workload${i} $host -threads 1 &&

    for j in {1..5}
    do
        $ycsb run redis -s -P workloads/workload${i} $host -threads 1 > ${results_dir}/redis_workload${i}_run${j}_stats 2> ${results_dir}/redis_workload${i}_run${j}_log 
    done

done


