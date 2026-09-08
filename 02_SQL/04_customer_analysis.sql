-- Customer Analysis


-- 01. Sales by Gender

SELECT
gender,
SUM(price) AS total_sales
FROM car_sales
GROUP BY gender
ORDER BY total_sales DESC;

-- 02. Income Distribution

WITH income_group_cte AS(
SELECT car_id, annual_income,
CASE
WHEN annual_income < 50000 THEN 'Below 50k'
WHEN annual_income < 100000 THEN '50k-100k'
WHEN annual_income < 150000 THEN '100k-150k'
WHEN annual_income < 200000 THEN '150k-200k'
ELSE '200k+'
END AS income_group
FROM car_sales
)
SELECT income_group, COUNT(*) AS total_customers
FROM income_group_cte
GROUP BY income_group
ORDER BY total_customers DESC;


-- 03. Average Income by Gender

SELECT
gender,
AVG(annual_income) AS avg_annual_income
FROM car_sales
GROUP BY gender
ORDER BY avg_annual_income DESC;
