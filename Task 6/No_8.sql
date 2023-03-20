
--- 8.	Display Name (obtained by adding ‘Mr. ’ in front of StaffName), StaffPosition, and StaffSalary for every male staff

USE OOVEO_Salon

SELECT
	'Mr. ' + MsStaff.StaffName AS 'Name',
	MsStaff.StaffPosition AS 'StaffPosition',
	MsStaff.StaffSalary

FROM
	MsStaff		

WHERE
	MsStaff.StaffGender IN ('Male')

UNION

SELECT
	 'Ms. ' + MsStaff.StaffName AS 'Name',
	 MsStaff.StaffPosition,
	 MsStaff.StaffSalary

FROM 
	MsStaff

WHERE
	MsStaff.StaffGender IN ('Female')

ORDER BY
	'Name','StaffPosition'  asc
