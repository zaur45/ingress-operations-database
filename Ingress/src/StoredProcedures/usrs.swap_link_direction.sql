/*<description>
    ХП меняет направлене линка на противоположное.
</description>*/

CREATE PROCEDURE [usrs].[swap_link_direction]
     @link_id   bigint
    ,@debug     bit
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (select 1 FROM oprs.links WHERE id = @link_id)
    BEGIN
        PRINT N'Линка с таким id не существует!';
        RETURN 1
    END;

    BEGIN TRAN;

    UPDATE oprs.links SET
        [portal_from_id] = [portal_to_id]
       ,[portal_to_id] = [portal_from_id]
    WHERE id = @link_id

    COMMIT TRAN;
END;
