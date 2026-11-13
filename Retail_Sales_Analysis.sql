
USE ecommerce_analysis;
-- 1
-- SELECT * from retail_orders;

-- 2
SELECT * from retail_orders limit 10;

-- 3
-- select count(Order_ID) as Total_Orders from retail_orders;

-- 4
-- SELECT count(DISTINCT Customer_ID) as total_customers from retail_orders;

-- 5
-- SELECT sum(Quantity) as total_qty_sold from retail_orders;

-- 6
-- SELECT round(sum(Sales_Amount),2) as total_revenue from retail_orders;

-- 7
-- Select round(avg(Sales_Amount),2) as avg_order_value from retail_orders;

-- 8
-- select max(Sales_Amount) as highest_sales_amt,min(Sales_Amount) as lowest_sales_amt from retail_orders;

-- 9
-- SELECT round(AVG(Customer_Rating),2) as Avg_Rating from retail_orders;

-- 10
-- select min(Order_Date) as First_order, max(Order_Date) as Last_order from retail_orders;

-- 11
-- SELECT * FROM retail_orders where City = 'Ahmedabad'

-- 12
-- SELECT * FROM retail_orders where Order_Status = 'Cancelled'

-- 13
-- SELECT * FROM retail_orders where Payment_Method = 'UPI'

-- 14
-- SELECT * FROM retail_orders where Sales_Amount > 5000

-- 15
-- SELECT * FROM retail_orders where Order_Date BETWEEN '2025/01/01' and '2025/01/31'

-- 16
-- SELECT * FROM retail_orders where Discount > 20

-- 17
-- SELECT * from retail_orders order by Sales_Amount desc limit 10;

-- 18
-- SELECT * FROM retail_orders where Customer_Name LIKE 'K%'

-- 19
-- SELECT * FROM retail_orders where Coupon_Code = 'NA' -- because i changed empty coupon code with 'NA'.

-- 20
-- SELECT * from retail_orders WHERE Email = 'Invalid'

-- 21
-- SELECT Product_Category,round(sum(Sales_Amount),2) as Total_Revenue FROM retail_orders GROUP by Product_Category;

-- 22
-- SELECT Product_Category,COUNT(Order_ID) as Total_Orders FROM retail_orders GROUP by Product_Category;

-- 23
-- SELECT Product_Category,round(AVG(Sales_Amount),2) as Avg_Revenue FROM retail_orders GROUP by Product_Category;

-- 24
-- select Product,sum(Sales_Amount) as total_sales from retail_orders GROUP by Product ORDER by total_sales desc LIMIT 10;

-- 25
-- select City,sum(Sales_Amount) as total_sales from retail_orders GROUP by City ORDER by total_sales desc LIMIT 5;

-- 26
-- select State,sum(Sales_Amount) as total_sales from retail_orders GROUP by State;

-- 27
-- SELECT Payment_Method,SUM(Sales_Amount) as Total_Sales FROM retail_orders GROUP BY Payment_Method;

-- 28
-- SELECT Sales_Channel,SUM(Sales_Amount) as Total_Sales FROM retail_orders GROUP BY Sales_Channel;

-- 29
-- SELECT Product_Category,round(AVG(Discount),2) as AVG_Discount FROM retail_orders GROUP BY Product_Category;

-- 30
-- SELECT Product,sum(Quantity) as Total_Qty_Sold FROM retail_orders GROUP BY Product;

-- 31
-- SELECT Customer_ID,Customer_Name,SUM(Sales_Amount) as Total_Spent FROM retail_orders GROUP BY Customer_ID,Customer_Name      ORDER BY Total_Spent desc LIMIT 10;

-- 32
-- SELECT Customer_ID ,COUNT(Order_ID) as Total_Orders FROM retail_orders GROUP BY Customer_ID having Total_Orders > 5 ;

-- 33
-- SELECT Customer_ID,Customer_Name,AVG(Sales_Amount) as Avg_Spent FROM retail_orders GROUP BY Customer_ID,Customer_Name;

-- 34
-- SELECT Order_Status,COUNT(Order_ID) as No_of_Orders from retail_orders GROUP BY Order_Status;

-- 35
-- SELECT round(100 * sum(case when Order_Status = 'Cancelled' THEN 1 else 0 END)/count(Order_Status),2) as Cancelled_pct from retail_orders;

-- 36
-- select count(DISTINCT Customer_ID) from retail_orders WHERE Coupon_Code = 'NA' ;

-- 37
-- select City ,count(DISTINCT Customer_ID) as No_of_Cust FROM retail_orders GROUP BY City;

