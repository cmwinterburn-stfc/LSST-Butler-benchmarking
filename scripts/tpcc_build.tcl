dbset db pg
dbset bm TPC-C

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpcc pg_superuser $::env(PG_USER)
diset tpcc pg_superuserpass $::env(PG_PASS)
diset tpcc pg_user $::env(PG_USER)
diset tpcc pg_pass $::env(PG_PASS)
diset tpcc pg_dbase $::env(PG_TPCC_DBASE)

diset tpcc pg_count_ware $::env(WAREHOUSES)
diset tpcc pg_num_vu 4

print dict

puts "SCHEMA BUILD STARTED - $::env(WAREHOUSES) warehouses"
buildschema
puts "SCHEMA BUILD COMPLETE"