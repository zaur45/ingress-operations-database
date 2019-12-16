/*<description>
    ХП переменовывает портал.
</description>*/

CREATE PROCEDURE [refs].[rename_portal]
    @id bigint
   ,@name nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM refs.portals WHERE id = @id)
    BEGIN
        PRINT N'Портала с таким id не существует!';
        RETURN 1;
    END;

    BEGIN TRAN;

    WITH cte AS (SELECT name FROM refs.portals WHERE id = @id)
    UPDATE cte SET cte.name = @name;

    COMMIT TRAN
END;
GO
