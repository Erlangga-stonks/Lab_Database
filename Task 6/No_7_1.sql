USE	OOVEO_Salon

SELECT
	SUM(MsTreatment.Price), TransactionId

FROM
	MsTreatment
	JOIN
	DetailSalonServices
	ON
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId

GROUP BY
	DetailSalonServices.TransactionId
