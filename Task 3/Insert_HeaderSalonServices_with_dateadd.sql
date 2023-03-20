
---2 Insert HeaderSalonServices with DateADD

INSERT INTO 
	HeaderSalonServices (TransactionId,CustomerId,StaffId,TransactionDate,PaymentType)

VALUES
  (
	'TR019',
	'CU005',
	'SF004',
	DATEADD(DAY,3,CAST(GETDATE()AS date)),
	'Credit'
  )