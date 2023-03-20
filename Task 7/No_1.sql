
--- no 1.	Display TreatmentId, and TreatmentName for every treatment which id is ‘TM001’ or ‘TM002’.
---(in)

USE OOVEO_Salon

SELECT 
	MsTreatment.TreatmentId,
	MsTreatment.TreatmentName

FROM
	MsTreatment

WHERE
	TreatmentId IN ('TM001','TM002')


