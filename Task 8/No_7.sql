
--- 7.	Change the view named ‘ViewCustomerData’ to ID (obtained from the last 3 digit characters of CustomerID), 
---		Name (obtained from CustomerName), Address (obtained from CustomerAddress), and Phone (obtained from CustomerPhone) 
---		for every customer whose name contains space.
---		(alter view, right, charindex)

USE OOVEO_Salon

ALTER VIEW ViewCustomerData AS
    
SELECT  
	RIGHT(CustomerId, CHARINDEX('U', CustomerId) + 1) AS "ID",
    CustomerName AS "Name",
    CustomerAddress AS "Address",
    CustomerPhone AS "Phone"
    
FROM   
	MsCustomer
    
WHERE   
	CHARINDEX(' ', CustomerName) > 0

