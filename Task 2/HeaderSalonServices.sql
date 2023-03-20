CREATE TABLE HeaderSalonServices
(
 TransactionId CHAR (5) NOT NULL,
 CustomerId CHAR (5) NOT NULL,
 StaffId CHAR (5) NOT NULL,
 TranscactionDate DATE,
 PaymentType VARCHAR (20),

 PRIMARY KEY (TransactionId),
 CONSTRAINT CHK_HeaderSalonServices CHECK(
   TransactionId LIKE 'TR[0-9][0-9]'
   ),
   FOREIGN KEY (CustomerId) REFERENCES MsCustomer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (StaffId) REFERENCES MsStaff(StaffId) ON UPDATE CASCADE ON DELETE CASCADE
);