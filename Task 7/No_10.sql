
--- no 10.	Display CustomerName,CustomerPhone,CustomerAddress, and Count Treatment 
---  (obtained from the total number of treatment) for every transaction which has the highest total number of treatment

USE OOVEO_Salon

SELECT
	MsCustomer.CustomerName,
	MsCustomer.CustomerPhone,
	MsCustomer.CustomerAddress,
	COUNT(MsTreatment.TreatmentId) AS 'Count Treatment'

FROM
	MsTreatment,
	MsCustomer,
	HeaderSalonServices,
	DetailSalonServices,
	(
SELECT
	MAX(b.Total) AS MAX_Value

FROM    
	(
    SELECT      COUNT(MsTreatment.TreatmentId) AS Total
    
	FROM   
		MsTreatment, 
        MsCustomer, 
		HeaderSalonServices, 
		DetailSalonServices
		
    WHERE  
		MsCustomer.CustomerId = HeaderSalonServices.CustomerId
        AND         
		MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
        AND     
		HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
	GROUP BY    
		MsCustomer.CustomerName, MsCustomer.CustomerPhone, MsCustomer.CustomerAddress
		) AS x
      ) AS y

WHERE      
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
	AND       
	MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
	AND      
	HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId

GROUP BY    
	MsCustomer.CustomerName, 
    MsCustomer.CustomerPhone, 
    MsCustomer.CustomerAddress, 
    y.Max_Value

HAVING
	COUNT(MsTreatment.TreatmentId) = y.Max_Value;
	