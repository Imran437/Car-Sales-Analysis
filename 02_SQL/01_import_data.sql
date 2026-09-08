-- 01. Create Database for Car Sales Data


CREATE DATABASE car_sales_db;

-- Use Database

USE car_sales_db;


-- 02. table for car_sales data


CREATE TABLE car_sales(
    car_id VARCHAR(50) PRIMARY KEY,
    sale_date VARCHAR(30) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    annual_income DECIMAL(10,2),
    dealer_name VARCHAR(100) NOT NULL,
    company VARCHAR(50) NOT NULL,
    model VARCHAR(50)NOT NULL,
    engine VARCHAR(50),
    transmission VARCHAR(50),
    color VARCHAR(20),
    price DECIMAL(10,2) NOT NULL,
    dealer_no VARCHAR(20),
    body_style VARCHAR(20),
    phone VARCHAR(20),
    dealer_region VARCHAR(50) NOT NULL
);




-- 03. import the CSV files


BULK INSERT car_sales
FROM 'C:/Work/Projects/Car-Sales-Analysis/01_Data/Car_sales_csv.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);


-- 04. Check if data successfully import or not

SELECT TOP 10 * 
FROM car_sales; 

-- 05. check total rows if all rows import or not

SELECT
COUNT(*) AS total_rows
FROM car_sales;

-- 23906 All rows are import.


-- We have converted sale_date into VARCHAR(30) because some dates are in differern format.

-- We will change it into DATE datatype in data cleaning steps.

