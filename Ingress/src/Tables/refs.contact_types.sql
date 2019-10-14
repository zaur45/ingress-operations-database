CREATE TABLE [refs].[contact_types]
(
    [id]            bigint          NOT NULL
    ,[contact_type] nvarchar(50)    NOT NULL

    ,CONSTRAINT [PK_contact_types] PRIMARY KEY CLUSTERED ([id] ASC)
);
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Справочник типов контактов агента.', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'contact_types';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id типа контакта', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'contact_types', @level2type=N'COLUMN', @level2name=N'id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'название типа контакта', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'contact_types', @level2type=N'COLUMN', @level2name=N'contact_type';
GO
