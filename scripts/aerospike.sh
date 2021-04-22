#!/bin/bash

ycsb_dir="/home/khaled/Documents/khaled/advancedDB/ycsb-0.17.0"
ycsb=$ycsb_dir/bin/ycsb

for i in {a..f}
do
    results_dir=results/aerospike/aerospike_workload${i}_results
    mkdir -p $results_dir
    #$ycsb load aerospike -s -P workloads/workload${i} -threads 1 &&

    for j in {1..5}
    do
        $ycsb run aerospike -s -P workloads/workload${i} -threads 1 > ${results_dir}/aerospike_workload${i}_run${j}_stats 2> ${results_dir}/aerospike_workload${i}_run${j}_log 
    done

done


