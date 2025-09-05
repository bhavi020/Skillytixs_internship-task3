CREATE TABLE walmart_sales (
    Store INT,
    Date VARCHAR(20),
    Weekly_Sales DECIMAL(10,2),
    Holiday_Flag INT,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,2),
    CPI DECIMAL(10,2),
    Unemployment DECIMAL(5,2)
);

SELECT COUNT(*) FROM walmart_sales;

--Q1. Show the store, weekly_sales and date columns from the Walmart dataset.
SELECT store, weekly_sales, date
FROM walmart_sales
LIMIT 10;

--Q2. Find all records where weekly_sales is greater than 50,000.
SELECT *
FROM walmart_sales
WHERE weekly_sales > 50000
LIMIT 10;

--Q3. Show top 10 highest weekly sales records.
SELECT store, weekly_sales, date
FROM walmart_sales
ORDER BY weekly_sales DESC
LIMIT 10;

--Q4. Calculate total sales and number of records for each store.
SELECT store, 
       SUM(weekly_sales) AS total_sales, 
       COUNT(*) AS records
FROM walmart_sales
GROUP BY store
ORDER BY total_sales DESC;

-- Helper Table 
CREATE TABLE store_info (
    store INT PRIMARY KEY,
    region VARCHAR(50)
);
INSERT INTO store_info VALUES
(1, 'East'),
(2, 'West'),
(3, 'South'),
(4, 'North');

--Q5. Show store-wise sales with their region.
SELECT w.store, s.region, SUM(w.weekly_sales) AS total_sales
FROM walmart_sales w
INNER JOIN store_info s ON w.store = s.store
GROUP BY w.store, s.region
ORDER BY total_sales DESC;

--Q6. Show month-wise total sales.
SET datestyle = 'DMY';
SELECT DATE_PART('month', date::DATE) AS month, 
       SUM(weekly_sales) AS monthly_sales
FROM walmart_sales
GROUP BY month
ORDER BY month;

--Q7. Show how many days each store was active in dataset.
SELECT store, 
       (MAX(date::DATE) - MIN(date::DATE)) AS active_days
FROM walmart_sales
GROUP BY store;





