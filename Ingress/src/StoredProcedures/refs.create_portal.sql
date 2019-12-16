CREATE PROCEDURE [refs].[create_portal]
    @name   nvarchar(255) = NULL
   ,@lat    decimal(18,15)
   ,@lon    decimal(18,15)
AS
BEGIN
    IF EXISTS (
            SELECT 1 FROM refs.portals AS p
            WHERE p.lat = @lat AND p.lon = @lon
        )
    BEGIN
        PRINT N'Портал с такими координатами уже существует'
        RETURN 1
    END

    INSERT INTO refs.portals (name, lat, lon)
    SELECT @name, @lat, @lon;

    RETURN 0
END
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Процедура создаёт портал по известным координатам, если его не было ранее',
                                @level0type = N'SCHEMA', @level0name = 'refs', @level1type = N'PROCEDURE',  @level1name = 'create_portal';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'название портала. Необязательный параметр',
                                @level0type = N'SCHEMA', @level0name = 'refs', @level1type = N'PROCEDURE',  @level1name = 'create_portal',
                                @level2type = N'PARAMETER',  @level2name = '@name';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'широта, географическая координата портала. Обязательный параметр',
                                @level0type = N'SCHEMA', @level0name = 'refs', @level1type = N'PROCEDURE',  @level1name = 'create_portal',
                                @level2type = N'PARAMETER',  @level2name = '@lat';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'долгота, географическая координата портала. Обязательный параметр',
                                @level0type = N'SCHEMA', @level0name = 'refs', @level1type = N'PROCEDURE',  @level1name = 'create_portal',
                                @level2type = N'PARAMETER',  @level2name = '@lon';
GO

