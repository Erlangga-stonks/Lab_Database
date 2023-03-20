
--- 7 Display ID On TreatmentTypeName

USE OOVEO_Salon

SELECT      
	REPLACE(MsTreatment.TreatmentTypeId,'TT0', 'Treatment Type ') AS 'ID',
            MsTreatmentType.TreatmentTypeName,
    CONCAT(COUNT(MsTreatment.TreatmentTypeId), ' Treatment') AS 'Total Treatment per Type'

FROM        
	MsTreatment,MsTreatmentType

WHERE     
	MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId

GROUP BY   
	MsTreatment.TreatmentTypeId, MsTreatmentType.TreatmentTypeName

HAVING
	COUNT(MsTreatment.TreatmentTypeId) > 5

ORDER BY
	COUNT(MsTreatment.TreatmentTypeId) 

DESC;
