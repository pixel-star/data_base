-- Лабораторна робота № 2
-- З дисципліни Бази даних
-- Студента групи МІТ-31 Кульбачинського Данила

-- Запит1. Обрати всі записи з таблиці table1

SELECT * FROM customer;


SELECT TOP 3 * FROM customer;

SELECT * FROM customer
LIMIT 3;

SELECT * FROM customer
FETCH FIRST 3 ROWS ONLY;

SELECT TOP 50 PERCENT * FROM customer;

SELECT * FROM customer
FETCH FIRST 50 PERCENT ROWS ONLY;

SELECT TOP 3 * FROM cars
WHERE rented=true;

SELECT * FROM cars
WHERE rented=true
LIMIT 3;

SELECT * FROM cars
WHERE rented=true
FETCH FIRST 3 ROWS ONLY;

SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(Price) AS LargestPrice
FROM Products;

SELECT COUNT(ProductID)
FROM Products;

SELECT AVG(Price)
FROM Products;

SELECT SUM(Quantity)
FROM OrderDetails;

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;
-- Висновки: ...