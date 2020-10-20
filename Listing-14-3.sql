#Listing 14.3

insert into samples.finance.stocks values(5,'MSFT', 'Microsoft');

delete from samples.finance.stocks
where id = 3;

select * from samples.finance.stocks; 
select * from samples.finance.stocks at (offset => -1*60);
