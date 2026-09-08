-- Time Analysis


-- 01. Sales by Year


SELECT
YEAR(sale_date) AS sale_year,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales
FROM car_sales
GROUP BY year(sale_date)
ORDER BY sale_year;


-- 02. Sales by Month


SELECT
YEAR(sale_date) AS sale_year,
MONTH(sale_date) AS sale_month,
COUNT(*) AS cars_sold,
SUM(price) AS total_sales
FROM car_sales
GROUP BY year(sale_date), MONTH(sale_date)
ORDER BY sale_year, sale_month;



-- 03. YoY Growth in Sales

WITH yearly_sales AS (
    SELECT
        YEAR(sale_date) AS sale_year,
        COUNT(*) AS cars_sold,
        SUM(price) AS total_sales
    FROM car_sales
    GROUP BY YEAR(sale_date)
),
yoy_analysis AS (
    SELECT
        sale_year,
        cars_sold,
        total_sales,
        LAG(cars_sold) OVER (
            ORDER BY sale_year
        ) AS previous_year_cars,
        LAG(total_sales) OVER (
            ORDER BY sale_year
        ) AS previous_year_sales
    FROM yearly_sales
)
SELECT
    sale_year,
    cars_sold,
    total_sales,
    cars_sold - previous_year_cars AS unit_change,
    total_sales - previous_year_sales AS sales_change,
    ROUND(
        (total_sales - previous_year_sales) * 100.0
        / NULLIF(previous_year_sales, 0),
        2
    ) AS yoy_sales_growth_pct
FROM yoy_analysis
ORDER BY sale_year;