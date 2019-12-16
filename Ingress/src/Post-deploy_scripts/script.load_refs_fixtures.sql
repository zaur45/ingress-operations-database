-- Загрузка данных справочников
SET NOCOUNT ON;
GO

INSERT INTO [refs].[factions] (id, faction_en, faction_ru)
VALUES
    (1, 'Enlightened', 'Просвящение'),
    (2, 'Resistance', 'Сопротивление');
GO

INSERT INTO [refs].[ping_results] (id, ping_result_name)
VALUES
    (0, 'Не пинговали'),
    (1, 'Согласился'),
    (2, 'Отказался'),
    (3, 'Думает');
GO

INSERT INTO [refs].[roles] (id, role_name)
VALUES
    (0, 'Не определена'),
    (1, 'Резист'),
    (2, 'Олень'),
    (3, 'Орг'),
    (4, 'Фарм ключей'),
    (5, 'Небо'),
    (6, 'Линковщик'),
    (7, 'Кроссы');
GO

