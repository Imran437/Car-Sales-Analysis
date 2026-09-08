-- Price Analysis


-- 01. Price Statistics


SELECT
MIN(price) AS min_price,
MAX(price) AS max_price,
AVG(price) AS avg_prie
FROM car_sales;


-- 02. Avg Price by Company

SELECT
company,
AVG(price) AS avg_price
FROM car_sales
GROUP BY company
ORDER BY avg_price DESC;


-- 03. Avg Price by Body Style


SELECT
body_style,
AVG(price) AS avg_price
FROM car_sales
GROUP BY body_style
ORDER BY avg_price DESC;