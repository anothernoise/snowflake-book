#Listing 9.13
# Fix the path of the file and run the script

use warehouse "SMALL_COMPUTE_WH";
use "DEMO_DB"."PUBLIC";


put file:///Path/To/stock_sample2.avro @my_avro_stage auto_compress=true;

copy into DEMO_AVRO
  from @my_avro_stage/stock_sample2.avro.gz
  file_format = (format_name = myavroformat)
  on_error = 'skip_file';


