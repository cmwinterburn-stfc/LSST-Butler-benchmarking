.PHONY: up down build run scale

VUS ?= 8
TCPH-VUS ?= 1

up:
	docker compose up -d

down:
	docker compose down

build:
	docker exec hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpcc_build.tcl

run:
	./run.sh $(VUS)

scale:
	./scale.sh

build-tpch:
	docker exec hammerdb /home/HammerDB-5.0/hammerdbcli auto /scripts/tpch_build.tcl

run-tpch:
	./run_tpch.sh $(TCPH-VUS)

scale-tpch:
	./scale_tpch.sh
