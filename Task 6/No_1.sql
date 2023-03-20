
--- 1 Display TreatmentTypeName, TreatmentName, and Price
---   for every treatment which name contains ‘hair’ or start with ‘nail’ word and has price below 100000

USE OOVEO_Salon

SELECT
	MsTreatmentType.TreatmentTypeName,
	MsTreatment.TreatmentName,
	MsTreatment.Price

FROM
	MsTreatment 
	JOIN 
	MsTreatmentType 
ON
	MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId

WHERE
(
	MsTreatmentType.TreatmentTypeName LIKE '%hair%'
	or
	MsTreatmentType.TreatmentTypeName LIKE 'nail%'
)
AND
	MsTreatment.Price < 100000