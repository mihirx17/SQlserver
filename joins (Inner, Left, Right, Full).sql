--Get all customer names and their orders.
select A.*,B.* From Customers As A 
inner join Orders As B  on A.CustomerID=B.CustomerID

--Get all orders even if the customer info is missing.
select A.*,B.* From Customers As A 
right join Orders As B  on A.CustomerID=B.CustomerID where b.CustomerID % 2=0

--Show all customers, even if they didn’t place any orders.
select A.*,B.* From Customers As A 
right join Orders As B  on A.CustomerID=B.CustomerID where A.ContactName is null and A.CustomerName is null
--Display all customers and all orders (full outer join).
select A.*,B.* From Customers As A 
full join Orders As B  on A.CustomerID=B.CustomerID
--List orders along with customer’s country.
select B.*, A.Country From Customers As A 
inner join Orders As B  on A.CustomerID=B.CustomerID 

--Join orders with customers and filter only German customers.
select B.*, A.Country From Customers As A 
inner join Orders As B  on A.CustomerID=B.CustomerID  where A.Country='Germany'

--Get customer names and order IDs using left join.
select a.CustomerName, B.* From Customers As A 
Left join Orders As B  on A.CustomerID=B.CustomerID 

--Get customer names and shipping details using a join.

select a.CustomerName, B.ShipperID From Customers As A 
inner join Orders As B  on A.CustomerID=B.CustomerID 

--Display orders with no corresponding customers (if any).
select a.*, B.* From Customers As A 
right join Orders As B  on A.CustomerID=B.CustomerID  where A.CustomerID is null


--Show all customers and if they have placed any orders.
select a.*, B.* From Customers As A 
left join Orders As B  on A.CustomerID=B.CustomerID 
--Get the latest order date for each customer.


SELECT 
    A.CustomerID,
    A.CustomerName,
    MAX(B.OrderDate) AS LatestOrderDate
FROM 
    Customers AS A
INNER JOIN 
    Orders AS B ON A.CustomerID = B.CustomerID
GROUP BY 
    A.CustomerID, A.CustomerName;

--Find all cities that have at least one order.

SELECT 
  A.City,Count(B.OrderID)
FROM 
    Customers AS A
INNER JOIN 
    Orders AS B ON A.CustomerID = B.CustomerID
GROUP BY 
    A.City
--Join three tables: customers, orders, and shippers.
SELECT 
    C.CustomerName,
    C.Country,
    O.OrderID,
    O.OrderDate,
    S.ShipperName 
FROM 
    Customers AS C
INNER JOIN 
    Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN 
    Shippers AS S ON O.ShipperID = S.ShipperID;




