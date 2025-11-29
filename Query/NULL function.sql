
/*	==============================================================
			ISNULL and COALESCE FUNCTION
	==============================================================*/

-- Null Function
select
* from orders

select
OrderID,
ShipAddress,
isnull(ShipAddress, 'Unknow') as NewShipAdress
from Orders

select 
ShipAddress,
BillAddress,
isnull(ShipAddress, BillAddress) as Newaddress
from orders


/*==============================================================*/


-- COALESCE Function

select 
ShipAddress,
BillAddress,
coalesce(ShipAddress, BillAddress,'N/A') as Newaddress
from orders


-- Adding 10 percentage Discount in sales_data table using (isnull and coalesce).
select * from sales_data


select 
SaleID,
Product,
Category,
Quantity,
Price,
Discount,
Discount + 10 as Discounts,
isnull(Discount,0) + 10 as DiscountsIfnull,
coalesce(Discount,0) + 10 as Discountscoalesce
from sales_data



/*==============================================================*/

-- Full Name of a Customers after merging FirstName and LastName
-- Also add 10 Bonuse point in each Costumers Score.


select * from Customers


select 
FirstName,
LastName,
Score,
FirstName + ' '+ LastName as Name, 
FirstName + ' '+ isnull(LastName,' ') as FullName,
coalesce(Score,0) as NewScore,
coalesce(Score,0) + 10 as Score_Bonus
from Customers

/*==============================================================*/