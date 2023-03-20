
--	9.	Create procedure with name ‘sp5’ that receive CustomerId from user’s input to display 
---		CustomerName, and TransactionDate for every customer 
---		which Id has been inputted by user and did treatment which ID is an even number.
---		(create procedure, declare cursor, in, right)

USE OOVEO_Salon

CREATE PROCEDURE [sp5] @id CHAR(5)
    AS
        BEGIN
            DECLARE [cur3] CURSOR
                FOR
                    SELECT  MsCustomer.CustomerName,
                            HeaderSalonServices.TransactionDate
                    FROM    MsCustomer
                    JOIN    HeaderSalonServices
                    ON      MsCustomer.CustomerId = HeaderSalonServices.CustomerId
                    WHERE   MsCustomer.CustomerId IN (@id)
                
            DECLARE
                @nama VARCHAR(50),
                @date DATE
            
            OPEN [cur3]

            FETCH NEXT FROM [cur3] INTO @nama, @date

            IF @@FETCH_STATUS <> 0
                PRINT 'Cursor Fetch Failed!'

            WHILE @@FETCH_STATUS = 0
                BEGIN
                    PRINT 'Customer Name : ' + @nama + ' Transaction Date is ' + CAST(@date AS VARCHAR)
                    FETCH NEXT FROM [cur3] INTO @nama, @date
                END

            CLOSE [cur3]
            DEALLOCATE [cur3]
        END

EXEC [sp5] 'CU001'

GO
