#Listing 9.6

select val:message::string as msg,
	  val:symbols_requested::int as smbl_rqstd,
      val:symbols_returned::int as smbl_rtrnd
from stock_json;

select * from stock_json;