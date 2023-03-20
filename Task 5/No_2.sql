
--- 2 Disp StaffName & StaffSalary by add Rp

USE OOVEO_Salon

SELECT 
	StaffName,
	'Rp. ' + CAST(CAST(StaffSalary AS decimal (20, 2)) AS VARCHAR) AS StaffSalary

FROM
	MsStaff

WHERE
	StaffName LIKE '%m%'
	AND
	StaffSalary >= 10000000


