-- 1
CREATE VIEW ViewBonus AS
    SELECT  REPLACE(CustomerId, 'CU', 'BN') AS "BinusID", CustomerName
    FROM    MsCustomer
    WHERE   LEN(CustomerName) > 10;

GO;

-- 2
CREATE VIEW ViewCustomerData AS
    SELECT  LEFT(CustomerName, CHARINDEX(' ', CustomerName)) AS "Name", 
            CustomerAddress AS "Address", 
            CustomerPhone AS "Phone"
    FROM    MsCustomer
    WHERE   LEN(CustomerName) - LEN(REPLACE(CustomerName, ' ', '')) > 0;

GO;

-- 3
CREATE VIEW ViewTreatment AS
    SELECT  MsTreatment.TreatmentName, 
            MsTreatmentType.TreatmentTypeName,
            'Rp.' + CAST(MsTreatment.Price AS VARCHAR) AS "Price"
    FROM    MsTreatment, MsTreatmentType
    WHERE   MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId
    AND     MsTreatmentType.TreatmentTypeName = 'Hair Treatment'
    AND     MsTreatment.Price BETWEEN 450000 AND 800000;

GO;

-- 4 
CREATE VIEW ViewTransaction AS
    SELECT  MsStaff.StaffName, 
            MsCustomer.CustomerName,
            CONVERT(DATE, HeaderSalonServices.TransactionDate, 106) AS "TransactionDate",
            HeaderSalonServices.PaymentType
    FROM    MsStaff, MsCustomer, HeaderSalonServices
    WHERE   MsCustomer.CustomerId = HeaderSalonServices.CustomerId
    AND     MsStaff.StaffId = HeaderSalonServices.StaffId
    AND     DAY(HeaderSalonServices.TransactionDate) BETWEEN 21 AND 25
    AND     HeaderSalonServices.PaymentType = 'Credit';

GO;

-- 5 
CREATE VIEW ViewBonusCustomer AS
    SELECT  REPLACE(MsCustomer.CustomerId, 'CU', 'BN') AS "BonusID",
            LOWER(
                SUBSTRING(
                    MsCustomer.CustomerName, 
                    CHARINDEX(' ', MsCustomer.CustomerName) + 1, 
                    LEN(MsCustomer.CustomerName)
                    )
                ) AS "Name",
            DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) AS "Day",
            CONVERT(DATE, HeaderSalonServices.TransactionDate, 101) AS "TransactionDate"
    FROM    MsCustomer, HeaderSalonServices
    WHERE   MsCustomer.CustomerId = HeaderSalonServices.CustomerId
    AND     LEN(MsCustomer.CustomerName) - LEN(REPLACE(MsCustomer.CustomerName, ' ', '')) > 0
    AND     MsCustomer.CustomerName LIKE '%a';

GO;

-- 6 
CREATE VIEW ViewTransactionByLivia AS
    SELECT  HeaderSalonServices.TransactionId,
            CONVERT(DATE, HeaderSalonServices.TransactionDate, 107) AS "Date",
            MsTreatment.TreatmentName
    FROM    MsStaff, 
            MsTreatment, 
            HeaderSalonServices, 
            DetailSalonServices
    WHERE   MsStaff.StaffId = HeaderSalonServices.StaffId
    AND     MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
    AND     DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId
    AND     DAY(HeaderSalonServices.TransactionDate) = 21
    AND     MsStaff.StaffName LIKE 'Livia Ashianti';

GO;

-- 7 
ALTER VIEW ViewCustomerData AS
    SELECT  RIGHT(CustomerId, CHARINDEX('U', CustomerId) + 1) AS "ID",
            CustomerName AS "Name",
            CustomerAddress AS "Address",
            CustomerPhone AS "Phone"
    FROM    MsCustomer
    WHERE   CHARINDEX(' ', CustomerName) > 0;

GO;

-- 8 
CREATE VIEW ViewCustomer AS
    SELECT  *
    FROM    MsCustomer;

GO;

INSERT INTO ViewCustomer (CustomerId, CustomerName, CustomerGender)
VALUES ('CU006', 'Cristian', 'Male');

GO;
-- 9 
DELETE FROM ViewCustomerData
    WHERE ID = '005';

GO;

-- 10 
DROP VIEW ViewCustomerData;

GO;