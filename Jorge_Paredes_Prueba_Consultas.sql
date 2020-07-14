

-- Punto 1 Seleccionar los clientes que tengan dirección
select CustomerID, AddressID,
               (select	FirstName from SalesLT.Customer
			   where  CustomerID = SalesLT.CustomerAddress.CustomerID) as FirstName,
			   (select	LastName from SalesLT.Customer
			   where  CustomerID = SalesLT.CustomerAddress.CustomerID) as LastName,
			   (select AddressLine1 from SalesLT.Address
			   where AddressID = SalesLT.CustomerAddress.AddressID) as Address
from SalesLT.CustomerAddress;

-- Punto 2 Seleccionar los clientes que tengan facturas.
select SalesOrderID, customerID,
              (select FirstName from SalesLT.Customer
			   where  CustomerID = SalesLT.SalesOrderHeader.CustomerID) as FirstName,
			   (select	LastName from SalesLT.Customer
			   where  CustomerID = SalesLT.SalesOrderHeader.CustomerID) as LastName
from SalesLT.SalesOrderHeader

-- Punto 3 Seleccionar los clientes cuyas ventas sean mayores a 3000
select * from SalesLT.SalesOrderHeader
select CustomerID, SubTotal,
                (select FirstName from SalesLT.Customer
			   where  CustomerID = SalesLT.SalesOrderHeader.CustomerID) as FirstName,
			   (select	LastName from SalesLT.Customer
			   where  CustomerID = SalesLT.SalesOrderHeader.CustomerID) as LastName
			   from SalesLT.SalesOrderHeader
			   where SubTotal>3000;

-- Punto 4 Seleccionar los clientes cuyo primer nombre empiece por la letra A o J:
select CustomerID, NameStyle, Title, FirstName, LastName from SalesLT.Customer
where FirstName like '[JB]%'
order by FirstName

-- Punto 5 Seleccionar la cantidad de productos por categoría.

select ProductCategoryID,
                      (select Name from SalesLT.ProductCategory
					   where ProductCategoryID = SalesLT.Product.ProductCategoryID) as Name,
					   COUNT(ProductCategoryID) as ProductCount
from SalesLT.Product
group by ProductCategoryID

-- Punto 6 Seleccionar las direcciones (SalesLT.Address) cuyo tipo (AddressType) es Shipping. El
resultado debe ser ordenado por StateProvince en orden alfabético

select AddressID, 
(select  AddressLine1 from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID ) as AddressLine1,
(select  AddressLine2 from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID) as AddressLine2,
(select  City from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID) as City,
(select  StateProvince from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID) as StateProvince,
(select  CountryRegion from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID) as CountryRegion,
(select  PostalCode from SalesLT.Address
where AddressID = SalesLT.CustomerAddress.AddressID) as PostalCode
from SalesLT.CustomerAddress
where AddressType like '%Shipping'
order by StateProvince

-- Punto 7 Seleccionar todas las facturas cuya cantidad de ítems sea mayor o igual que 5
select SalesOrderID, COUNT(SalesOrderID) as ItemsCount from SalesLT.SalesOrderDetail
group by SalesOrderID
Having Count(*)>5



			  
