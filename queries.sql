-- 1. KPIs
SELECT 
    COUNT(order_id) AS Total_Orders,
    SUM(total_amount) AS Total_Revenue,
    AVG(total_amount) AS Avg_Order_Value,
    COUNT(DISTINCT customer_id) AS Unique_Customers
FROM sales;

-- 2. Top 5 Products by Revenue
SELECT product_name, SUM(total_amount) AS Revenue
FROM sales
GROUP BY product_name
ORDER BY Revenue DESC
LIMIT 5;

-- 3. Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month, SUM(total_amount) AS Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

-- 4. Revenue by City
SELECT city, SUM(total_amount) AS Revenue
FROM sales
GROUP BY city
ORDER BY Revenue DESC;

-- 5. Top 10 Customers by LTV
SELECT customer_id, SUM(total_amount) AS Total_Spent
FROM sales
GROUP BY customer_id
ORDER BY Total_Spent DESC
LIMIT 10;
