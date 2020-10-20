#Listing 10.5

use role sysadmin;
create or replace table samples.finance.access_map (
  access_id string,
  account string
);

# add access to tech companies for my account
insert into samples.finance.access_map 
	values('GRP_1', current_account());

# add access to tech companies for my account
insert into samples.finance.access_map 
	values('GRP_2', '<consumer_account>');
commit;

select * from samples.finance.access_map;
