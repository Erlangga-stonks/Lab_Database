
--- 5.	Create a view named ‘ViewBonusCustomer’ to display BonusId (obtained from CustomerId by replacing ‘CU’ with ‘BN’), 
---		Name (Obtained from CustomerName by taking the next character after space until the last character in lower case format), 
---		Day (obtained from the day when the transaction happened), and TransactionDate (obtained from TransactionDate in ‘mm/dd/yy’ format) 
---		for every transaction which customer’s name contains space and staff’s last name contains ‘a’ character. 
---		(create view, replace, lower, substring, charindex, len, datename, weekday, convert, like)

USE OOVEO_Salon

CREATE VIEW ViewBonusCustomer AS
    SELECT  
		REPLACE(MsCustomer.CustomerId, 'CU', 'BN') AS "BonusID",
			LOWER(
                SUBSTRING(
                    MsCustomer.CustomerName, 
                    CHARINDEX(' ', MsCustomer.CustomerName) + 1, 
                    LEN(MsCustomer.CustomerName)
                    )
                ) AS "Name",
		DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) AS "Day",
		CONVERT(DATE, HeaderSalonServices.TransactionDate, 101) AS "TransactionDate"
    
FROM
	MsCustomer, HeaderSalonServices
    
WHERE   
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
    AND     
	LEN(MsCustomer.CustomerName) - LEN(REPLACE(MsCustomer.CustomerName, ' ', '')) > 0
    AND
	MsCustomer.CustomerName LIKE '%a';