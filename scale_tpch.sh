#!/bin/bash
# VU=1 is the TPC-H Power test (single stream, no contention -- raw per-query performance).
# VU=2 and VU=4 are Throughput test points (concurrent streams -- contention behavior).
# Kept low given 4 physical cores and max_parallel_workers_per_gather=2.

timestamp=$(date +%Y%m%d-%H%M%S)

for vus in 1 2 4
do
    echo "Running ${vus} VUs"

    docker exec \
        -e VUS="$vus" \
        hammerdb \
        /home/HammerDB-5.0/hammerdbcli auto /scripts/tpch_run.tcl \
        2>&1 | tee "results/tpch-${vus}vu-${timestamp}.log"

done