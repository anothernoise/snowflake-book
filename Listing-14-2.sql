#Listing 14.2

create or replace table samples.finance.stocks ( 
	id int,
    symbol string,
    name string);

insert into samples.finance.stocks values
	(1,'TDC', 'Teradata'),
	(2,'ORCL', 'Oracle'), 
	(3,'TSLA', 'Tesla');

select * from samples.finance.stocks;