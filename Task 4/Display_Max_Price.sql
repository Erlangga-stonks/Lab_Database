

-- 1 Disp Max Price of data
use OOVEO_Salon

SELECT  MAX(price)                                
			AS 'Maximum Price',
        MIN(price)
			AS 'Minimum Price',
        CAST(ROUND(AVG(price),5) 
			AS decimal(9,3)) 
			AS 'Average Price'
        FROM MsTreatment;