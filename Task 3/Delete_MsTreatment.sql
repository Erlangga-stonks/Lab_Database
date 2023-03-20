
---10 Delete MsTreatment String 'Treatment'

DELETE

FROM
	MsTreatment

WHERE
	TreatmentTypeId
IN
	(
SELECT
	TreatmentTypeId
	
FROM 
	MsTreatmentType 

WHERE 
	TreatmentTypeName NOT LIKE ('%Treatment%')
	
	)
SELECT * FROM MsTreatment