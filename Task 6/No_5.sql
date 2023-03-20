
--- 5.	Display Day (obtained from the day transaction happened)

USE OOVEO_Salon

SELECT
	DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) AS 'Day',
	MsCustomer.CustomerName,
	MsTreatment.TreatmentName

FROM
	HeaderSalonServices
	JOIN
	MsCustomer
	ON
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
	JOIN
	DetailSalonServices
	ON
	DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId
	JOIN
	MsTreatment
	ON
	MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
	JOIN
	MsStaff
	ON
	MsStaff.StaffId = HeaderSalonServices.StaffId

WHERE
	MsStaff.StaffGender IN ('Female')
	AND
	MsStaff.StaffPosition LIKE 'top%'

ORDER BY
	MsCustomer.CustomerName ASC