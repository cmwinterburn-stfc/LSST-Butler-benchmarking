dbset db pg
dbset bm TPC-C

diset connection pg_host $::env(PG_HOST)
diset connection pg_port $::env(PG_PORT)

diset tpcc pg_superuser $::env(PG_USER)
diset tpcc pg_superuserpass $::env(PG_PASS)
diset tpcc pg_user $::env(PG_USER)
diset tpcc pg_pass $::env(PG_PASS)
diset tpcc pg_dbase $::env(PG_TPCC_DBASE)

print dict

puts "SCHEMA DELETE STARTED"
deleteschema
puts "SCHEMA DELETE COMPLETE"