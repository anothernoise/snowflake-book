#Listing 14.1

show parameters like '%DATA_RETENTION%' in account; alter account set DATA_RETENTION_TIME_IN_DAYS = 2;
show parameters like '%DATA%_RETENTION' in database samples; 

alter database samples
set DATA_RETENTION_TIME_IN_DAYS = 1;