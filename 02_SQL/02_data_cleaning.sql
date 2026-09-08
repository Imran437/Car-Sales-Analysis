-- Data Cleaning and Validation

-- A. Data Overview

-- 01. Top 10 Rows

SELECT TOP 10 *
FROM car_sales;

-- 02. Total Number of Rows

SELECT
COUNT(*) AS total_rows
FROM car_sales;

-- 23906 rows

-- 03. Check Column name and Datatypes

SELECT 
    COLUMN_NAME,
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'car_sales'
  AND TABLE_SCHEMA = 'dbo';


-- Data Quality Checks


-- 01. Check Duplicate Values

SELECT
car_id, COUNT(*) AS cnt
FROM car_sales
GROUP BY car_id
HAVING COUNT(*) > 1;

-- Check duplicate car IDs before enforcing uniqueness

-- 02. Check Missing Values or Null Value for important column

SELECT 
    SUM(CASE WHEN car_id IS NULL THEN 1 ELSE 0 END) AS car_id_null,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS sale_date_null,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS customer_name_null,
    SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS annual_income_null,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_null,
    SUM(CASE WHEN company IS NULL THEN 1 ELSE 0 END) AS company_null,
    SUM(CASE WHEN model IS NULL THEN 1 ELSE 0 END) AS model_null,
    SUM(CASE WHEN transmission IS NULL THEN 1 ELSE 0 END) AS transmission_null,
    SUM(CASE WHEN color IS NULL THEN 1 ELSE 0 END) AS color_null,
    SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
    SUM(CASE WHEN dealer_region IS NULL THEN 1 ELSE 0 END) AS dealer_region_null,
    SUM(CASE WHEN dealer_no IS NULL THEN 1 ELSE 0 END) AS dealer_no_null,
    SUM(CASE WHEN engine IS NULL THEN 1 ELSE 0 END) AS engine_null
FROM car_sales;

-- All values are 0. There is no missing values.


-- 03. Check Blank Strings

SELECT *
FROM car_sales 
WHERE TRIM(car_id) = ''
   OR TRIM(customer_name) = ''
   OR TRIM(gender) = ''
   OR TRIM(dealer_name) = ''
   OR TRIM(company) = ''
   OR TRIM(model) = ''
   OR TRIM(engine) = ''
   OR TRIM(transmission) = ''
   OR TRIM(color) = ''
   OR TRIM(dealer_no) = ''
   OR TRIM(body_style) = ''
   OR TRIM(phone) = ''
   OR TRIM(dealer_region) = '';




-- 04. Check Extra Space in categorical columns


SELECT *
FROM car_sales
WHERE customer_name <> TRIM(customer_name)
   OR gender <> TRIM(gender)
   OR dealer_name <> TRIM(dealer_name)
   OR company <> TRIM(company)
   OR model <> TRIM(model)
   OR engine <> TRIM(engine)
   OR transmission <> TRIM(transmission)
   OR color <> TRIM(color)
   OR dealer_region <> TRIM(dealer_region);


-- C. Data Cleaning

-- 01. Convert Date Colum FROM VARCHAR to DATE


SELECT DISTINCT sale_date
FROM car_sales;

-- Some Date have Space between hyphen and some not we will correct them and Date is in DD-MM-YYYY format.

-- Update the sale_date column and Remove the extra space

UPDATE car_sales
SET sale_date = TRIM(sale_date);

-- We need YYYY-MM-DD format to convert it into Date
-- Change sale_date into Date FROM string Date Formatted


-- Step 1: Update existing string values to standard YYYY-MM-DD format
UPDATE car_sales
SET sale_date = CONVERT(VARCHAR, CONVERT(DATE, sale_date, 105), 23)
WHERE sale_date IS NOT NULL;

-- Step 2: Change the column data type to DATE

ALTER TABLE car_sales
ALTER COLUMN sale_date DATE NOT NULL;


-- 02. Engine Cleaning

SELECT DISTINCT engine
FROM car_sales;

-- Replace Double-'aOverhead Camshaft With Double Overhead Camshaft

UPDATE car_sales
SET engine = 'Double Overhead Camshaft'
WHERE engine = 'Double-·Overhead Camshaft';



-- Data Validation 

-- 01. Numerical column Vildation 

-- Annual Income - Check if annual_income is 0 or negative

SELECT car_id, customer_name, annual_income
FROM car_sales
WHERE annual_income IS NULL OR annual_income <= 0;


-- Price - Check if price is 0 or negative

SELECT *
FROM car_sales
WHERE price IS NULL OR price <= 0;



-- 02. Date Validation

SELECT 
MIN(sale_date) AS min_sale_date,
MAX(sale_date) AS max_sale_date
FROM car_sales;



-- 03. Categorical columns Validation

-- Gender - Check if there are inconsistent values

SELECT DISTINCT gender
FROM car_sales;

-- Also check Frquency

SELECT gender,
COUNT(*) AS total_records
FROM car_sales
GROUP BY gender;



-- Company

SELECT 
DISTINCT company
FROM car_sales


-- Dealer Region

SELECT 
DISTINCT dealer_region
FROM car_sales;

-- Transmission

SELECT
DISTINCT transmission
FROM car_sales;

-- Engine

SELECT 
DISTINCT engine
FROM car_sales;


-- Color

SELECT 
DISTINCT color
FROM car_sales;

-- Model

SELECT 
DISTINCT model
FROM car_sales;



-- 04. Phone number Validation

SELECT *
FROM car_sales
WHERE phone IS NULL OR LEN(TRIM(phone)) < 7;


-- 05. Dealer Number Validation


SELECT 
    car_id,
    dealer_no
FROM car_sales
WHERE dealer_no NOT LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]';



-- 06. Check Outliers

-- In Annual Income 

SELECT 
MIN(annual_income) AS min_income,
MAX(annual_income) AS max_income,
AVG(annual_income) AS avg_income
FROM car_sales;

-- In Price

SELECT 
MIN(price) AS min_price,
MAX(price) AS max_price,
AVG(price) AS avg_price
FROM car_sales;









