
--- 9 Display TreatmentName, Price (obtained by adding ‘Rp. ’ in front of Price),
---	 and Status as ‘Maximum Price’ for every Treatment which price is the highest treatment’s price.

USE OOVEO_Salon

SELECT
	MsTreatment.TreatmentName,
	'Rp. ' + CAST(MsTreatment.Price AS VARCHAR) AS Price,
	'Minimum Price' AS 'Status'

FROM
	MsTreatment

WHERE
	Price = (SELECT MIN(Price) FROM MsTreatment)

UNION
SELECT
	MsTreatment.TreatmentName,
	'Rp. '+ CAST(MsTreatment.Price AS VARCHAR) AS Price,
	'Maximum Price' AS 'Status'

FROM
	MsTreatment

WHERE
	Price = (SELECT MAX(Price) FROM MsTreatment)