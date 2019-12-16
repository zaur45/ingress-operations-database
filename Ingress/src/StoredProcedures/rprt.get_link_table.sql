CREATE PROCEDURE [rprt].[get_link_table]
    @operation_id bigint
AS
BEGIN
    SELECT 
        pf.name AS [Откуда]
        ,dbo.get_portal_intel_ref(pf.id) [Intel from]
        ,pt.name AS [Куда]
        ,dbo.get_portal_intel_ref(pt.id) [Intel to]
    FROM oprs.links AS l
        JOIN oprs.draw_schemes  AS d on l.draw_scheme_id = d.id
        JOIN refs.portals       AS pf on l.portal_from_id = pf.id
        JOIN refs.portals       AS pt on l.portal_to_id = pt.id
    WHERE d.operation_id = @operation_id
END;
GO
