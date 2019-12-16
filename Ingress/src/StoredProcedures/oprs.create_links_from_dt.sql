CREATE PROCEDURE [oprs].[create_links_from_dt]
     @dt_id bigint
    ,@debug bit = 0
AS
BEGIN
    DECLARE @operation_id   bigint
           ,@dt             varchar(max);

    SELECT  @operation_id = dt.operation_id
           ,@dt = dt.dt
    FROM    oprs.draw_schemes AS dt 
    WHERE   dt.id = @dt_id;

    IF @dt IS NULL
    BEGIN
        PRINT N'Такого ДТ не существует!';
        RETURN 1;
    END;

    IF @operation_id IS NULL
    BEGIN
        PRINT 'Принадлежность ДТ к операции должна быть установлена до разбора!';
        RETURN 2;
    END;

    BEGIN TRAN;

    WITH cte_dt AS (
        SELECT
             cast(json_value(j.value, '$.latLngs[0].lat') AS decimal(18,15)) AS from_lat
            ,cast(json_value(j.value, '$.latLngs[0].lng') AS decimal(18,15)) AS from_lon
            ,cast(json_value(j.value, '$.latLngs[1].lat') AS decimal(18,15)) AS to_lat
            ,cast(json_value(j.value, '$.latLngs[1].lng') AS decimal(18,15)) AS to_lon
        FROM
            openjson(@dt, '$')                         AS j
        WHERE
            json_value(j.value, '$.type') = 'polyline'
    )
    INSERT INTO oprs.links (draw_scheme_id, portal_from_id, portal_to_id)
    SELECT 
        @dt_id, p_from.id, p_to.id
    FROM cte_dt
        LEFT JOIN refs.portals AS p_from ON cte_dt.from_lat = p_from.lat AND cte_dt.from_lon = p_from.lon
        LEFT JOIN refs.portals AS p_to   ON cte_dt.to_lat = p_to.lat AND cte_dt.to_lon = p_to.lon;

    IF @debug = 1
    BEGIN
        SELECT * FROM oprs.links WHERE links.draw_scheme_id = @dt_id;
        ROLLBACK TRAN;
    END
    ELSE
        COMMIT TRAN;
END;
GO