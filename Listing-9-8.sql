#Listing 9.8

select  
  s.val:message::string as msg,
  s.val:symbols_requested::int as smbl_rqstd,
  s.val:symbols_returned::int as smbl_rtrnd,
  f.value:symbol::string as smbl,
  f.value:name::string as smbl_name,
  f.value:currency::string as smbl_currency,
  f.value:price::float as prc
 from stock_json s, 
table(flatten(val:data)) f;