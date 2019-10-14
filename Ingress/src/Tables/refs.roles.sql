CREATE TABLE [refs].[roles]
(
     id          tinyint         NOT NULL
    ,role_name   nvarchar(255)   NOT NULL

    ,CONSTRAINT PK_roles PRIMARY KEY CLUSTERED ([id] ASC)
);
GO


EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Справочник ролей, которые могут выполнять агенты в опрц.', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'roles';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id роли', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'roles', @level2type=N'COLUMN', @level2name=N'id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'название роли', @level0type = N'SCHEMA', @level0name = N'refs', @level1type = N'TABLE', @level1name = N'roles', @level2type=N'COLUMN', @level2name=N'role_name';
GO
