
#create or replace table demo_xml (val variant);
use warehouse "COMPUTE_WH_TEST"
use "DEMO_DB"."PUBLIC";

select * from demo_xml


select val:"$" from demo_xml;

SELECT XMLGET(val, 'row',0):"$" from demo_xml;

SELECT
xml_doc_val.index,
xml_doc_val.value
FROM demo_xml,
LATERAL FLATTEN(to_array(demo_xml.val:"$" )) xml_doc,
LATERAL FLATTEN(to_array(xml_doc.VALUE:"$" )) xml_doc_val;


select 
XMLGET( xml_doc_val.value, 'jurisdiction_name' ):"$" as "jurisdiction name",
XMLGET( xml_doc_val.value, 'count_participants' ):"$" as "count_participants",
XMLGET( xml_doc_val.value, 'count_female' ):"$" as "count_female",
XMLGET( xml_doc_val.value, 'count_male' ):"$" as "count_male"
from demo_xml,
LATERAL FLATTEN(to_array(demo_xml.val:"$" ))   xml_doc,
LATERAL FLATTEN(to_array(xml_doc.VALUE:"$" ))  xml_doc_val;


---

"DEMO_DB"."PUBLIC"

insert into stock_json select parse_json('{"message":"This request is for demonstration purposes only. If you wish to use our API, please sign up and get your personal API token for free.","symbols_requested":3,"symbols_returned":3,"data":[{"symbol":"AAPL","name":"Apple Inc.","currency":"USD","price":"204.23","price_open":"203.35","day_high":"205.08","day_low":"202.90","52_week_high":"233.47","52_week_low":"142.00","day_change":"-0.18","change_pct":"-0.09","close_yesterday":"204.41","market_cap":"931954556928","volume":"16700476","volume_avg":"27522800","shares":"4601079808","stock_exchange_long":"NASDAQ Stock Exchange","stock_exchange_short":"NASDAQ","timezone":"EDT","timezone_name":"America/New_York","gmt_offset":"-14400","last_trade_time":"2019-07-05 16:00:01"},{"symbol":"HSBA.L","name":"HSBC Holdings plc","currency":"GBX","price":"672.50","price_open":"670.60","day_high":"674.80","day_low":"668.70","52_week_high":"736.00","52_week_low":"596.40","day_change":"0.90","change_pct":"0.13","close_yesterday":"671.60","market_cap":"1316319306052","volume":"13672411","volume_avg":"24669371","shares":"20282269262","stock_exchange_long":"London Stock Exchange","stock_exchange_short":"LSE","timezone":"BST","timezone_name":"Europe/London","gmt_offset":"3600","last_trade_time":"2019-07-05 16:39:28"},{"symbol":"MSFT","name":"Microsoft Corporation","currency":"USD","price":"137.06","price_open":"135.94","day_high":"137.33","day_low":"135.72","52_week_high":"138.40","52_week_low":"93.96","day_change":"-0.40","change_pct":"-0.29","close_yesterday":"137.46","market_cap":"1043541917696","volume":"14916173","volume_avg":"22152314","shares":"7662819840","stock_exchange_long":"NASDAQ Stock Exchange","stock_exchange_short":"NASDAQ","timezone":"EDT","timezone_name":"America/New_York","gmt_offset":"-14400","last_trade_time":"2019-07-05 16:00:01"}]}');

Select * from stock_json;


select val:message::string as msg,
	  val:symbols_requested::int as smbl_rqstd,
      val:symbols_returned::int as smbl_rtrnd
from stock_json;


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


select f.value,
       f.value:"52_week_high"::float as _52_week_high,
      from stock_json s, 
table(flatten(val:data)) f
;






