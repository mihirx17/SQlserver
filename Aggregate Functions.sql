--1–20: Aggregate Functions
--Find the total number of customers.
select Count(*) As[total number of customers]  From Customers
--Find the average number of orders per customer.
select A.CustomerName,count(B.OrderID) from Customers As A inner join 
Orders as B on
A.CustomerID=B.CustomerID group by A.CustomerName

--Get the maximum number of orders placed by a customer.
SELECT A.CustomerName, COUNT(B.OrderID) AS [TotalCount]
FROM Customers AS A
INNER JOIN Orders AS B ON A.CustomerID = B.CustomerID
GROUP BY A.CustomerName
HAVING COUNT(B.OrderID) = (
    SELECT MAX(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS OrderCount_
);



--Count how many customers are from each country.
select A.Country, count (A.CustomerName)as TotalCustomers from Customers As A inner join Orders as B
on a.CustomerID=B.CustomerID group by A.Country

--Find the customer(s) who placed the minimum number of orders.
select A.CustomerName ,count(B.OrderID)As TotalCount from Customers As A inner join Orders As B
on A.CustomerID=B.CustomerID group by A.CustomerName
having Count(B.OrderID)=(select MIN(minCount) from (Select COUNT(B.OrderID) As minCount from Orders as B group by B.CustomerID)As Mimimumcount);

--Get the sum of order amounts (assume there is a column OrderAmount).

--List customers who placed more than 3 orders.
select A.CustomerName, count (B.OrderID)as TotalCustomers from Customers As A inner join Orders as B
on a.CustomerID=B.CustomerID group by A.CustomerName having COUNT(B.OrderID)>=2 


--Show countries having more than 5 customers.
select A.Country, count (A.CustomerName)as TotalCustomers from Customers As A inner join Orders as B
on a.CustomerID=B.CustomerID group by A.Country 

--Display the total orders per city.
select A.city, count (A.CustomerName)as TotalCustomers from Customers As A inner join Orders as B
on a.CustomerID=B.CustomerID group by A.city

--Get the average order count per country.

select A.Country,count(B.OrderID) from Customers As A inner join 
Orders as B on
A.CustomerID=B.CustomerID group by A.Country
--Find the number of orders placed in each month.
select YEAR(OrderDate),MONTH(Orderdate),DATENAME(MONTH, OrderDate) AS OrderMonth,COUNT(OrderID) As OrderCount from Orders
group by YEAR(OrderDate),MONTH(OrderDate),DATENAME(MONTH, OrderDate) 

--Show customers with the highest order count from each country.
select A.Country ,count(B.OrderID)As TotalCount from Customers As A inner join Orders As B
on A.CustomerID=B.CustomerID group by A.Country
having Count(B.OrderID)=(select MAX(minCount) from (Select COUNT(B.OrderID) As minCount from Orders as B group by B.CustomerID)As Mimimumcount);

--Count customers who have never placed an order.
select A.CustomerName, count (B.OrderID)as TotalOrder from Customers As A left join Orders as B
on a.CustomerID=B.CustomerID  group by A.CustomerName having count(B.OrderID)=0;
--Get the average postal code length.

select avg (len(PostalCode)) As AvergaePostalcode from Customers

--Find cities with maximum customers.
select A.city, count (A.CustomerName)as TotalCustomers from Customers As A inner join Orders as B
on a.CustomerID=B.CustomerID group by A.city
--Display the average number of orders per shipping method.
select ShipperID,COUNT(OrderId) from Orders Group by ShipperID


--Find the country with the least customers.

select A.Country, count (A.CustomerName)as TotalCustomers from Customers As A group by A.Country 


--Show number of distinct cities customers belong to.
SELECT COUNT(DISTINCT City) AS DistinctCityCount
FROM Customers;


--Find total orders shipped via each Shipper.   
select ShipperID,COUNT(OrderId) from Orders Group by ShipperID

--Show average orders per customer from Germany.

select  avg(OrderCount) ASAvgOrdersPerGermanCustomer from(
select A.CustomerName,count(B.OrderID) as OrderCount from Customers As A inner join 
Orders as B on
A.CustomerID=B.CustomerID where A.Country='Germany' group by A.CustomerName) as AvgCount


