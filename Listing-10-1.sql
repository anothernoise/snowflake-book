#Listing 10.1

use role sysadmin;
create database samples;
create schema samples.finance;

create or replace table samples.finance.stocks_data (
    id int,
    symbol string,
    date date,
    time time(9),
    bid_price float,
	ask_price float, 
	bid_cnt int, 
	ask_cnt int
);

insert into samples.finance.stocks_data
values(1,'TDC',dateadd(day, -1,current_date()), '10:15:00', 36.3, 36.0, 10, 10),
(2,'TDC', dateadd(month,-2,current_date()), '11:14:00', 36.5, 36.2, 10, 10),
(3,'ORCL', dateadd(day, -1,current_date()), '11:15:00', 57.8, 59.9, 13, 13),
(4,'ORCL', dateadd(month,-2,current_date()), '09:11:00', 57.3, 57.9, 12, 12),
(5,'TSLA', dateadd(day, -1,current_date()), '11:01:00', 255.2, 256.4, 22, 22),
(6,'TSLA', dateadd(month, -2,current_date()), '11:13:00', 255.2, 255.7, 23, 23);

select * from samples.finance.stocks_data;
