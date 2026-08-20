# LSST-Butler-benchmarking

Benchmarking harness for PostgreSQL using HammerDB, running TPC-C and TPC-H workloads via Docker.

Benchmarks are designed to generate a standardised saturating workload on a database. TPC-C simulates OLTP, and TPC-H simulates OLAP. 

Concepts:
     - VU is a virtual user, simulating a single applciation session.
     - TPC-C simulates a retail schema. Number of warehouses is analagous to the scale of the schema.
     - TPC-H scale factor determines the size of the schema. It is configurable, with default set to SF30 ~ 62GB total size.

Detailed information on the benchmarking spec is available at https://www.hammerdb.com/docs3.3/


## Setup

1. Create a dedicated benchmarking PostgreSQL user account on the host. Ensure the user has priveleges:
    - rolcreatedb
    - rolcreaterole
    - pg_monitor
2. Copy `.env.example` to `.env` and fill in your database connection details.
3. Start the container:

```bash
make up
```

## Usage

There are three execution modes given per benchmark:
    - Build creates a dedicated schema for benchmarking and loads the data. The schema must exist before a run or scale.
    - Run executes a single run with a fixed number of virtual users, default = 1.
    - Scale executes sequential runs, doubling concurrent virtual users with each pass. This is designed to identify performance bottlenecks. 

```bash
# TPC-C
make build 
make run   
make scale    

# TPC-H
make build-tpch
make run-tpch
make scale-tpch
```

Benchmark settings (VUs, warehouses, scale factor, etc.) have defaults built into the Makefile, and can be overridden per run, e.g.:

```bash
make run TPCH_VUS=4
```

Results are saved as timestamped logs in `results/`. 
Geometric mean query time is the key metric, with wall time per query and per user useful to investigate outliers.
Verbose mode is defaulted to false because of the network overhead on larger jobs. For targeted ivestigation, this setting outputs all SQL executed and results returned to the log file.