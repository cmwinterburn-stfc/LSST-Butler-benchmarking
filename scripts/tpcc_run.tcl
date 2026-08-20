dbset db pg
dbset bm TPC-C

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpcc pg_user $::env(PG_USER)
diset tpcc pg_pass $::env(PG_PASS)
diset tpcc pg_dbase $::env(PG_TPCC_DBASE)
diset tpcc pg_count_ware $::env(WAREHOUSES)

diset tpcc pg_driver timed
diset tpcc pg_rampup $::env(RAMPUP)
diset tpcc pg_duration $::env(DURATION)
diset tpcc pg_timeprofile $::env(TIMEPROFILE)

print dict

vuset vu $::env(VUS)

loadscript
vucreate
vurun