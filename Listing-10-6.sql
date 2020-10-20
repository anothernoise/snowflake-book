#Listing 10.6

create or replace schema samples.public;

create or replace secure view samples.public.stocks as
select sd.symbol, 
	sd.date, 
	sd.time, 
	sd.bid_price, 
	sd.ask_price, 
	sd.bid_cnt, 
	sd.ask_cnt
from samples.finance.stocks_data sd
join samples.finance.access_map am 
  on sd.access_id = am.access_id
 and am.account = current_account();

grant select on samples.public.stocks to public;
