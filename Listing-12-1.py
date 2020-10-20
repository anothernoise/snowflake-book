#Listing 12.1

options = dict(sfUrl="<your_snowflake_account>.snowflakecomputing.com", sfUser="<user>", sfPassword="<password>", sfDatabase= "SNOWFLAKE_SAMPLE_DATA", sfSchema= "TPCH_SF1", sfWarehouse= "SMALL_COMPUTE_WH")

df = spark.read \
    .format("snowflake") \
    .options(**options) \
    .option("dbtable", "ORDERS") \
    .load()

display(df)


df.write \
    .format("snowflake") \
    .options(sfOptions) \
    .option("dbtable", "sampletable") \
    .mode(SaveMode.Overwrite) \
    .save() \
