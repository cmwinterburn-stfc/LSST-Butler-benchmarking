dbset db pg
dbset bm TPC-H

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpch pg_tpch_user $::env(PG_USER)
diset tpch pg_tpch_pass $::env(PG_PASS)
diset tpch pg_tpch_dbase $::env(PG_TPCH_DBASE)
diset tpch pg_scale_fact $::env(SCALE_FACT)

diset tpch pg_degree_of_parallel $::env(DOP)
diset tpch pg_verbose $::env(VERBOSE)

print dict

vuset vu $::env(VUS)

loadscript
vucreate
vurun