
#!/bin/bash

VUS=${1:-8}
timestamp=$(date +%Y%m%d-%H%M%S)

echo "Running ${VUS} VUs"

docker exec \
    -e VUS="$VUS" \
    hammerdb \
    /home/HammerDB-5.0/hammerdbcli auto /scripts/tpcc_run.tcl \
    2>&1 | tee "results/tpcc-${VUS}vu-${timestamp}.log"
