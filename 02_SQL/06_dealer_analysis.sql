-- Dealer Analysis

-- 01. Top 10 Dealers

SELECT TOP 10
dealer_name,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS avg_selling_price
FROM car_sales
GROUP BY dealer_name
ORDER BY total_sales DESC;

-- 02. Bottom 10 Dealers

SELECT TOP 10
dealer_name,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS avg_selling_price
FROM car_sales
GROUP BY dealer_name
ORDER BY total_sales;


-- 03. Sales by Dealers

SELECT
dealer_name,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS avg_selling_price
FROM car_sales
GROUP BY dealer_name
ORDER BY total_sales DESC;


-- 04. Avg Selling Price by Dealers


SELECT
dealer_name,
AVG(price) AS avg_selling_price
FROM car_sales
GROUP BY dealer_name
ORDER BY avg_selling_price DESC;


-- 05. Sales by Dealer Region


SELECT TOP 10
dealer_region,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS avg_selling_price
FROM car_sales
GROUP BY dealer_region
ORDER BY total_sales DESC;