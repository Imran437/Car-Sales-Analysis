

-- Overall Sales Performance


-- 01. Total Sales

SELECT
SUM(price) AS total_sales
FROM car_sales;

-- 02. Avg Selling Price

SELECT 
AVG(price) AS avg_selling_price
FROM car_sales;


-- 03. Total Cars Sold

SELECT
COUNT(*) AS total_cars_sold
FROM car_sales;


-- 04. Avg Customer Annual Income

SELECT
AVG(annual_income) AS avg_annual_income
FROM car_sales;
