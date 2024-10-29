1. Create a new database
   Name: PROJECT_01
2. create a 3 schemas in database PROJECT_01
   Names: RAW, INTEGRATION, ANALYTICS
3. write a UDF function named "CALCULATE_TOTAL_SALES" which takes 2 arguments (i.e. quantity, price_per_unit) and return "total_sales" as output
4. Create an internal stage in RAW schema
5. Write a SP named "LOAD_RAW_DATA" to do below steps (use COPY INTO)
   5.1. load file (customer.csv) to RAW.CUSTOMER
   5.2. load file (product.tsv) to RAW.PRODUCT
   5.3. load file (location.txt) to RAW.LOCATION
   5.4. load file (transactions.csv) to RAW.TRANSACTION
6. Write a SP named "LOAD_DIMENSIONS" to do below steps
   6.1. Load incremental data from RAW.CUSTOMER to INTEGRATION.CUSTOMER
   6.2. Load incremental data from RAW.PRODUCT to INTEGRATION.PRODUCT
   6.3. Load incremental data from RAW.LOCATION to INTEGRATION.LOCATION
   6.4. Load incremental data from RAW.TRANSACTION to INTEGRATION.TRANSACTION
7. Orchestrate step 5 and 6 to run every 10minutes
