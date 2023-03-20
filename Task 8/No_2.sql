
---2.	Create a view named ‘ViewCustomerData’ to display Name (obtained from customer’s name from the first character until a character before space), 
---     Address (obtained from CustomerAddress), and Phone (obtained from CustomerPhone) for every customer whose name contains space. 
---		(create view, substring, charindex)

USE OOVEO_Salon

CREATE VIEW ViewCustomerData AS

SELECT 
		LEFT(CustomerName, CHARINDEX(' ', CustomerName)) AS "Name", 
        CustomerAddress AS "Address", 
		CustomerPhone AS Phone

FROM  
	MsCustomer
    
WHERE   
	LEN(CustomerName) - LEN(REPLACE(CustomerName, ' ', '')) > 0;

GO

SELECT * FROM ViewCustomerData