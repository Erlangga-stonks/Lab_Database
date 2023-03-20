
---8.	Create a view named ‘ViewCustomer’ to display CustomerId, CustomerName, CustomerGender from MsCustomer, then add the data to 
---		ViewCustomer with the following specifications:

USE OOVEO_Salon

CREATE VIEW ViewCustomer AS

    SELECT  * FROM    MsCustomer

INSERT INTO ViewCustomer (CustomerId, CustomerName, CustomerGender)
VALUES ('CU006', 'Cristian', 'Male')

SELECT * FROM ViewCustomer