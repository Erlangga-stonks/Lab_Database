
--- 6.	Create a view named ‘ViewTransactionByLivia’ to display TransactionId, Date (obtained from TransactionDate in ‘Mon dd, yyyy’ format),
---		and TreatmentName for every transaction which occurred on the 21st day and handled by staff whose name is ‘Livia Ashianti’. 
---		(create view, convert, day, like)

USE OOVEO_Salon

CREATE VIEW ViewTransactionByLivia AS

SELECT  
	HeaderSalonServices.TransactionId,
    CONVERT(DATE, HeaderSalonServices.TransactionDate, 107) AS "Date",	MsTreatment.TreatmentName
    
FROM    
	MsStaff, MsTreatment, 
    HeaderSalonServices,DetailSalonServices

WHERE   
	MsStaff.StaffId = HeaderSalonServices.StaffId
    AND     
	MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
    AND     
	DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId
    AND     
	DAY(HeaderSalonServices.TransactionDate) = 21
    AND     
	MsStaff.StaffName LIKE 'Livia Ashianti'

