
---8 Change CustomerAddress

UPDATE
	MsCustomer

SET
	CustomerAddress = 'Daan Mogot Baru Street No. 23'

WHERE
	EXISTS(
SELECT
	CustomerId FROM MsStaff,HeaderSalonServices 
WHERE
  (
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId 
	AND MsStaff.StaffId = HeaderSalonServices.StaffId AND 
	StaffName LIKE 'Indra Saswita' AND 
	DATENAME(WEEKDAY,HeaderSalonServices.TransactionDate) = 'Thursday'
  )		
)

SELECT * FROM MsCustomer