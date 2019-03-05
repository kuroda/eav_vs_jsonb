# EAV vs JSONB

Compare performance and storage efficiency between the Entity-Attribute-Value
(EAV) model and the simple data model with JSONB datatype.

Benchmarks are measured on Alpine 3.9 and PostgreSQL 11 using Phoenix.

## Requirements

* macOS or Linux
* Docker 18 or later
* Docker Compose 1.13 or later

## Setting up

```
$ git clone https://github.com/kuroda/eav_vs_jsonb.git
$ cd eav_vs_jsonb
$ ./setup.sh
$ docker-compose up -d
```
