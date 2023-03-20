
---7 Change CustomerName Adding Ms

UPDATE
	MsCustomer

SET
	CustomerName = CONCAT('Ms. ',CustomerName)

WHERE
	CustomerId IN ('CU002','CU003')

SELECT * FROM MsCustomer
