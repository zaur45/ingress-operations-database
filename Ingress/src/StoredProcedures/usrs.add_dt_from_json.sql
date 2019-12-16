CREATE PROCEDURE [usrs].[add_dt_from_json]
     @name          nvarchar(255)
    ,@dt            nvarchar(max)
    ,@is_template   bit             = 0
    ,@operation_id  bigint          = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF isjson(@dt) = 0
    BEGIN
        PRINT N'Переданный текст не является правильным json!';
        RETURN 1;
    END;

    BEGIN TRAN

    INSERT INTO oprs.draw_schemes (name, dt, operation_id, is_template, from_template)
    SELECT @name, @dt, @operation_id, @is_template, NULL

    COMMIT TRAN

END;
GO