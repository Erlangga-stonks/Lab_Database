USE OOVEO_Salon;

----- No 1 (select)
SELECT
   * 
FROM
   MsStaff 	---
WHERE
   StaffGender = 'Female' 	---
   -- No 2 (cast, like)
   ---
   SELECT
      StaffName,
      'Rp. ' + CAST(CAST(StaffSalary AS DECIMAL(20, 2)) AS VARCHAR) AS StaffSalary 
   FROM
      MsStaff 
   WHERE
      StaffName LIKE '%m%' 
      AND StaffSalary >= 10000000 		---
      -- No 3 (in)
      ---
      SELECT
         TreatmentName,
         Price 
      FROM
         MsTreatment AS MT 
         JOIN
            MsTreatmentType AS MTT 
            ON MT.TreatmentTypeId = MTT.TreatmentTypeId 
      WHERE
         MTT.TreatmentTypeName IN 
         (
            'Message / Spa',
            'Beauty Care'
         )
         ---
         -- No 4 (convert, between)
         ---
         SELECT
            StaffName,
            StaffPosition,
            CONVERT(VARCHAR, HSS.TransactionDate, 107 ) AS TransactionDate 
         FROM
            MsStaff AS MS 
            JOIN
               HeaderSalonServices AS HSS 
               ON MS.StaffId = HSS.StaffId 
         WHERE
            StaffSalary BETWEEN 7000000 AND 10000000 				---
            -- No 5 (substring, charindex, left)
            ---
            SELECT
               SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName + ' ')) AS Name,
               LEFT(CustomerGender, 1) AS Gender,
               HSS.PaymentType 
            FROM
               MsCustomer AS MC 
               JOIN
                  HeaderSalonServices AS HSS 
                  ON MC.CustomerId = HSS.CustomerId 
            WHERE
               HSS.PaymentType LIKE 'D%' 					---
               -- No 6 (upper, left, substring, charindex, datename, weekday, datediff, day)
               ---
               SELECT
                  UPPER(LEFT(CustomerName, 1) + SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName) + 1, 1)) AS Initial,
                  DATENAME(WEEKDAY, HSS.TransactionDate) AS Day 
               FROM
                  MsCustomer AS MC 
                  JOIN
                     HeaderSalonServices AS HSS 
                     ON MC.CustomerId = HSS.CustomerId 
               WHERE
                  DATEDIFF(DAY, HSS.TransactionDate, '2012-12-24') < 3 						---
                  -- No 7 (right, charindex, reverse, like, datename, weekday)
                  ---
                  SELECT
                     HSS.TransactionDate,
                     RIGHT(CustomerName, CHARINDEX(' ' , REVERSE(CustomerName))) AS CustomerName 
                  FROM
                     MsCustomer AS MC 
                     JOIN
                        HeaderSalonServices AS HSS 
                        ON MC.CustomerId = HSS.CustomerId 
                  WHERE
                     CustomerName LIKE '% %' 
                     AND DATENAME(WEEKDAY, HSS.TransactionDate) = 'Saturday' 							---
                     -- No 8 (replace, like)
                     ---
                     SELECT
                        StaffName,
                        MC.CustomerName,
                        REPLACE(CustomerPhone, '08', '+628') AS CustomerPhone,
                        MC.CustomerAddress 
                     FROM
                        MsStaff AS MS 
                        JOIN
                           HeaderSalonServices AS HSS 
                           ON MS.StaffId = HSS.StaffId 
                        JOIN
                           MsCustomer AS MC 
                           ON MC.CustomerId = HSS.CustomerId 
                     WHERE
                        MC.CustomerName LIKE '%[A,I,U,E,O]%' 
                        AND MS.StaffName LIKE '% % %' 								---
                        -- No 9 (datediff, day, len, like)
                        ---
                        SELECT
                           StaffName,
                           MT.TreatmentName,
                           DATEDIFF(DAY, HSS.TransactionDate, '2012-12-24') AS "Term of Transaction" 
                        FROM
                           MsStaff AS MS 
                           JOIN
                              HeaderSalonServices AS HSS 
                              ON MS.StaffId = HSS.StaffId 
                           JOIN
                              DetailSalonServices AS DSS 
                              ON DSS.TransactionId = HSS.TransactionId 
                           JOIN
                              MsTreatment AS MT 
                              ON MT.TreatmentId = DSS.TreatmentId 
                        WHERE
                           LEN(MT.TreatmentName) > 20 
                           OR MT.TreatmentName LIKE '% %' 									---
                           -- No 10 (cast, day)
                           ---
                           SELECT
                              HSS.TransactionDate,
                              MC.CustomerName,
                              MT.TreatmentName,
                              CAST(MT.Price * 0.2 AS INT) AS Discount,
                              HSS.PaymentType 
                           FROM
                              MsCustomer AS MC 
                              JOIN
                                 HeaderSalonServices AS HSS 
                                 ON MC.CustomerId = HSS.CustomerId 
                              JOIN
                                 DetailSalonServices AS DSS 
                                 ON DSS.TransactionId = HSS.TransactionId 
                              JOIN
                                 MsTreatment AS MT 
                                 ON MT.TreatmentId = DSS.TreatmentId 
                           WHERE
                              DAY(HSS.TransactionDate) = '22'

