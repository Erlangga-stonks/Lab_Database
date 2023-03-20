
--- 10 Display TransactionDate, CustomerName, and TotalPrice 

USE OOVEO_Salon

SELECT      
	HeaderSalonServices.TransactionDate, MsCustomer.CustomerName,
    SUM(MsTreatment.Price) AS 'Price'

FROM        
	HeaderSalonServices,MsCustomer,MsTreatment,DetailSalonServices

WHERE      
	HeaderSalonServices.CustomerId = MsCustomer.CustomerId
	AND   
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
	AND         
	DATENAME(DAY, HeaderSalonServices.TransactionDate) > 20

GROUP BY    
	HeaderSalonServices.TransactionDate,MsCustomer.CustomerName

ORDER BY    
HeaderSalonServices.TransactionDate 

ASC;