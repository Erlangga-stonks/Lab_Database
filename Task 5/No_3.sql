
--- 3 Display treatmentName & price SPA
	
USE OOVEO_Salon

SELECT
	TreatmentName,Price

FROM
	MsTreatment AS Mt
	JOIN
	MsTreatmentType AS Mtt

ON
	Mt.TreatmentTypeId = Mtt.TreatmentTypeId

WHERE
	Mtt.TreatmentTypeName
	IN
	(
		'Message / Spa',
		'Beauty Care'
	)
