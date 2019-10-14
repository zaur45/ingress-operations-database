CREATE TABLE [refs].[ping_results]
(
    [id]                tinyint         NOT NULL
    ,[ping_result_name] nvarchar(255)   NOT NULL

    ,CONSTRAINT PK_ping_results PRIMARY KEY CLUSTERED ([id] ASC)
);
GO


EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Справочник результатов пинговки агентов', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'ping_results';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id результата пинговки', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'ping_results', @level2type=N'COLUMN', @level2name=N'id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'результат пинговки', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'ping_results', @level2type=N'COLUMN', @level2name=N'ping_result_name';
GO
