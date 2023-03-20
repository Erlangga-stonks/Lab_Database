CREATE TABLE MsStaff (
  StaffId CHAR(5) NOT NULL,
  StaffName VARCHAR(50),
  StaffGender VARCHAR(10),
  StaffPhone VARCHAR(13),
  StaffAddress VARCHAR(100),
  StaffSalary NUMERIC (11,2),
  PRIMARY KEY (StaffId),
  CONSTRAINT CHK_MsStaff CHECK(
     StaffId LIKE 'SF[0-9][0-9]' AND
	 (StaffGender LIKE 'MALE' OR StaffGender LIKE 'FEMALE')
	 )
);