use firstbank;
select*from[dbo].[pizza_sales34];
---TOTAL REVENUE
SELECT SUM(TRY_CONVERT(decimal(18, 2), total_price)) AS Total_Revenue
FROM [dbo].[pizza_sales34];
---AVEREAGE ORDER VALUE
SELECT SUM(TRY_CONVERT(decimal(18, 2), total_price)) / COUNT(DISTINCT order_id) AS Average_order_value
FROM [dbo].[pizza_sales34]
WHERE TRY_CONVERT(decimal(18, 2), total_price) IS NOT NULL;
---TOTAL PIZZA SOLD
SELECT SUM(TRY_CONVERT(int, quantity)) AS Total_pizza_sold
FROM [dbo].[pizza_sales34]
WHERE TRY_CONVERT(int, quantity) IS NOT NULL;
---TOTAL ORDERS_PLACED
SELECT COUNT(DISTINCT order_id) AS Total_orders_placed
FROM [dbo].[pizza_sales34];
---AVEREAGE PIZZA PER ORDER
SELECT 
    SUM(TRY_CONVERT(int, quantity)) / COUNT(DISTINCT order_id) AS AVERAGE_PIZZA_PER_ORDER
FROM 
    [dbo].[pizza_sales34];
---Daily Trend for total orders
SELECT *
FROM [dbo].[pizza_sales34]
WHERE TRY_CONVERT(datetime, order_date) IS NULL
    AND order_date IS NOT NULL;
---	hourly trend
SELECT 
    DATEPART(hour, order_time) AS order_hours,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    [dbo].[pizza_sales34]
GROUP BY 
    DATEPART(hour, order_time)
ORDER BY 
    order_hours;

