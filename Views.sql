--Create a view for all orders from Germany.
create view GerManyOrders
as
select A.* from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID
where A.Country='Germany'
select *from GerManyOrders

--Create a view for active customers (those who placed orders).
create view vW_activecustomers
as
select A.* from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID where A.CustomerID is not null
select *from vW_activecustomers

--Create a view showing customer name and order count.
create view  customerWithCount
as
select A.CustomerName,COUNT(B.OrderID)aS OrderCount from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID where A.CustomerID is not null  GROUP BY A.CustomerName
select *from  customerWithCount
--Create a view for order,s shipped via a specific ShipperID.
create View specific_ShipperID
as
select A.*, B.ShipperID from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID where A.CustomerID is not null
select *from specific_ShipperID


--Drop a view if it exists.
drop view ActiveCustomers

--Create an updatable view for customer address.
 create view viewcustomeraddress
 as
 Select CustomerID,
    CustomerName,
    Address,
    City,
    PostalCode,
    Country From Customers
	select *from viewcustomeraddress

--Create a view showing customers and latest order date.
create view latest_order
as
select
    A.CustomerID,
    A.CustomerName,
    MAX(B.OrderDate) AS LatestOrderDate
FROM 
    Customers AS A
INNER JOIN 
    Orders AS B ON A.CustomerID = B.CustomerID
GROUP BY 
    A.CustomerID, A.CustomerName;
select *From latest_order

--Create a view showing customer and country only.
create view customer_Country
as
select CustomerName,Country from Customers
select *From customer_Country

--Use a view to filter customers from UK.
create  view customers_UK
as
select *from Customers where Country='UK'
select *from customers_UK



--Use a view to summarize orders per country.
create view summarize_orders_per_country
as
select A.Country, count(B.OrderID) AsTotalCount  from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID group by A.Country
select *from summarize_orders_per_country


--Create a view for customers with more than 5 orders.
create view cWith5orders
as
select A.CustomerName, count(B.OrderID) AsTotalCount  from Customers As A
inner join Orders As B on
A.CustomerID=B.CustomerID group by A.CustomerName having Count(B.OrderID)>=5
select *From cWith5orders

--Create an indexed view on customer country count.
CREATE VIEW vw_CustomerCity
WITH SCHEMABINDING
AS
SELECT CustomerID, City
FROM dbo.Customers;
select *from vw_CustomerCity
update vw_CustomerCity set City= 'kolkata'where CustomerID=1


--Display view definitions using metadata.

--Join a view with a table in a query.

--Nest views inside another view.

--Add security to a view (read-only).
CREATE VIEW vw_ReadOnly
AS
SELECT City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY City;
DENY INSERT, UPDATE, DELETE ON vw_ReadOnly TO Public;
select *From vw_ReadOnly


update vw_ReadOnly set City='Kolkaaaat' where TotalCustomers=1