#Listing 10.8

use role accountadmin;
show shares;

create database shared_views_db from share <provider_ account>.share_sv;
grant imported privileges on database shared_views_db to sysadmin;

use role sysadmin;
show views;

use warehouse <warehouse_name>;
select * from stocks;

