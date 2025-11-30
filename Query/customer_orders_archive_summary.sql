
select 
c.CustomerID,
c.FirstName,
c.LastName,

c.FirstName + ' '+ c.LastName as Name, 
c.FirstName + ' '+ isnull(c.LastName,' ') as FullName,

o.OrderID,
isnull(o.OrderId, 0) as NewOrderID,

a.ProductID,
isnull(a.ProductID, 0) as NewProductID,

a.OrderDate,
a.ShipDate,
 coalesce(convert(varchar(20), a.OrderDate, 23), 'Unknown') as NewOrderDate,

a.ShipAddress,
a.BillAddress,
coalesce(a.ShipAddress, a.BillAddress,'N/A') as NewShipaddress

from Customers as c
left join Orders as o
on c.CustomerID = o.customerID
left join OrdersArchive as a
on o.OrderId = a.OrderID



/* ============================================================
     CUSTOMER SUMMARY WITH ORDER & ARCHIVE MERGED DATA
   ============================================================ */



select 
c.CustomerID,

c.FirstName + ' '+ isnull(c.LastName,' ') as FullName,

isnull(o.OrderId, 0) as NewOrderID,

isnull(a.ProductID, 0) as NewProductID,

coalesce(convert(varchar(20), a.OrderDate, 23), 'Unknown') as NewOrderDate,

coalesce(a.ShipAddress, a.BillAddress,'N/A') as NewShipaddress

from Customers as c
left join Orders as o
on c.CustomerID = o.customerID
left join OrdersArchive as a
on o.OrderId = a.OrderID
