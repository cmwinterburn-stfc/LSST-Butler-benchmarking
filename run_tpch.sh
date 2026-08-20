#!/bin/bash

timestamp=$(date +%Y%m%d-%H%M%S)

echo "Running TPCH: VUS=${TPCH_VUS} SCALE_FACT=${SCALE_FACT} DOP=${DOP}"

docker exec \
    -e VUS="$TPCH_VUS" \
    -e SCALE_FACT="$SCALE_FACT" \
    -e DOP="$DOP" \
    -e VERBOSE="$VERBOSE" \
    hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpch_run.tcl \
    2>&1 | tee "results/tpch-${TPCH_VUS}vu-${timestamp}.log"