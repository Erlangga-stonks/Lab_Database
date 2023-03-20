
---7.	Create cursor with name ‘cur1’ to validate whether the length of StaffName is odd or even then show the message about result.
---		(declare cursor, len)

USE OOVEO_Salon

DECLARE @name VARCHAR(50)

DECLARE [cur1] CURSOR
    FOR 
        SELECT  StaffName 
        FROM    MsStaff

OPEN [cur1]
FETCH NEXT FROM [cur1] INTO @name

IF @@FETCH_STATUS <> 0
    PRINT 'Cursor Fetch Failed!'

WHILE @@FETCH_STATUS = 0
    BEGIN
        IF LEN(@name) % 2 = 0
            BEGIN
                PRINT 'The length from StaffName ' + @name + ' is an odd number'
            END
        ELSE
            BEGIN
                PRINT 'The length from StaffName ' + @name + ' is an even number'
            END
        FETCH NEXT FROM [cur1] INTO @name
    END

CLOSE [cur1]
DEALLOCATE [cur1]

GO