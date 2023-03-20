--- 6 Display Date On revenue day

use OOVEO_Salon

SELECT     
	CONVERT(VARCHAR ,(HeaderSalonServices.TransactionDate),106) AS 'Date',
	CONCAT('Rp. ',CAST(SUM(MsTreatment.Price) AS VARCHAR))      AS 'Revenue per Day'

FROM       
	HeaderSalonServices,DetailSalonServices,MsTreatment

WHERE       
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId

AND         
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId

GROUP BY   
	TransactionDate

HAVING      
	SUM(MsTreatment.Price) 
	BETWEEN 1000000 AND 5000000;
