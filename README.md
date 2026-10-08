# Zepto_SQL_Practice_Project

A comprehensive SQL data analysis and cleaning project based on quick-commerce dataset parameters (inspired by Zepto). This repository contains raw data, data cleaning scripts, and targeted business insights derived through SQL queries.

# Project Structure

* Zepto_Excel_File.csv : The primary raw dataset containing product information, pricing, discounts, categories, and inventory metrics.
* SQL SCRIPT.sql : Contains all SQL queries ranging from data inspection, null checking, data cleaning steps, to business insight analysis.

# Tools Used 

* Microsoft Excel
* MySQL 
 
# Data Cleaning Process

Before generating insights, the raw dataset underwent essential cleaning operations:

1. Identified and removed records where the MRP or Discounted Selling Price equaled .
2. Converted monetary values from paise to standard rupees by dividing by 100.

# Key Business Insights 

The project answers several key analytical and business-oriented questions inside the script :

* Identified the top 10 products offering the highest discount percentages.
* Filtered premium products (MRP > ₹300) that are currently out of stock.
* Calculated estimated potential revenue for each product category based on available inventory and discounted selling prices.
* Filtered high-value items (MRP > ₹500) with low discount percentages (< 10%).
* Ranked the top 5 categories offering the highest average discounts.
* Computed price-per-gram efficiency for items weighing over 100g.
* Segmented products into `LOW`, `MEDIUM`, and `BULK` brackets using `CASE` statements based on package weight.
* Computed total inventory weight per product category.

# How to Use

1. Download this repository.
2. Import `Zepto_Excel_File.csv` into your SQL database environment.
3. Run the queries step-by-step from `SQL SCRIPT.sql` to replicate the analysis and view the results.

