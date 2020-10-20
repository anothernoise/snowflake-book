#Listing 9.11

# 1. Install Java by https://java.com/en/download/ or use packages manager for your OS 
# 2. Download AVRO-Tools https://avro.apache.org/docs/1.9.0/
# 3. Check and fix names of files
# 4. Run the command

java -jar ./avro-tools-1.9.0.jar fromjson --schema-file stock_sample2.avsc stock_sample2.json > stock_sample2.avro