#Listing 10.4

use role sysadmin;

alter table samples.finance.stocks_data
  add column access_id string;

update finance.stocks_data set access_id = 'GRP_1'
where id in (1,2,3,4);

update finance.stocks_data set access_id = 'GRP_2'
where id in (5,6);

commit;

select * from samples.finance.stocks_data;