#Listing 10.2

use role accountadmin;
create or replace share stocks_share;
show shares;

grant usage on database samples to share stocks_share;
grant usage on schema samples.finance to share stocks_share; 
grant select on table samples.finance.stocks_data to share stocks_share;
show grants to share stocks_share;

alter share stocks_share add accounts=<consumer_account>;
