
--- 2.	Display TreatmentName, and Price for every treatment which type  is not ‘Hair Treatment’ and ‘Message / Spa’.
--- (in, not in) 

USE OOVEO_Salon


SELECT
	MsTreatment.TreatmentName,
	MsTreatment.Price

FROM
	MsTreatment, MsTreatmentType

WHERE
	MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
	AND
	MsTreatmentType.TreatmentTypeName NOT IN ('Hair Treatment','Hair Spa Treatment')
