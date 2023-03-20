---
-- 1. 
---
SELECT  MAX(price)                                 AS 'Maximum Price',
        MIN(price)                                 AS 'Minimum Price',
        CAST(ROUND(AVG(price),5) AS decimal(9,3))  AS 'Average Price'
        FROM MsTreatment;
---
-- 2. 
---
SELECT      StaffPosition,
            LEFT(StaffGender,1)                                                     AS 'Gender', 
            CONCAT('Rp.',CAST(CAST(AVG(StaffSalary) AS decimal(10,2)) AS VARCHAR))  AS'Avarage SALARY'
FROM        MsStaff
GROUP BY    StaffPosition,StaffGender;

---
--- 3. 
---
SELECT      CONVERT(varchar,GETDATE(),107) TransactionDate,
            COUNT(TransactionDate)  AS 'Total Transaction per Day'
FROM        HeaderSalonServices
GROUP BY    TransactionDate;
---
--- 4. 
---
SELECT      UPPER(CustomerGender)  CustomerGender,
            COUNT(CustomerGender) AS 'Total Transaction'
FROM        MsCustomer C, HeaderSalonServices H
WHERE       C.CustomerId = H.CustomerId
GROUP BY    CustomerGender;
---
--- 5.
---
SELECT          MsTreatmentType.TreatmentTypeName,COUNT(DetailSalonServices.TransactionId) AS 'Total Transaction'
FROM            MsTreatmentType,MsTreatment,DetailSalonServices
WHERE           MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId
AND             MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
GROUP BY        MsTreatmentType.TreatmentTypeName
ORDER BY        'Total Transaction' DESC; 

---
--- 6. 
--- 
SELECT      CONVERT(VARCHAR ,(HeaderSalonServices.TransactionDate),106) AS 'Date',
            CONCAT('Rp. ',CAST(SUM(MsTreatment.Price) AS VARCHAR))      AS 'Revenue per Day'
FROM        HeaderSalonServices,DetailSalonServices,MsTreatment
WHERE       HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
AND         DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
GROUP BY    TransactionDate
HAVING      SUM(MsTreatment.Price) BETWEEN 1000000 AND 5000000;

---
--- 7. 
---

SELECT      REPLACE(MsTreatment.TreatmentTypeId,'TT0', 'Treatment Type ')    AS 'ID',
            MsTreatmentType.TreatmentTypeName,
            CONCAT(COUNT(MsTreatment.TreatmentTypeId), ' Treatment')         AS 'Total Treatment per Type'
FROM        MsTreatment,MsTreatmentType
WHERE       MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
GROUP BY    MsTreatment.TreatmentTypeId, MsTreatmentType.TreatmentTypeName
HAVING      COUNT(MsTreatment.TreatmentTypeId) > 5
ORDER BY    COUNT(MsTreatment.TreatmentTypeId) DESC;
---
--- 8. 
---
SELECT      LEFT(MsStaff.StaffName,CHARINDEX(' ',MsStaff.StaffName)), 
            HeaderSalonServices.TransactionId AS 'TransactionId',
            COUNT(HeaderSalonServices.TransactionId) AS 'Total Treatment Per Transaction'
FROM        MsStaff,HeaderSalonServices,DetailSalonServices
WHERE       HeaderSalonServices.StaffId=MsStaff.StaffId AND HeaderSalonServices.TransactionId=DetailSalonServices.TransactionId
GROUP BY    MsStaff.StaffName,HeaderSalonServices.TransactionId

---
--- 9 
---
SELECT      HeaderSalonServices.TransactionDate,MsCustomer.CustomerName,MsTreatment.TreatmentName,MsTreatment.Price
FROM        HeaderSalonServices,MsCustomer,MsTreatment,MsStaff,DetailSalonServices
WHERE       HeaderSalonServices.CustomerId = MsCustomer.CustomerId
AND         HeaderSalonServices.StaffId = MsStaff.StaffId
AND         HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
AND         DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
AND         DATENAME(WEEKDAY,HeaderSalonServices.TransactionDate) = 'Tuesday'
AND         MsStaff.StaffName LIKE '%Ryan%'
ORDER BY    HeaderSalonServices.TransactionDate,MsCustomer.CustomerName ASC;

---
--- 10 
---
SELECT      HeaderSalonServices.TransactionDate, MsCustomer.CustomerName,
            SUM(MsTreatment.Price) AS 'Price'
FROM        HeaderSalonServices,MsCustomer,MsTreatment,DetailSalonServices
WHERE       HeaderSalonServices.CustomerId = MsCustomer.CustomerId
AND         HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
AND         DATENAME(DAY, HeaderSalonServices.TransactionDate) > 20
GROUP BY    HeaderSalonServices.TransactionDate,MsCustomer.CustomerName
ORDER BY    HeaderSalonServices.TransactionDate ASC;