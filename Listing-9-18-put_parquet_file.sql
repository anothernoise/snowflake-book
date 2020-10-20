#Listing 9.18
use warehouse "COMPUTE_WH_TEST"; use "DEMO_DB"."PUBLIC";
put file:///Path/to/File/stock_sample3.parquet @my_parquet_stage auto_compress=true;
# extract and mapping values than copy data in the table
copy into demo_parquet
    from (select
             $1:symbol::varchar,
$1:name::varchar,
$1:price::number(10,2), to_timestamp($1:last_trade_time::number) from @my_parquet_stage/stock_sample3.parquet
)
file_format = (format_name = myparquetformat) on_error = 'skip_file'
;