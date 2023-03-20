
--- 2 Display StaffName and StaffEmail using Distinct

USE OOVEO_Salon

SELECT
	 DISTINCT
		MsStaff.StaffName, --- Data yang sama tidak akan ditampilkan
		LOWER(LEFT(MsStaff.StaffName,1)) +
		LOWER(RIGHT(MsStaff.StaffName,CHARINDEX(' ',REVERSE(MsStaff.StaffName)) - 1)) +
		'@oosalon.com' AS 'staff email'

FROM
	MsStaff
	JOIN
	HeaderSalonServices

ON
	HeaderSalonServices.StaffId = MsStaff.StaffId

WHERE
	DATENAME(WEEKDAY,HeaderSalonServices.TransactionDate) = 'Thursday'