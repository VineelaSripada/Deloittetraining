/*1.  Implement the following requirements (Concept: Views) :  

	a.  Creates a view that selects every product in the "Products" table with a price less than the average price
			Hint : View name should be  "Products  Less Than Average Price"
			
	b.   Display the results by using the View	
	c.   Rename the View as   "Low Cost Products"	
	d.   Drop the view*/

	--a
create view Products_less_than_average_price as 
select ProductName,UnitPrice from Products where UnitPrice<(Select AVG(UnitPrice) from PRODUCTS) 
    --b
select * from Products_less_than_average_price
    --c
EXEC sp_rename 'Products_less_than_average_price','Low_Cost_Products'
select * from Low_Cost_Products
   --d
Drop view Low_Cost_Products

/*2.  Implement the following requirement using Stored Procedures and cursors 
	Hint :  Products table from pubs database
	a.   Read required data from the Products table
	b.   Find the total amount of each product :  Consider UnitsOnOrder, UnitPrice
	c.    You need to display product name and total amount in the output	  
	d.   Also display grand total at the end. 
	e.    Display the total amounts with only two decimal points:
			Eg:   128.50,  582.00, etc....*/

use NorthWind
--a
create procedure usp_read_details
as
 select * from Products

 exec usp_read_details
--b,c
alter procedure usp_total_amount
as
 select ProductName,UnitPrice*UnitsOnOrder as total_amount from Products

exec usp_total_amount
--d
alter procedure usp_total_amount
as
 select ProductName,UnitPrice*UnitsOnOrder as total_amount from Products
 union
 select Null,SUM(UnitPrice*UnitsOnOrder) as Grand_total from Products

exec usp_total_amount

--Cursor
DECLARE cursor_product CURSOR
FOR SELECT ProductName, UnitPrice*UnitsOnOrder as total FROM  Products;
select * from Products
-------------------------------------------------------
OPEN cursor_product;
-------------------------------------------------------
DECLARE @ProductName VARCHAR(MAX),  @total   DECIMAL,@grand DECIMAL(10,2);   
Set @grand=0.00
FETCH NEXT FROM cursor_product INTO  @ProductName, @total;
PRINT @ProductName
PRINT @total
--DECLARE @ProductName VARCHAR(MAX),  @UnitPrice   DECIMAL;   
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @ProductName + ' - ' +  CAST(@total AS varchar);
        FETCH NEXT FROM cursor_product INTO  @ProductName,  @total;
		set @grand+=@total

     END;
	 PRINT 'Grand'+ ' - ' +CAST(@grand as varchar)

CLOSE cursor_product;
DEALLOCATE cursor_product;
----e
create procedure GetTotalwithDecimals
as
OPEN cursor_product;
-------------------------------------------------------
DECLARE @ProductName VARCHAR(MAX),  @total   DECIMAL(10,2),@grand DECIMAL(10,2);   
Set @grand=0.00
FETCH NEXT FROM cursor_product INTO  @ProductName, @total;
PRINT @ProductName
PRINT @total
--DECLARE @ProductName VARCHAR(MAX),  @UnitPrice   DECIMAL;   
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @ProductName + ' - ' +  CAST(@total AS varchar);
        FETCH NEXT FROM cursor_product INTO  @ProductName,  @total;
		set @grand+=@total

     END;
	 PRINT 'Grand'+ ' - ' +CAST(@grand as varchar)

CLOSE cursor_product;
exec GetTotalwithDecimals
DEALLOCATE cursor_product;




