
---	5.	Create trigger with name ‘trig2’ for MsCustomer table to validate if there are any new inserted data,
---		then the first data on MsCustomer will be deleted.
---		(create trigger, top, delete)


CREATE TRIGGER [trig2] ON MsCustomer
    AFTER UPDATE
        AS
            BEGIN
                DELETE  TOP(1)
                FROM    MsCustomer
            END

BEGIN TRANSACTION
    INSERT INTO MsCustomer 
    (
        CustomerId, 
        CustomerName, 
        CustomerGender, 
        CustomerPhone,
        CustomerAddress
    )
    VALUES (
        'CU006',
        'Yogie Soesanto',
        'Male',
        '085562133000',
        'Pelsakih Street no 52'
    )
    SELECT  *
    FROM    MsCustomer
    ROLLBACK

SELECT  *
FROM    MsCustomer

GO