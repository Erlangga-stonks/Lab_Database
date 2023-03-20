
---10 Display TransactionDate, CustomerName, TreatmentName, Discount 

USE OOVEO_Salon

SELECT
	Hss.TransactionDate,Mc.CustomerName,Mt.TreatmentName,
	CAST(Mt.Price * 0.2 AS INT) AS Discount,
	Hss.PaymentType

FROM
	MsCustomer AS Mc
	JOIN
	HeaderSalonServices AS Hss
ON
	Mc.CustomerId = Hss.CustomerId
	JOIN
	DetailSalonServices AS Dss
ON
	Dss.TransactionId = Hss.TransactionId
	JOIN
	MsTreatment AS Mt
ON
	Mt.TreatmentId = Dss.TreatmentId

WHERE
	DAY(Hss.TransactionDate) = '22'