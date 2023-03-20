
--- 3.	Create a view named ‘ViewTreatment’ to display TreatmentName, TreatmentTypeName, Price (obtained from Price by adding ‘Rp. ’ in front of Price) for every treatment which type is ‘Hair Treatment’ and 
---		price is between 450000 and 800000. 
---		(create view, cast, between)


USE OOVEO_Salon

CREATE VIEW ViewTreatment AS

SELECT 
	MsTreatment.TreatmentName, 
    MsTreatmentType.TreatmentTypeName,
    'Rp.' + CAST(MsTreatment.Price AS VARCHAR) AS "Price"
    
FROM    
	MsTreatment, MsTreatmentType
    
WHERE 
	MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId
    AND     
	MsTreatmentType.TreatmentTypeName = 'Hair Treatment'
    AND     
	MsTreatment.Price BETWEEN 450000 AND 800000;