/*<description>
    ХП возвращает отчёт порталах, требующих переименования.
</description>*/

CREATE PROCEDURE [rprt].[portals_for_renaming]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.id
       ,p.lat                           AS [Широта]
       ,p.lon                           AS [Долгота]
       ,dbo.get_portal_intel_ref(p.id)  AS [Ссылка в Intel]
    FROM refs.portals AS p 
    WHERE p.name IS NULL
END;
GO