-- 38
-- select Product_Category,round(avg(Customer_Rating),2) as avg_rating from retail_orders GROUP BY Product_Category;

-- 39
-- SELECT Coupon_Code,count(Coupon_Code) as No_of_Times_Used FROM retail_orders GROUP BY Coupon_Code;

-- 40
-- select Sales_Channel,round((sum(Sales_Amount)*100)/(SELECT sum(Sales_Amount) FROM retail_orders),2) as pct_contribution from retail_orders GROUP BY Sales_Channel


-- I made Discount and Customer Rating null where there was na and also change there type to Decimal
-- 41
-- select MONTH(Order_Date) as Month,YEAR(Order_Date)as Year,sum(Sales_Amount) as Total_sales from retail_orders group BY MONTH(Order_Date),YEAR(Order_Date) ORDER BY Year,Month;

-- 42
-- select MONTH(Order_Date) as Month,YEAR(Order_Date)as Year,sum(Sales_Amount) as Total_sales from retail_orders group BY MONTH(Order_Date),YEAR(Order_Date) Order by Total_sales DESC limit 1;

-- 43
-- select MONTH(Order_Date) as Month,YEAR(Order_Date)as Year,COUNT(Order_ID) as Total_Orders from retail_orders group BY MONTH(Order_Date),YEAR(Order_Date) ORDER BY Year,Month;

-- 44
-- SELECT SUM(Sales_Amount)/ COUNT(DISTINCT Order_ID) as Daily_AVG_Sales  from retail_orders ;

-- 45

-- SELECT SUM(Case when DAYNAME(Order_Date) IN ('Sunday','Saturday') then Sales_Amount else 0 END) as Weekend_Sales,SUM(Case when DAYNAME(Order_Date) NOT IN ('Sunday','Saturday') then Sales_Amount else 0 END) as Weekday_sales FROM retail_orders;

-- 46
-- SELECT Avg(Datediff(Delivery_Date,Order_Date)) as AVG_Delivery_Time FROM retail_orders where Delivery_Date is not null and Delivery_Date >= Order_Date;

-- 47

-- select MONTH(Order_Date) as Month,YEAR(Order_Date)as Year,COUNT(Order_Status) as Total_Order_Cancelled from retail_orders WHERE Order_Status = 'Cancelled' group BY MONTH(Order_Date),YEAR(Order_Date) ORDER BY Total_Order_Cancelled DESC limit 1;

-- 48
-- SELECT Product , SUM(Sales_Amount),dense_rank() over (ORDER BY sum(Sales_Amount) DESC) Ranking from retail_orders GROUP BY Product;

-- 49
-- SELECT * FROM (select Product,Product_Category,sum(Sales_Amount) as total_sales,row_number() over (PARTITION BY Product_Category ORDER BY sum(Sales_Amount) DESC) as rnk FROM retail_orders  Group BY Product,Product_Category) rankings where rnk <= 3

-- 50
-- SELECT City , SUM(Sales_Amount) as total_sales,dense_rank() over (ORDER BY sum(Sales_Amount) DESC) Ranking from retail_orders GROUP BY City;

-- 51
-- SELECT * FROM (select Customer_ID,State,sum(Sales_Amount)as total_sales,row_number() over (PARTITION BY State ORDER BY sum(Sales_Amount) DESC) as rnk FROM retail_orders  Group BY Customer_ID,State) rankings where rnk <= 5

-- 52
-- select Product_Category,round((sum(Sales_Amount)*100)/(SELECT sum(Sales_Amount) FROM retail_orders),2) as pct_contribution from retail_orders GROUP BY Product_Category

-- 53
-- SELECT month(Order_Date)as Month,Year(Order_Date) as year,sum(Sales_Amount) monthly_sales, sum(sum(Sales_Amount)) over(PARTITION BY year(Order_Date)ORDER by Month(Order_Date)) as Running_Total from retail_orders group by month(Order_Date),Year(Order_Date)

-- 54
-- SELECT month(Order_Date)as Month,Year(Order_Date) as year,COUNT(Order_ID) monthly_orders, sum(count(Order_ID)) over(ORDER by year(Order_Date),Month(Order_Date)) as Running_Total_Orders from retail_orders group by month(Order_Date),Year(Order_Date)

-- 55
-- select *,total_sales - lag(total_sales) over (ORDER by Year,Month) as diff_from_prev_month from (SELECT month(Order_Date) as Month , year(Order_Date) as Year,Sum(Sales_Amount) as total_sales ,row_number() over (ORDER BY year(Order_Date),month(Order_Date)) as rnk from retail_orders GROUP BY year(Order_Date),month(Order_Date)) as Monthly_sales

