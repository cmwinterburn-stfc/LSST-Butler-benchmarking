#!/bin/bash

timestamp=$(date +%Y%m%d-%H%M%S)

echo "Running TPCC: VUS=${TPCC_VUS} WAREHOUSES=${WAREHOUSES} rampup=${RAMPUP} duration=${DURATION}"

docker exec \
    -e VUS="$TPCC_VUS" \
    -e WAREHOUSES="$WAREHOUSES" \
    -e RAMPUP="$RAMPUP" \
    -e DURATION="$DURATION" \
    -e TIMEPROFILE="$TIMEPROFILE" \
    hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpcc_run.tcl \
    2>&1 | tee "results/tpcc-${VUS}vu-${timestamp}.log"