
--- 8 Display StaffName TransactionID

USE OOVEO_Salon

SELECT     
	LEFT(MsStaff.StaffName,
	CHARINDEX(' ',MsStaff.StaffName)), 
	HeaderSalonServices.TransactionId AS 'TransactionId',
    COUNT(HeaderSalonServices.TransactionId) AS 'Total Treatment Per Transaction'

FROM  
	MsStaff,HeaderSalonServices,DetailSalonServices

WHERE 
	HeaderSalonServices.StaffId=MsStaff.StaffId 
	AND 
	HeaderSalonServices.TransactionId=DetailSalonServices.TransactionId

GROUP BY  
	MsStaff.StaffName,HeaderSalonServices.TransactionId
