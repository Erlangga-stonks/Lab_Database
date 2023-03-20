
---1.	Create a store procedure with named ‘sp1’ to display CustomerId, CustomerName, CustomerGender, and CustomerAddress 
---		for every Customer with Id based on user’s input.
---		(create procedure)

USE OOVEO_Salon

CREATE PROCEDURE [sp1] @id CHAR(5)
AS
    BEGIN
        SELECT  CustomerId,
                CustomerName,
                CustomerGender,
                CustomerAddress
        FROM   
				MsCustomer
        WHERE   
				CustomerId = @id
    END;

EXEC sp1 'CU001';

GO
