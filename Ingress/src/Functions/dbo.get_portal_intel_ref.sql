CREATE FUNCTION dbo.get_portal_intel_ref (@portal_id int)
RETURNS nvarchar(500)
AS
BEGIN
    DECLARE @result nvarchar(500);

    SELECT @result = 'https://intel.ingress.com/intel?ll=' +cast(p.lat as varchar)+ ',' +cast(p.lon as varchar)+ '&z=15&pll=' +cast(p.lat as varchar)+ ',' +cast(p.lon as varchar)
    FROM refs.portals as p
    WHERE p.id = @portal_id;

    return (@result);
END;
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Функция возвращает ссылку на портал для Intel',
                                @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'FUNCTION',  @level1name = 'get_portal_intel_ref';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id портала',
                                @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'FUNCTION',  @level1name = 'get_portal_intel_ref',
                                @level2type = N'PARAMETER',  @level2name = '@portal_id';
GO
