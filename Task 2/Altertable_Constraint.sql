ALTER TABLE MsStaff WITH NOCHECK
 ADD CONSTRAINT validate_MsStaff CHECK (LEN (StaffName)>5 AND LEN (StaffName)<20);

