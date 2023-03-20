
--- 9.	Delete data in view ‘ViewCustomerData’ that has ID ‘005’. Then display all data from ViewCustomerData.
---		(delete)


USE OOVEO_Salon

DELETE FROM ViewCustomerData
    WHERE ID = '005';

SELECT * FROM ViewCustomerData
