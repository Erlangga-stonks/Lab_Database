
--- 4.	Create a view named ‘ViewTransaction’ to display StaffName, CustomerName, TransactionDate (obtained from TransactionDate in ‘dd mon yyyy’ format), 
---		and PaymentType for every transaction which the transaction is between 21st and 25th day and was paid by ‘Credit’. 
---		(create view, convert, day, between)

USE OOVEO_Salon

CREATE VIEW ViewTransaction AS

SELECT  
	MsStaff.StaffName, 
            MsCustomer.CustomerName,
            CONVERT(DATE, HeaderSalonServices.TransactionDate, 106) AS "TransactionDate",
            HeaderSalonServices.PaymentType
FROM    
	MsStaff, MsCustomer, HeaderSalonServices
    
WHERE   
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
    AND     
	MsStaff.StaffId = HeaderSalonServices.StaffId
    AND     
	DAY(HeaderSalonServices.TransactionDate) BETWEEN 21 AND 25
    AND     
	HeaderSalonServices.PaymentType = 'Credit';