dbset db pg
dbset bm TPC-H

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpch pg_tpch_superuser $::env(PG_USER)
diset tpch pg_tpch_superuserpass $::env(PG_PASS)
diset tpch pg_tpch_user $::env(PG_USER)
diset tpch pg_tpch_pass $::env(PG_PASS)
diset tpch pg_tpch_dbase $::env(PG_TPCH_DBASE)

print dict

puts "SCHEMA DELETE STARTED"
deleteschema
puts "SCHEMA DELETE COMPLETE"