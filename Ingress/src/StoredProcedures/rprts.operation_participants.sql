/*<description>
    ХП возвращает отчёт об участниках операции по её id.
</description>*/

CREATE PROCEDURE [rprt].[operation_participants]
    @operation_id bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         o.name                 AS [Операция]
        ,a.nickname             AS [Ник агента]
        ,f.faction_ru           AS [Фракция]
        ,a.level                AS [Уровень агента]
        ,r.role_name            AS [Роль агента]
        ,pr.ping_result_name    AS [Результат пинговки]
        --,* 
    FROM oprs.participants  AS p
        JOIN oprs.operations    AS o    ON p.operation_id = o.id
        JOIN refs.agents        AS a    ON p.agent_id = a.id
        JOIN refs.factions      AS f    ON a.faction_id = f.id
        JOIN refs.roles         AS r    ON p.role_id = r.id
        JOIN refs.ping_results  AS pr   ON p.ping_result_id = pr.id
    WHERE p.operation_id = @operation_id
    ORDER BY a.nickname, r.role_name;
        
END;
GO