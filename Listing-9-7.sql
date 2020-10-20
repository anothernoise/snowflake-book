#Listing 9.7

select f.*
 from stock_json s, 
table(flatten(val:data)) f;
