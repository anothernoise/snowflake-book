#Listing 9.12

use warehouse "COMPUTE_WH_TEST";
use "DEMO_DB"."PUBLIC";
create or replace table c (val variant);
create or replace file format myavroformat type = 'AVRO';
create or replace stage my_avro_stage file_format = myavroformat;

