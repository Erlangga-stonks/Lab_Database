
--- No 7.	Display ID (obtained form last 3 characters of StaffID), and  Name (obtained by taking character after the first space until character before second space in StaffName) for every staff whose name contains at least 3 words and  hasn’t served male customer .
--- (right, substring, charindex, len, exists, in,not like, like)

USE OOVEO_Salon

SELECT
	RIGHT(MsStaff.StaffId, 3) AS 'ID',
	SUBSTRING
	(
		MsStaff.StaffName,
		CHARINDEX(' ', MsStaff.StaffName) + 1,
		CHARINDEX(' ', MsStaff.StaffName) + 1
	) AS StaffName

FROM
	MsStaff

WHERE
	EXISTS
	(
	SELECT	
		MsStaff.StaffName, MsCustomer.CustomerName
	FROM
		MsCustomer,HeaderSalonServices
	WHERE
		MsCustomer.CustomerId = HeaderSalonServices.CustomerId
		AND
		LEN(MsStaff.StaffName) - LEN(REPLACE(MsStaff.StaffName,' ','')) >=2
		AND
		MsCustomer.CustomerGender NOT LIKE 'MALE'
	)
