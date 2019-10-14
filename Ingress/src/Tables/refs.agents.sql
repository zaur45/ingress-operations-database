CREATE TABLE [refs].[agents]
(
     [id]           bigint          NOT NULL    CONSTRAINT [DF_agents_id] DEFAULT NEXT VALUE FOR [refs].[agents_sequence]
    ,[nickname]     nvarchar(255)   NOT NULL
    ,[faction_id]   tinyint         NOT NULL
    ,[level]        tinyint         NOT NULL

    ,CONSTRAINT PK_Agents         PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT FK_Agents_Faction FOREIGN KEY ([faction_id]) REFERENCES [refs].[factions] ([id])
    ,CONSTRAINT CK_Agents_Level   CHECK ([level] BETWEEN 1 AND 16)
);
GO


EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Справочник агентов', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id агента', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents', @level2type=N'COLUMN', @level2name=N'id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'позывной агента в игре', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents', @level2type=N'COLUMN', @level2name=N'nickname';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'фракция агента', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents', @level2type=N'COLUMN', @level2name=N'faction_id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'уровень агента', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents', @level2type=N'COLUMN', @level2name=N'level';
GO
