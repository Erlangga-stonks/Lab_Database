
--- 6.	Display the first data of CustomerId, CustomerName, TransactionId, Total Treatment (obtained from the total number of treatment)

USE OOVEO_Salon

SELECT
	TOP
	1 MsCustomer.CustomerId,
	MsCustomer.CustomerName,
	HeaderSalonServices.TransactionId,
	COUNT(DetailSalonServices.TreatmentId) AS 'Total Treatment'

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

GROUP BY
	MsCustomer.CustomerId,MsCustomer.CustomerName,HeaderSalonServices.TransactionId

ORDER BY 
	'Total treatment' DESC