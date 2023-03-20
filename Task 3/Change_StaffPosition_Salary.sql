
---5 Change StaffPosition and add StaffSalary

UPDATE
	 MsStaff

SET
	StaffPosition = REPLACE(StaffPosition,'Stylist','Top Stylist'),
	StaffSalary = StaffSalary + 7000000 

WHERE 
	StaffName LIKE 'Effendy Lesmana'


SELECT * FROM MsStaff