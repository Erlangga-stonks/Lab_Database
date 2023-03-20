
---1.	Create a view named ‘ViewBonus’ to display BinusId (obtained from CustomerID by replacing the first 2 characters with ‘BN ’), 
--		and CustomerName for every customer whose name is more than 10 characters.
--		(create view, stuff, len)


CREATE VIEW ViewBonus AS
    SELECT  REPLACE(CustomerId, 'CU', 'BN') AS "BinusID", CustomerName
	FROM
	MsCustomer

    WHERE   
	LEN(CustomerName) > 10;

GO


SELECT * FROM  ViewBonus