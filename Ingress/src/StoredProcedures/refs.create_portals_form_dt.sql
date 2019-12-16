CREATE PROCEDURE [refs].[create_portals_from_dt]
    @dt_id  bigint,
    @debug  bit     = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @dt nvarchar(max);
    SELECT  @dt = dt FROM oprs.draw_schemes WHERE id = @dt_id

    IF @dt IS NULL 
    BEGIN
        PRINT N'Отсутствует содержимое ДТ'
        RETURN 1
    END

    IF (SELECT ISJSON(@dt)) = 0
    BEGIN
        PRINT N'ДТ не соответствует формату JSON'
        RETURN 2
    END

    CREATE TABLE #portals (
        lat     decimal(18,15)
        ,lon    decimal(18,15)
    );

    INSERT INTO #portals (lat,lon)
    SELECT
        cast(json_value(k.value, '$.lat') AS decimal(18,15)) as lat
       ,cast(json_value(k.value, '$.lng') AS decimal(18,15)) as lon
    FROM
        openjson(@dt, '$')                         as j
        CROSS APPLY openjson(j.value, '$.latLngs') as k
    WHERE
        json_value(j.value, '$.type') = 'polyline'

    UNION

    SELECT
        cast(json_value(j.value, '$.latLng.lat') AS decimal(18,15)) as lat
       ,cast(json_value(j.value, '$.latLng.lng') AS decimal(18,15)) as lon
    FROM
        openjson(@dt, '$') as j
    WHERE
        json_value(j.value, '$.type') = 'marker';

    IF @debug = 1
        SELECT tp.lat, tp.lon
        FROM #portals AS tp
            LEFT JOIN refs.portals as p ON tp.lat = p.lat AND tp.lon = p.lon
        WHERE
            p.lat IS NULL;

    BEGIN TRAN

    INSERT INTO refs.portals (lat, lon)
    SELECT tp.lat, tp.lon
    FROM #portals AS tp
        LEFT JOIN refs.portals as p ON tp.lat = p.lat AND tp.lon = p.lon
    WHERE
        p.lat IS NULL

    IF @debug = 1
        ROLLBACK TRAN;
    ELSE
        COMMIT TRAN;
END
