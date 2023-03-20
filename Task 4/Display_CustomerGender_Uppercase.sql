
--- 4 Display Customer Gender on Uppercase

use OOVEO_Salon

SELECT
	UPPER (CustomerGender) CustomerGender,
	COUNT (CustomerGender) as 'Total Trancaction'

FROM
	MsCustomer T , HeaderSalonServices S

WHERE
	T.CustomerId = S.CustomerId

GROUP BY
	CustomerGender
