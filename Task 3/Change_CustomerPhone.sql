
---4 Change Cust Phone on MsCustomer

UPDATE MsCustomer

SET CustomerPhone = REPLACE(CustomerPhone,'08','628')

WHERE CustomerPhone LIKE '08%';

SELECT * FROM MsCustomer;
