                                        */

use role sysadmin;

create database samples;
create schema samples.finance;
create or replace table samples.finance.stocks_data (
    rowid int,
    symbol string,
    date date,
    time time(9),
    bid_price float,
    ask_price float,
    bid_cnt int,
    ask_cnt int)
    ---,access_id string /* column for fine-graned  access */ )
    cluster by (date);
          

insert into samples.finance.stocks_data
    values(1,'TDC',dateadd(day,  -1,current_date()), '10:15:00', 36.3, 36.0, 10, 10),
          (2,'TDC',dateadd(month,-2,current_date()), '11:14:00', 36.5, 36.2, 10, 10),
          (3,'ORCL',dateadd(day,  -1,current_date()), '11:15:00',  57.8,  59.9, 13, 13),
          (4,'ORCL',dateadd(month,-2,current_date()), '09:11:00',  57.3,  57.9, 12, 12),
          (5,'TSLA', dateadd(day,  -1,current_date()), '11:01:00', 255.2, 256.4, 22, 22),
          (6,'TSLA', dateadd(month,-2,current_date()), '11:13:00', 255.2, 255.7, 23, 23);

select * from samples.finance.stocks_data;

use ROLE accountadmin;

CREATE or replace SHARE stocks_share;
show shares;

GRANT USAGE ON DATABASE samples TO SHARE stocks_share;
GRANT USAGE ON SCHEMA samples.finance TO SHARE stocks_share;
GRANT SELECT ON TABLE samples.finance.stocks_data TO SHARE stocks_share;

SHOW GRANTS TO SHARE stocks_share;

# create a new account called 

ALTER SHARE stocks_share ADD ACCOUNTS=test_gu41401;


---example 2
use role sysadmin;  

alter table  samples.finance.stocks_data  
 add column access_id string;


update finance.stocks_data
    set access_id = 'GRP_1'
where rowid in (1,2,3,4);

update finance.stocks_data
    set access_id = 'GRP_2'
where rowid in (5,6);
commit;

select * from finance.stocks_data;

select access_id, count(access_id) 
from samples.finance.stocks_data
group by access_id;

--
create or replace table samples.finance.access_map (
  access_id string,
  account string
);

# add access to tech companies for my account
insert into samples.finance.access_map values('GRP_1', current_account());

# add access to tech companies for my account
insert into samples.finance.access_map values('GRP_2', '<consumer_account>');
commit;

select * from samples.finance.access_map;

create or replace schema samples.pubic;

create or replace secure view samples.public.stocks as
    select sd.symbol, sd.date, sd.time, sd.bid_price, sd.ask_price, sd.bid_cnt, sd.ask_cnt
    from samples.finance.stocks_data sd
    join samples.finance.access_map  am on sd.access_id = am.access_id
     and am.account = current_account();

grant select on samples.public.stocks  to public;

select * from samples.public.stocks;

---
select count(*) from samples.finance.stocks_data;
select * from samples.finance.stocks_data;

select count(*) from samples.public.stocks;
select * from samples.public.stocks;

select * from samples.public.stocks where symbol = 'TDC';
----

alter session set simulated_data_sharing_consumer=<account_name>;

select * from samples.public.stocks;

---
use role accountadmin;

create or replace share share_sv;
show shares;

grant usage on database samples to share share_sv;
grant usage on schema samples.public to share share_sv;
grant select on samples.public.stocks to share share_sv;
show grants to share share_sv;

alter share share_sv set accounts = <consumer_accounts>;