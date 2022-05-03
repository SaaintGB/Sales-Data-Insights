/* Inspecting data */
SELECT * FROM  sales_data;

-- checking unique values
SELECT DISTINCT Status FROM sales_data;			-- visualize in tableau
SELECT DISTINCT  year_id FROM sales_data;
SELECT DISTINCT productline FROM sales_data;	-- visualize in tableau
SELECT DISTINCT country FROM sales_data;		-- visualize in tableau
SELECT DISTINCT dealsize FROM sales_data;		-- visualize in tableau
SELECT DISTINCT territory FROM sales_data;		-- visualize in tableau

-- Analysis of Dataset

-- Finding the productline with most revenue
	SELECT ROUND(SUM(sales),2) AS revenue, productline 
    FROM sales_data
    GROUP BY productline
    ORDER BY revenue DESC;
    
-- Finding the most profitable year
    SELECT ROUND(SUM(sales),2) AS revenue, year_id
    FROM sales_data
    GROUP BY year_id
    ORDER BY revenue DESC;
    
-- Reason why 2005 was the lowest profitable year
	SELECT DISTINCT month_id FROM sales_data
    WHERE year_id=2005
    ORDER BY month_id;
    
-- Most profitable dealsize
	SELECT ROUND(SUM(sales),2) AS revenue, dealsize
    FROM sales_data
    GROUP BY dealsize
    ORDER BY revenue DESC;
    
-- Best month for sales in each year (2003)
	SELECT ROUND(SUM(sales),2) AS revenue, month_id, year_id, count(ordernumber) AS Total_orders
    FROM sales_data
    WHERE year_id=2003
	GROUP BY month_id
    ORDER BY revenue DESC;
    
-- Best month for sales in each year (2004)
	SELECT ROUND(SUM(sales),2) AS revenue, month_id, year_id, count(ordernumber) AS Total_orders
    FROM sales_data
    WHERE year_id=2004
	GROUP BY month_id
    ORDER BY revenue DESC; 

-- What product lines sell the most in November each year?
	SELECT ROUND(SUM(sales),2) AS revenue, month_id, year_id, productline, count(ordernumber) AS Total_orders
    FROM sales_data
    WHERE year_id=2004 AND month_id=11
	GROUP BY month_id, productline
    ORDER BY revenue DESC; 

-- Getting our best customers 
	SELECT 
		customername,
        ROUND(SUM(sales),2) AS Monetary_Value,
        ROUND(AVG(sales),2) AS Avg_Monetary_Value,
        COUNT(ordernumber) AS No_of_Orders,
        MAX(orderdate) AS Last_Order_date
	FROM sales_data
    GROUP BY customername;
    
-- Products sold and their delivery status
	SELECT ordernumber, COUNT(*), status
	FROM sales_data
	GROUP BY status;

-- City with highest number of sales in a specific country
SELECT city, SUM(sales) AS Total_sales
FROM sales_data
WHERE country = 'USA'
GROUP BY city
ORDER BY 2 DESC;
    
-- Top 5 companies and customer's name with most products ordered and revenue in the Spain in the year 2004
SELECT
	customername AS company_name, 
	CONCAT(contactfirstname, ' ', contactlastname) AS customer_fullname , 
	quantityordered AS product_ordered, 
	SUM(sales) AS revenue
FROM sales_data
WHERE country= 'Spain' AND year_id=2004
GROUP BY customername
ORDER BY revenue DESC;


    
    
 
    
	

