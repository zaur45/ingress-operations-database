CREATE TABLE [oprs].[fields]
(
     [id]          bigint  NOT NULL CONSTRAINT [DF_fields_id] DEFAULT NEXT VALUE FOR [oprs].[fields_sequence]
    ,[link_1_id]   bigint  NOT NULL
    ,[link_2_id]   bigint  NOT NULL
    ,[link_3_id]   bigint  NOT NULL

    ,CONSTRAINT [PK_fields]         PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_fields_links_1] FOREIGN KEY ([link_1_id])  REFERENCES [oprs].[links]([id])
    ,CONSTRAINT [FK_fields_links_2] FOREIGN KEY ([link_2_id])  REFERENCES [oprs].[links]([id])
    ,CONSTRAINT [FK_fields_links_3] FOREIGN KEY ([link_3_id])  REFERENCES [oprs].[links]([id])
);
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Таблица, содержащая поля. Поле определяется тремя (и только тремя) замкнутыми линками.', @level0type = N'SCHEMA', @level0name = N'oprs', @level1type = N'TABLE', @level1name = N'fields';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id поля', @level0type = N'SCHEMA', @level0name = N'oprs', @level1type = N'TABLE', @level1name = N'fields', @level2type=N'COLUMN', @level2name=N'id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id первого линка', @level0type = N'SCHEMA', @level0name = N'oprs', @level1type = N'TABLE', @level1name = N'fields', @level2type=N'COLUMN', @level2name=N'link_1_id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id второго линка', @level0type = N'SCHEMA', @level0name = N'oprs', @level1type = N'TABLE', @level1name = N'fields', @level2type=N'COLUMN', @level2name=N'link_2_id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id третьего линка', @level0type = N'SCHEMA', @level0name = N'oprs', @level1type = N'TABLE', @level1name = N'fields', @level2type=N'COLUMN', @level2name=N'link_3_id';
GO
