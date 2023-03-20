
---	8.	Create procedure named ‘sp4’ that receive StaffName from user’s input to display StaffName and StaffPosition for every staff 
---		which name contains the word that has been inputted by user.
---		(create procedure, declare cursor, like)

USE OOVEO_Salon

CREATE PROCEDURE [sp4] @search VARCHAR(50)
    AS
        BEGIN
            DECLARE [cur2] CURSOR
                FOR
                    SELECT  StaffName, 
                            StaffPosition
                    FROM    MsStaff
                    WHERE   StaffName LIKE '%' + @search + '%'
            
            DECLARE 
                @name VARCHAR(50),
                @position VARCHAR(20)
            
            OPEN [cur2]
            
            FETCH NEXT FROM [cur2] INTO @name, @position

            IF @@FETCH_STATUS <> 0
                PRINT 'Cursor Fetch Failed!'

            WHILE @@FETCH_STATUS = 0
                BEGIN
                    PRINT 'StaffName : ' + @name + ' : ' + @position
                    FETCH NEXT FROM [cur2] INTO @name, @position
                END
            
            CLOSE [cur2]
            DEALLOCATE [cur2]
        END

EXEC [sp4] 'a'

DROP PROCEDURE sp4

GO