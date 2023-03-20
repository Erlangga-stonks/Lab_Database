
--- 9 Display StaffName, TreatmentName, and Term of Transaction 

USE OOVEO_Salon

SELECT
	StaffName,Mt.TreatmentName,
	DATEDIFF(DAY, Hss.TransactionDate,'2012-12-24') AS "Term of Transaction"

FROM
	MsStaff AS Ms
	JOIN
	HeaderSalonServices AS Hss
ON
	Ms.StaffId = Hss.StaffId
	JOIN
	DetailSalonServices AS Dss
ON
	Dss.TransactionId = Hss.TransactionId
	JOIN
	MsTreatment AS Mt
ON
	Mt.TreatmentId = Dss.TreatmentId

WHERE
	LEN(Mt.TreatmentName) > 20
	OR
	Mt.TreatmentName LIKE '% %'
	