-- 56
-- select *, round((total_sales - lag(total_sales) over (ORDER by Year,Month)) * 100 / lag(total_sales) over (ORDER by Year,Month),2) as Growth_pct from (SELECT month(Order_Date) as Month , year(Order_Date) as Year,Sum(Sales_Amount) as total_sales ,row_number() over (ORDER BY year(Order_Date),month(Order_Date)) as rnk from retail_orders GROUP BY year(Order_Date),month(Order_Date)) as Monthly_sales

-- 57
-- SELECT Customer_ID,Customer_Name,min(Order_Date) as First_Order_Date ,max(Order_Date) as Latest_Order_Date FROM retail_orders group by Customer_ID,Customer_Name

-- 58
-- select * , case when total_sales > 100000 then 'Premium Customer' when total_sales < 30000 then 'Average Customer' else 'Good Customer' end as Customer_Grade from (SELECT Customer_ID,sum(Sales_Amount) as total_sales FROM retail_orders GROUP BY Customer_ID) as customer_spending; 

-- 59
-- SELECT * , case when total_orders > 1 then 'Repeat Customer' else 'One-Time Customer' end as Customer_Grade from (SELECT Customer_ID,COUNT(Order_ID) as total_orders FROM retail_orders GROUP BY Customer_ID) as customer_orders;

-- 60 
-- select Customer_ID, count(Customer_ID)as Orders_In_Diff_Months from (SELECT Customer_ID, month(Order_Date) as Month,year(Order_Date) as Year from retail_orders group by Customer_ID,month(Order_Date), year(Order_Date)) as customers_order_by_Month group by Customer_ID;

-- 61
-- SELECT Customer_ID as One_Time_Customers, total_orders from (SELECT Customer_ID,COUNT(Order_ID) as total_orders FROM retail_orders GROUP BY Customer_ID) as customer_orders where total_orders = 1;

-- 62
-- SELECT Customer_Grade,round(sum(Total_Spent)/count(Customer_Grade),2) as AVG_Spent from (SELECT * , case when total_orders > 1 then 'Repeat Customer' else 'One-Time Customer' end as Customer_Grade from (SELECT Customer_ID,COUNT(Order_ID) as total_orders,sum(Sales_Amount) as Total_Spent FROM retail_orders GROUP BY Customer_ID) as customer_orders) as repeatance group BY Customer_Grade;

-- 63  
-- SELECT Product,sum(Sales_Amount) as Total_sales,avg(Customer_Rating) as AVG_Rating from retail_orders group by Product  having Total_Sales > 900000 and AVG_Rating < 4 order by Total_Sales desc,AVG_Rating ;

-- 64
-- SELECT Product_Category,sum(Sales_Amount) as Total_sales,avg(Customer_Rating) as AVG_Rating from retail_orders group by Product_Category  having Total_Sales > 3000000 and AVG_Rating < 4 order by Total_Sales desc,AVG_Rating 

-- 65
-- select Coupon_Code_Availability,sum(Sales_Amount) as Total_Revenue from (SELECT case when Coupon_Code = 'NA' then 'No' else 'Yes' End as Coupon_Code_Availability,Sales_Amount  FROM retail_orders) as table1 group by Coupon_Code_Availability;

-- 66
-- SELECT Payment_Method,avg(Sales_Amount) as Total_Sales FROM retail_orders GROUP BY Payment_Method ORDER BY Total_Sales DESC LIMIT 1

-- 67
-- SELECT City,sum(Quantity) as Total_Qty,avg(Sales_Amount) as AVG_Sales from retail_orders group by City having Total_Qty >= 500 and AVG_Sales < 10000 order by Total_Qty desc,AVG_Sales 

-- 68
-- SELECT Sales_Channel,avg(datediff(Delivery_Date,Order_Date)) as AVG_Delivery_Time from retail_orders WHERE Delivery_Date is not null and Delivery_Date >= Order_Date GROUP BY Sales_Channel;

-- 69
-- SELECT Payment_Method , round(100*sum(CASE WHEN Order_Status = 'Cancelled' then 1 else 0 end)/count(Order_Status),2) as Cancellation_PCT from retail_orders GROUP BY Payment_Method;

-- 70
 select * from (SELECT month(Order_Date) as Month, year(Order_Date) as year , Sales_Channel, sum(Sales_Amount) as total_Sales,row_number() over(PARTITION BY month(Order_Date),year(Order_Date) order by sum(Sales_Amount) desc,Sales_Channel) as rnk FROM retail_orders GROUP BY  month(Order_Date), year(Order_Date), Sales_Channel ) as ranking where rnk = 1;