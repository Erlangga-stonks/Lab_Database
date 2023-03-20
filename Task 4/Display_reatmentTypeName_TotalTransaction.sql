
---5 Display TreatmentTypeName and Total Transaction

use OOVEO_Salon

SELECT   
	MsTreatmentType.TreatmentTypeName,
	COUNT(DetailSalonServices.TransactionId) AS 'Total Transaction'

FROM            
	MsTreatmentType,MsTreatment,DetailSalonServices

WHERE           
	MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId

AND             
	msTreatment.TreatmentId = DetailSalonServices.TreatmentId

GROUP BY       
	MsTreatmentType.TreatmentTypeName

ORDER BY    
	'Total Transaction' 

DESC;