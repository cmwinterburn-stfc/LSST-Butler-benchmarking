dbset db pg
dbset bm TPC-H

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpch pg_tpch_superuser $::env(PG_USER)
diset tpch pg_tpch_superuserpass $::env(PG_PASS)
diset tpch pg_tpch_user $::env(PG_USER)
diset tpch pg_tpch_pass $::env(PG_PASS)
diset tpch pg_tpch_dbase $::env(PG_TPCH_DBASE)

diset tpch pg_scale_fact $::env(SCALE_FACT)
diset tpch pg_num_tpch_threads $::env(THREADS)

print dict

puts "SCHEMA BUILD STARTED - scale factor $::env(SCALE_FACT)"
buildschema
puts "SCHEMA BUILD COMPLETE"