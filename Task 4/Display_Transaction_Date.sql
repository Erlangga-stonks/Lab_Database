
--- 3 Disp Transaction Date

use OOVEO_Salon

SELECT     
		CONVERT(varchar,GETDATE(),107) TransactionDate,
        COUNT(TransactionDate) 
			AS 'Total Transaction per Day'
FROM        
	HeaderSalonServices
GROUP BY    
	TransactionDate;