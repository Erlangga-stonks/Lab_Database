
--- No 5.	Display StaffName, CustomerName, and TransactionDate (obtained from TransactionDate in ‘Mon dd,yyyy’ format) for every treatment 
---         which the last character of treatmentid is an even number.
---		(convert, exists, right)

USE OOVEO_Salon

SELECT
	MsStaff.StaffName,
	MsCustomer.CustomerName,
	CONVERT(VARCHAR,HeaderSalonServices.TransactionDate,107) AS TransactionDate

FROM
	MsCustomer,MsStaff,HeaderSalonServices,DetailSalonServices

WHERE
	EXISTS
	(
	SELECT	
	MsTreatment.TreatmentId
	FROM
	MsTreatment
	WHERE
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
	AND
	MsStaff.StaffId = HeaderSalonServices.StaffId
	AND
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
	AND
	DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
	AND
	CONVERT(INT,RIGHT(MsTreatment.TreatmentId,1)) % 2 = 0
	)
