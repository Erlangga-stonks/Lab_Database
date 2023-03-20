
---7.	Display CustomerId, TransactionId, CustomerName, and Total Price (obtained from total amount of price)

USE OOVEO_Salon

SELECT
	MsCustomer.CustomerId,
	MsCustomer.CustomerName,
	HeaderSalonServices.TransactionId,
	
	SUM(MsTreatment.Price) AS 'Total Price'

FROM
	MsCustomer
	JOIN
	HeaderSalonServices
	ON
	HeaderSalonServices.CustomerId = MsCustomer.CustomerId
	JOIN
	DetailSalonServices
	ON
	DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId
	JOIN
	MsTreatment
	ON
	MsTreatment.TreatmentId = DetailSalonServices.TreatmentId

GROUP BY
	MsCustomer.CustomerId,
	MsCustomer.CustomerName,
	HeaderSalonServices.TransactionId

HAVING
	SUM(MsTreatment.Price) > (SELECT SUM(av.Hasil) FROM (SELECT AVG(MsTreatment.Price) AS Hasil) AS av)
	
ORDER BY
	 'Total Price' DESC