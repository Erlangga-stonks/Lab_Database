
--- no 4.	Display TreatmentTypeName, TreatmentName, and Price for every treatment that taken by customer whose name contains ‘Putra’ and happened on day 22th.
---(in, like, day)

SELECT
	MsTreatmentType.TreatmentTypeName,
	MsTreatment.TreatmentName,
	MsTreatment.Price


FROM
	MsTreatment,MsTreatmentType,
	MsCustomer,HeaderSalonServices,DetailSalonServices

WHERE
	MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
	AND
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
	AND
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
	AND
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
	AND
	MsCustomer.CustomerName LIKE '%putra%'
	AND
	DATENAME(Day,HeaderSalonServices.TransactionDate) = 22

