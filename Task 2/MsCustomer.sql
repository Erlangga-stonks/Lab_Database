CREATE TABLE MsCustomer
(
CustomerId CHAR (5) NOT NULL,
CustomerName VARCHAR(50),
CustomerGender VARCHAR (10),
CustomerPhone VARCHAR(13),
CusotmerAddress VARCHAR(100),

PRIMARY KEY (CustomerId),
CONSTRAINT CHK_MsCustomer CHECK(
 CustomerId LIKE 'CU[0-9][0-9]' AND
 (CustomerGender LIKE 'MALE' OR CustomerGender LIKE 'FEMALE')
 )
);