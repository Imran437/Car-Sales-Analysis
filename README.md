# Car-Sales-Analysis

# Description

This repository contains a Power BI project focused on car sales analysis to uncover actionable insights and track key performance indicators (KPIs). It provided a detailed analysis of sales trends, average car sales and total car sold. A custom "Calendar table was created using the "CALENDAR" function in dax, based on the minimum and maximum sales data. Advance time intelligence measures such as year-to-date, month-to-date and year-over-year comparisons were implemented using DAX functions.This Project aims to support data driven decision-making in the automative industry.


# Key Features 

1. KPIs tracked
   - Total Sales
   - Avg Sales
   - Total Car sold
   - YoY and Month to Date (MTD) metrics

# Data Modeling 

- Created a custom 'calendar table' using dax
  Calendar Table = CALENDAR(MIN(car_data[Date]),MAX(car_data[Date]))

- Established relationship between tables to follow the star schema for optimized performance

# DAX functions used 

- Calculate - used for custom filtering and advance measure 
- Sampleperiodlastyear - to calculate year over year metrics 
- TotalYTD - for year to date calculations 
- TotalMTD - for month to date calculations 

# Dashboard and visulizations 

- Interactive dashboard showcasing sales trends and KPIs.
- Line chart, Donut chart, map and tables
- Navigational button and slicers by Transmission, DealerName, Body_style and Engine

# How to use 

1. Download the car sales dashboard from the repository.
2. Open the file in Power BI desktop.
3. Connect to you data source
4. Explore the intreactive dashboard and analyze KPIs.



Author 
Imran Ansari

Feel free to suggest changes or improvement.






