CREATE TABLE MsTreatementType 
(
  TreatmentTypeId CHAR (5) NOT NULL,
  TreatmentTypeName VARCHAR(50),

  PRIMARY KEY (TreatmentTypeId),
  CONSTRAINT CHK_MsTreatementType CHECK(
  TreatmentTypeId LIKE 'TT[0-9][0-9]'
  )
 );