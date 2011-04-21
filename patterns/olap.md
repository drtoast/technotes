# Online Application Processing

# star schema

* simplest style of data warehouse schema
* 1 fact table
* connected to many dimension tables, not normalized
* no joins deeper than 2 levels

# snowflake schema

* more like our catalog database
* 1 fact table
* connected to many dimension tables
* each dimension can be normalized into multiple related tables

# OLAP cube

measures categorized by dimensions