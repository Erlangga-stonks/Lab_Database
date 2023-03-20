
--- 5 Display First Character using substring

USE OOVEO_Salon

SELECT
	SUBSTRING(CustomerName, 1 , CHARINDEX(' ',CustomerName + ' ')) AS name,
	LEFT
	(CustomerGender, 1) AS Gender,
	Hss.PaymentType

FROM
	MsCustomer AS Mc
	JOIN
	HeaderSalonServices AS Hss

ON
	Mc.CustomerId = Hss.CustomerId

WHERE
	Hss.PaymentType LIKE 'D%'
