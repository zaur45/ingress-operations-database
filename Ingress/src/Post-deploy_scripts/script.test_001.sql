-- Заполнение таблицы агентов тестовыми данными. Все ники сгенерены случайным образом
-- на https://jimpix.co.uk/words/username-generator.asp
INSERT INTO refs.agents (faction_id, level, nickname) VALUES
  (1,10,'lavendersquawk'
),(1,10,'diopsidetangle'
),(1,10,'kryptondurban'
),(1,10,'ashamedalmond'
),(1,10,'stiflingjersey'
),(1,12,'fightwump'
),(1,12,'moonhaley'
),(1,12,'covertdiffusion'
),(1,12,'fuquarters'
),(1,12,'thinnermumps'
),(1,12,'criedprocess'
),(1,13,'captivateswear'
),(1,13,'crowhopdoughy'
),(1,13,'segmentturnt'
),(1,13,'cloudexcellence'
),(1,13,'doaksevade'
),(1,13,'wholesapey'
),(1,13,'underfootpisces'
),(1,13,'writingdudley'
),(1,14,'oneroustatshenshini'
),(1,14,'dalcopdot'
),(1,14,'drinkingbreeching'
),(1,16,'larvatoll'
),(1,16,'arabellathongs'
),(1,16,'peamyunsung'
);

declare @operation_id int;

INSERT INTO oprs.operations ([name], [start_date], [first_checkpoint_time])
OUTPUT inserted.id
VALUES (N'В тени тестового сервера', '2019-12-16 00:00:00 +03:00', '2019-12-16 23:00:00 +03:00');

SELECT @operation_id = max(id) FROM oprs.operations;

exec usrs.[add_agent_to_operation] N'a_new_agent', 1, 7, 0, 1, 1, 11;
exec usrs.[add_agent_to_operation] N'diopsidetangle', 1, 7, 0, 1, 1, 15;
exec usrs.[add_agent_to_operation] N'peamyunsung', 1, 3, 1, 0;
exec usrs.[add_agent_to_operation] N'peamyunsung', 1, 4, 1, 0;
exec usrs.[add_agent_to_operation] N'peamyunsung', 1, 5, 1, 0;
exec usrs.[add_agent_to_operation] N'peamyunsung', 1, 6, 2, 0;

exec [rprt].[operation_participants] 1;

