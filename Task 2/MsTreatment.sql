CREATE TABLE MsTreatment
(
 TreatmentId CHAR (5) NOT NULL,
 TreatmentTypeId CHAR (5) NOT NULL,
 TreatmentName VARCHAR (50),
 Price NUMERIC (11,2),

 PRIMARY KEY (TreatmentId),
 CONSTRAINT CHK_MsTreatment CHECK(
 TreatmentId LIKE 'TM[0-9][0-9]'
 ),
 FOREIGN KEY (TreatmentTypeId) REFERENCES MsTreatementType(TreatmentTypeId) ON UPDATE CASCADE ON DELETE CASCADE
);