CREATE TABLE [refs].[agents_contacts]
(
    [id]                bigint          NOT NULL    CONSTRAINT [DF_agents_contacts_id] DEFAULT NEXT VALUE FOR [refs].[agents_contacts_sequence]
    ,[agent_id]         bigint          NOT NULL
    ,[contact_type_id]  bigint          NOT NULL
    ,[value]            nvarchar(255)   NOT NULL

    ,CONSTRAINT [PK_agents_contacts]                PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_agent_contacts_contact_types]   FOREIGN KEY ([contact_type_id])  REFERENCES [refs].[contact_types]([id])
    ,CONSTRAINT [FK_agents_agents_contacts]         FOREIGN KEY ([agent_id])         REFERENCES [refs].[agents]([id])
);
GO


CREATE NONCLUSTERED INDEX [IX_Agent_contacts_agent_id] ON [refs].[agents_contacts]
(
    [agent_id] ASC
);
GO

CREATE NONCLUSTERED INDEX [IX_Agent_contacts_contact_type_id] ON [refs].[agents_contacts]
(
    [contact_type_id] ASC
);
GO


EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Контакты агентов', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents_contacts';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id агента', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents_contacts', @level2type=N'COLUMN', @level2name=N'agent_id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id типа контакта (telegram, телефон и т.п.)', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents_contacts', @level2type=N'CONSTRAINT', @level2name=N'FK_agent_contacts_contact_types';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'контактные данные', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'agents_contacts', @level2type=N'COLUMN', @level2name=N'value';
GO
