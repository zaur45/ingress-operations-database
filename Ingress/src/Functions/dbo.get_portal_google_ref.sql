CREATE FUNCTION dbo.get_portal_google_ref (@portal_id int)
RETURNS nvarchar(500)
AS
BEGIN
    DECLARE @result nvarchar(500);

    SELECT @result = 'https://www.google.com/maps/@' +cast(p.lat as nvarchar)+ ',' +cast(p.lon as nvarchar)+ ',14z'
    FROM refs.portals as p
    WHERE p.id = @portal_id;

    return (@result);
END;
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Функция возвращает ссылку на портал для Google Maps',
                                @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'FUNCTION',  @level1name = 'get_portal_google_ref';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id портала',
                                @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'FUNCTION',  @level1name = 'get_portal_google_ref',
                                @level2type = N'PARAMETER',  @level2name = '@portal_id';
GO
