# 📊 Walmart Sales SQL Analysis  

## 📌 Project Overview  
Is project me maine **Walmart Sales dataset** ko SQL queries ke through analyze kiya hai.  
Data me weekly sales, holiday flag, temperature, fuel price, CPI aur unemployment jaise features diye gaye hain.  
Objective tha **sales trends, store-wise performance aur region-wise analysis** nikalna.  

---

## 🗂 Database Tables  

### 1. `walmart_sales`
```sql
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
CREATE TABLE store_info (
    store INT PRIMARY KEY,
    region VARCHAR(50)
);

INSERT INTO store_info VALUES
(1, 'East'),
(2, 'West'),
(3, 'South'),
(4, 'North');
SELECT store, weekly_sales, date
FROM walmart_sales
LIMIT 10;
SELECT store, weekly_sales, date
FROM walmart_sales
LIMIT 10;
SELECT *
FROM walmart_sales
WHERE weekly_sales > 50000
LIMIT 10;
SELECT store, weekly_sales, date
FROM walmart_sales
ORDER BY weekly_sales DESC
LIMIT 10;
SELECT store, 
       SUM(weekly_sales) AS total_sales, 
       COUNT(*) AS records
FROM walmart_sales
GROUP BY store
ORDER BY total_sales DESC;
SELECT w.store, s.region, SUM(w.weekly_sales) AS total_sales
FROM walmart_sales w
INNER JOIN store_info s ON w.store = s.store
GROUP BY w.store, s.region
ORDER BY total_sales DESC;
SELECT DATE_PART('month', date::DATE) AS month, 
       SUM(weekly_sales) AS monthly_sales
FROM walmart_sales
GROUP BY month
ORDER BY month;
SELECT store, 
       (MAX(date::DATE) - MIN(date::DATE)) AS active_days
FROM walmart_sales
GROUP BY store;
📊 Insights

High sales weeks easily identified (>50k).

Top 10 weekly sales records show store-level performance.

Regional analysis possible via join with store_info.

Month-wise aggregation useful for seasonality check.

Store activity period measured by min-max date difference.

🚀 Tech Stack

Database → MySQL / PostgreSQL

Tool → MySQL Workbench

Language → SQL
