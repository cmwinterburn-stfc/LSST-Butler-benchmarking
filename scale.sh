#!/bin/bash
# Full sweep for a "tuned config" comparison run (Run B on PG16, Run C on PG18).
# For a "default config" baseline run (Run A / Run D), call run.sh manually with
# just the reduced set: 1, 8, 32, 64

timestamp=$(date +%Y%m%d-%H%M%S)

for vus in 1 2 4 8 16 32 64 128
do
    echo "Running ${vus} VUs"

    docker exec \
        -e VUS="$vus" \
        hammerdb \
        /home/HammerDB-5.0/hammerdbcli auto /scripts/tpcc_run.tcl \
        2>&1 | tee "results/tpcc-${vus}vu-${timestamp}.log"

done