.PHONY: up down build run scale build-tpch run-tpch scale-tpch

#TPCC Defaults
#Build
WAREHOUSES ?= 150
BUILD_VUS ?= 4
#Run
RAMPUP ?= 5
DURATION ?= 15
TIMEPROFILE ?= true
TPCC_VUS ?= 1

#TPCH Defaults
#Build
SCALE_FACT ?= 30
THREADS ?= 6
#Run
TPCH_VUS ?= 1
DOP ?= 4
VERBOSE ?= false

export WAREHOUSES BUILD_VUS RAMPUP DURATION TIMEPROFILE TPCC_VUS SCALE_FACT TPCH_VUS DOP THREADS VERBOSE

up:
	docker compose up -d

down:
	docker compose down

build:
	docker exec -e WAREHOUSES=$(WAREHOUSES) \
	    -e BUILD_VUS=$(BUILD_VUS) \
	    hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpcc_build.tcl

run:
	./run_tpcc.sh

scale:
	./scale_tpcc.sh

build-tpch:
	docker exec -e SCALE_FACT=$(SCALE_FACT) \
	    -e THREADS=$(THREADS) \
	    hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpch_build.tcl

run-tpch:
	./run_tpch.sh

scale-tpch:
	./scale_tpch.sh