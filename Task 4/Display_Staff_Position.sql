
---2 Disp Staff Position
use OOVEO_Salon

SELECT      StaffPosition,
            LEFT(StaffGender,1)                                                    
			AS 'Gender', 
            CONCAT('Rp.',CAST(CAST(AVG(StaffSalary) 
			AS decimal(10,2)) 
			AS VARCHAR))  
			AS'Avarage SALARY'
FROM        MsStaff
GROUP BY    StaffPosition,StaffGender;
