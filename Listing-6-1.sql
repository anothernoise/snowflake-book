#Listing 6.1

#create a new database for testing snowpipe
create database snowpipe data_retention_time_in_days = 1; 
show databases like 'snow%';

# create a new external stage
create or replace stage snowpipe.public.snowstage url='S3://<your_s3_bucket>'
credentials=(
AWS_KEY_ID='<your_AWS_KEY_ID>', AWS_SECRET_KEY='<your_AWS_SEKRET_KEY>');
# create target table for Snowpipe
create or replace table snowpipe.public.snowtable(
    jsontext variant
);

# create a new pipe
create or replace pipe snowpipe.public.snowpipe
auto_ingest=true as
copy into snowpipe.public.snowtable from @snowpipe.public.snowstage file_format = (type = 'JSON');
