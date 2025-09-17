use pizza_db
select * from pizza_sales
select sum(total_price) as TOTAL_REVENUE from pizza_sales
select sum(total_price)/ count(distinct order_id) as AVERAGE_ORDER_VALUE from pizza_sales
select sum(quantity) as Total_pizza_sold from pizza_sales
select count(distinct order_id) as Total_orders from pizza_sales
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as AVERAGE_PIZZA_PER_ORDER from pizza_sales
SELECT DATENAME(DW, order_date) as order_day,count(distinct order_id) as Total_orders
from pizza_sales
group by datename(DW,order_date)
select datename(month,order_date) as Month_Name,count(distinct order_id) as Total_orders
from pizza_sales
group by datename(month,order_date)
order by Total_orders desc
SELECT pizza_category,
cast(sum (total_price) as decimal(10,2)) as Total_sales, cast(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales )  as decimal(10,2))AS PCT
FROM pizza_sales
where month(order_date)=1
GROUP BY pizza_category
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales,
CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct
FROM pizza_sales
where datepart(quarter,order_date)=1
GROUP BY pizza_size
ORDER BY pct DESC
-- top 5
select top 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc
-- bottom 5
select top 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue asc
-- Top 5 for quantity
select top 5 pizza_name,count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc
