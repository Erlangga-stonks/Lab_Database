
--- 4 Display StaffName,Position & TransactionDate

USE OOVEO_Salon

SELECT
	StaffName,StaffPosition,
	CONVERT(VARCHAR,hss.TransactionDate, 107) AS TransactionDate

FROM
	MsStaff AS Ms
	JOIN
	HeaderSalonServices AS Hss

ON
	Ms.StaffId = Hss.StaffId

WHERE
	StaffSalary BETWEEN 7000000 AND 10000000