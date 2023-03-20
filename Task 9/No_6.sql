
--- 6.	Create trigger with name ‘trig3’ on MsCustomer table to validate if the data on MsCustomer table is deleted,
---		then the deleted data will be insert into Removed table. If Removed table hasn’t been created, then create the Removed table and insert 
---		the deleted data to Removed table.
---		(create trigger, object_id, is not null, insert, select into)

USE OOVEO_Salon

CREATE TRIGGER [trig3]
    ON MsCustomer
    FOR DELETE
        AS
            BEGIN
                IF OBJECT_ID('REMOVED') IS NOT NULL
                    BEGIN
                        INSERT INTO [REMOVED]
                        SELECT  *
                        FROM    MsCustomer
                    END
                ELSE
                    BEGIN
                        SELECT  * 
                        INTO    [REMOVED] 
                        FROM    MsCustomer
                    END
            END
			
BEGIN TRANSACTION
    DELETE FROM MsCustomer
    WHERE CustomerId = 'CU002'
    SELECT * FROM MsCustomer
    SELECT * FROM [REMOVED]
    ROLLBACK

DROP TRIGGER [trig3]

GO
