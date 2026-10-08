SELECT * FROM zepto_sql_project.zepto;

#---COUNT OF ROWS---
SELECT COUNT(*)
FROM zepto_sql_project.zepto
; 

#---SAMPLE DATA---
SELECT *
FROM zepto_sql_project.zepto
LIMIT 10
; 

#---NULL VALUES---
SELECT *
FROM zepto_sql_project.zepto
WHERE product_Id IS NULL
OR 
Category IS NULL
OR 
name IS NULL
OR 
mrp IS NULL
OR 
discountPercent IS NULL
OR 
availableQuantity IS NULL
OR 
discountedSellingPrice IS NULL
OR 
weightInGms IS NULL
OR 
outOfStock IS NULL
OR 
quantity IS NULL
;

#---DIFFERENT PRODUCT CATEGORIES---
SELECT DISTINCT Category
FROM zepto_sql_project.zepto
ORDER BY Category
;

#---HOW MANY PRODUCTS IN STOCK VS OUT OF STOCK
SELECT outOfStock, COUNT(product_Id) as STOCKIN
FROM zepto_sql_project.zepto
GROUP BY outOfStock 
;

#---PRODUCT NAMES PRESENT MUTIPLE TIMES---
SELECT name AS ProductName,COUNT(product_Id) AS noOfTimes
FROM zepto_sql_project.zepto
GROUP BY name
HAVING COUNT(product_Id)> 1
ORDER BY COUNT(product_Id) DESC
;

#---DATA CLEANING---

#---PRODUCTS PRICE IS RS 0---
SELECT *
FROM zepto_sql_project.zepto
WHERE mrp =0 
OR discountedSellingPrice = 0
;

DELETE FROM zepto_sql_project.zepto
WHERE mrp =0 
OR discountedSellingPrice = 0
;

#---CONVERT PAISE TO RUPEES---
UPDATE zepto_sql_project.zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0
;

SELECT mrp, discountedSellingPrice
FROM zepto_sql_project.zepto
;

#---BUSSINESS INSIGHTS---

#---Q1- FIND THE TOP 10 BEST-VALUE PRODUCTS BASED ON THE DISCOUNT PERCENTAGE---
#---[ the products with the highest discount percentage]---
SELECT  DISTINCT name,mrp,discountPercent
FROM zepto_sql_project.zepto
ORDER BY discountPercent DESC
LIMIT 10
;

#---Q2- WHAT ARE THE PRODUCTS WITH THE HIGH MRP BUT OUT STOCK---
SELECT  DISTINCT name,mrp
FROM zepto_sql_project.zepto
WHERE outOfStock = "TRUE"
AND mrp >300
ORDER BY mrp DESC
;

#---Q3- CALCULATE ESTIMATED REVENUE FOR EACH CATEGORY---
SELECT Category, SUM(discountedSellingPrice * availableQuantity) AS REVENUE
FROM zepto_sql_project.zepto
GROUP BY Category
ORDER BY REVENUE 
;

#---Q4- FIND ALL PRODUCTS WHERE MRP IS GREATER THAN 500 AND THE DISCOUNT IS LESS THAN 10 %---
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_sql_project.zepto
WHERE mrp > 500
AND discountPercent <10.00
ORDER BY mrp DESC, discountPercent DESC
;

#---Q5- IDENTIFY THE TOP 5 CATEGORIES OFFERING THE HIGHEST AVERAGE DISCOUNT PERCENTAGE---
SELECT Category , AVG(discountPercent) AS AverageDiscount
FROM zepto_sql_project.zepto
GROUP BY Category
ORDER BY AverageDiscount DESC
LIMIT 5
;

#---Q6- FIND THE PRICE PER GRAM FOR PRODUCTS ABOVE 100g AND SORT BY THE BEST VALUE---
SELECT DISTINCT name,weightInGms,ROUND(discountedSellingPrice/weightInGms,2) AS PricePerGrams
FROM zepto_sql_project.zepto
WHERE weightInGms > 100
ORDER BY PricePerGrams
;

#---Q7- GROUP THE PRODUCTS INTO CATEGORIES LIKE LOW, MEDIUM , BULK BASED ON THEIR WEIGHT IN GRAMS---
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms <1000 THEN 'LOW'
	WHEN weightInGms <5000 THEN 'MEDIUM'
    ELSE  'BULK'
	END AS WEIGHTCATEGORY
FROM zepto_sql_project.zepto
;

#---Q8- WHAT IS THE TOTAL INVENTORY WEIGHT OF PER CATEGORY---
SELECT Category ,SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_sql_project.zepto
GROUP BY category
ORDER BY total_weight
;












 










