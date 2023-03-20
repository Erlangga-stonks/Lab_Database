
---4.	Create trigger named ‘trig1’ for MsCustomer table to validate if there are any data which had been updated, 
---		it will display before and after updated data on MsCustomer table.
---		(create trigger, union)

USE OOVEO_Salon

CREATE TRIGGER [trig1] ON MsCustomer
   
   FOR UPDATE
        AS
            BEGIN
                SELECT * FROM INSERTED
                UNION
                SELECT * FROM DELETED
            END

SELECT  *	FROM   MsCustomer

BEGIN TRANSACTION
    UPDATE  MsCustomer
    SET     CustomerName = 'Franky Quo'
    WHERE   CustomerId = 'CU001'
    SELECT * FROM MsCustomer
    ROLLBACK

GO



