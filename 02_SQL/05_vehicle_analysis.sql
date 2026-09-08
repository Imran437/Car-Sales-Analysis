-- Vehicle Analysis


-- 01. Sales by Company


SELECT
company,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY company
ORDER BY total_sales DESC;


-- 02. Sales by Model

SELECT
model,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY model
ORDER BY total_sales DESC;


-- 03. Sales by Engine

SELECT
engine,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY engine
ORDER BY total_sales DESC;


-- 04. Sales by Transmission


SELECT
transmission,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY transmission
ORDER BY total_sales DESC;

-- 05. Sales by Color


SELECT
color,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY color
ORDER BY total_sales DESC;


-- 06. Sales by Body Style

SELECT
body_style,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales,
AVG(price) AS average_price
FROM car_sales
GROUP BY body_style
ORDER BY total_sales DESC;