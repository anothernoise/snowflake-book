#Listing 9.17
use warehouse "COMPUTE_WH_TEST";
use "DEMO_DB"."PUBLIC";
create or replace table demo_parquet (
  symbol varchar,
  name   varchar,
  price  number(10,2),
  last_trade_time timestamp
);
create or replace file format myparquetformat type = 'PARQUET';
create or replace stage my_parquet_stage file_format = myparquetformat;
