
---	2.	Create a store procedure with named ‘sp2’ that receives CustomerName as input from user with the following specification:
---	If the length of CustomerName is odd then procedure will give output ‘Character Length of Mentor Name is an Odd Number’.
---	If the length of CustomerName is even then procedure will display CustomerId, CustomerName, CustomerGender, TransactionId, and TransactionDate for every transaction with customer whose name contains the name that was inputted by user.
--- (create procedure, len, like)

USE OOVEO_Salon	

CREATE PROCEDURE [sp2] @name VARCHAR(50)
AS
    BEGIN
        IF LEN(@name) % 2 = 1
            BEGIN
                PRINT 'Character Length of Mentor Name is an Odd Number'
            END
        ELSE
            BEGIN
                SELECT 
						MsCustomer.CustomerId,
                        MsCustomer.CustomerName,
                        MsCustomer.CustomerGender,
                        HeaderSalonServices.TransactionId,
                        HeaderSalonServices.TransactionDate
                FROM   
					MsCustomer
					INNER JOIN  
					HeaderSalonServices ON HeaderSalonServices.CustomerId = MsCustomer.CustomerId
                WHERE  
				MsCustomer.CustomerName LIKE '%' + @name + '%'
            END
    END;

EXEC sp2 'Elysia Chen';

EXEC sp2 'Fran';

GO