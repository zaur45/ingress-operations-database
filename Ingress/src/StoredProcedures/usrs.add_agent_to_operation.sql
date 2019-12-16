/*<description>
    ХП добавляет агента в уастники операции. 
    Если установлен флаг is_autocreation, то отсутствующий агент будет создан.
    Если установлен флаг is_autocreation, но не указаны данные для создания
    агента, то ХП завершится ничего не сделав.
</description>*/

CREATE PROCEDURE [usrs].[add_agent_to_operation]
     @agent_nickname    nvarchar(255)
    ,@operation_id      bigint
    ,@role_id           tinyint
    ,@ping_result_id    tinyint = 0
    ,@is_autocreate     bit     = 1
    ,@agent_faction_id  tinyint = NULL
    ,@agent_level       tinyint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @agent_id   bigint;

    IF @@TRANCOUNT > 0
    BEGIN
        PRINT N'ХП ожидает запуска вне транзакции!';
        RETURN 1;
    END;

    -- Проверка на существование ОПРЦ
    IF NOT EXISTS (SELECT 1 FROM oprs.operations WHERE id = @operation_id)
    BEGIN
        PRINT N'ОПРЦ с указанным ID = ' + CAST(@operation_id AS nvarchar(5)) + N'не существует!';
        RETURN 2;
    END;

    -- Проверка на указание необходимых данных для создания агента
    IF @is_autocreate = 1 AND (@agent_level IS NULL OR @agent_faction_id IS NULL)
    BEGIN
        PRINT N'Запрошено автоматическое создание агента, но не указаны нужные данные!';
        RETURN 3;
    END;

    IF @is_autocreate = 0 AND NOT EXISTS (SELECT 1 FROM refs.agents WHERE @agent_nickname = nickname)
    BEGIN
        PRINT N'Такого агента не существует!';
        RETURN 4;
    END;

    IF EXISTS (
        SELECT 1 FROM oprs.participants AS p
                 JOIN refs.agents       AS a ON p.agent_id = a.id
        WHERE
            a.nickname = @agent_nickname
            AND p.operation_id = @operation_id
            AND p.role_id = @role_id
        )
    BEGIN
        PRINT N'Этот агент уже добавлен в указанную ОПРЦ в указанном качестве!';
        RETURN 5;
    END;

    BEGIN TRAN

    IF @is_autocreate = 1 AND NOT EXISTS (SELECT 1 FROM refs.agents WHERE @agent_nickname = nickname)
        INSERT INTO refs.agents (nickname, faction_id, level) 
        SELECT @agent_nickname, @agent_faction_id, @agent_level;

    SELECT @agent_id = id FROM refs.agents WHERE @agent_nickname = nickname;

    INSERT INTO oprs.participants (operation_id, agent_id, role_id, ping_result_id)
    SELECT @operation_id, @agent_id, @role_id, @ping_result_id;


    COMMIT TRAN

END;
GO