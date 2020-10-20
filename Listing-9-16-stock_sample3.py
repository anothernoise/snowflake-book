import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
csv_file = 'stock_sample3.csv' parquet_file = 'stock_sample3.parquet' # read data from CSV file
df = pd.read_csv(csv_file)
# check it
print(df.dtypes)
print(df.to_string())
# write the data in parquet file
table = pa.Table.from_pandas(df)
pq.write_table(table, parquet_file, compression='snappy')
