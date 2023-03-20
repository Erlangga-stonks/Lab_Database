
--- 6 Display Initial using UPPER case

USE OOVEO_Salon

SELECT
	UPPER(LEFT(CustomerName, 1)		
	+ 
	SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName) + 1, 1)) AS Initial,
	DATENAME(WEEKDAY,Hss.TransactionDate) AS Day

FROM
	MsCustomer AS Mc
	JOIN
		HeaderSalonServices AS Hss

ON
	Mc.CustomerId = Hss.CustomerId

WHERE
	DATEDIFF(DAY, Hss.TransactionDate, '2012-12-24') < 3

