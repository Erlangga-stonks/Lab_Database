
---3.	Create a store procedure named ‘sp3’ to update StaffId, StaffName, StaffGender, and StaffPhone on MsStaff table
---		based on StaffId, StaffName, StaffGender, and StaffPhone that was inputted by user. Then display the updated data
---		if the StaffId exists in MsStaff table. Otherwise show message ‘Staff does not exists’.
---		(create procedure, update, exists) 

USE OOVEO_Salon

CREATE PROCEDURE [sp3] @id CHAR(5), @name VARCHAR(50), @gender VARCHAR(10), @phone VARCHAR(13)
AS
    BEGIN
        IF EXISTS(
            SELECT  StaffId
            FROM    MsStaff 
            WHERE   StaffId = @id
            AND     StaffName = @name
            AND     StaffGender = @gender
            AND     StaffPhone = @phone
            )
            BEGIN
                -- Update data
                UPDATE  MsStaff
                SET     StaffId = @id,
                        StaffName = @name,
                        StaffGender = @gender,
                        StaffPhone = @phone
                WHERE   StaffId = @id
                -- Check if data is updated
                SELECT  *
                FROM    MsStaff
                WHERE   StaffId = @id
            END
        ELSE
            BEGIN
                -- Data not exists
                PRINT 'Staff does not exists'
            END
        -- Check all data
        SELECT  *
        FROM    MsStaff
    END;

EXEC sp3 'SF005', 'Ryan Nixon', 'M', '08567756123'

EXEC sp3 'SF008', 'Ryan Nixon', 'M', '08567756123'

GO

drop procedure sp3