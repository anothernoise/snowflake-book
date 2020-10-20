#Listing 9.14

select val:symbol::string as symbol,
	val:name::string as name, 
	TO_TIMESTAMP(val:last_trade_time::number) as last_trade_time,
	val:price::number(10,2) as price
  from demo_avro;
