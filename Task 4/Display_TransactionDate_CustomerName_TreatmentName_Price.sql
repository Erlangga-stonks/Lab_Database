
--- 9 Display TransactionDate, CustomerName, TreatmentName, and Price

USE OOVEO_Salon

SELECT      
	HeaderSalonServices.TransactionDate,MsCustomer.CustomerName,MsTreatment.TreatmentName,MsTreatment.Price

FROM 
	HeaderSalonServices,MsCustomer,MsTreatment,MsStaff,DetailSalonServices

WHERE 
	HeaderSalonServices.CustomerId = MsCustomer.CustomerId
	AND
	HeaderSalonServices.StaffId = MsStaff.StaffId
	AND
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
	AND
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
	AND
	DATENAME(WEEKDAY,HeaderSalonServices.TransactionDate) = 'Tuesday'
	AND   
	MsStaff.StaffName LIKE '%Ryan%'

ORDER BY
	HeaderSalonServices.TransactionDate,MsCustomer.CustomerName 

ASC;