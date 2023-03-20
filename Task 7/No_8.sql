
--- No 8.	Display TreatmentTypeName, TreatmentName, and Price for every treatment 
---         which price is higher than average of all treatment’s price.
--- (alias subquery, avg)

USE OOVEO_Salon

SELECT
	MsTreatmentType.TreatmentTypeName,
	MsTreatment.TreatmentName,
	MsTreatment.Price

FROM
	(SELECT AVG(price) AS Result FROM MsTreatment) AS AVG_price,
	MsTreatment,MsTreatmentType

WHERE
	MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
	AND
	MsTreatment.Price > AVG_price.Result