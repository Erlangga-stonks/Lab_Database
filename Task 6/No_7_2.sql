
--- Penghitung Rata rata no 7

USE OOVEO_Salon

SELECT
	AVG(Average.Total)

FROM
	(SELECT SUM(Price) AS Total FROM DetailSalonServices
	JOIN
	MsTreatment
	ON
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId

GROUP BY
	TransactionId) AS Average


