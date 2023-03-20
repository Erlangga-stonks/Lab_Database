
--- No 9.	Display StaffName, StaffPosition, and StaffSalary for every staff with highest salary or lowest salary.
---		(alias subquery, max, min)

USE OOVEO_Salon

SELECT
	MsStaff.StaffName,
	MsStaff.StaffPosition,
	MsStaff.StaffSalary

FROM
	MsStaff,
	(SELECT MAX(staffsalary) AS MAX_Salary, MIN(staffsalary) AS MIN_Salary FROM MsStaff) AS Salary

WHERE
	StaffSalary = Salary.MAX_Salary
	OR
	StaffSalary = Salary.MIN_Salary


