CREATE TABLE [refs].[roles] (
    id           tinyint         NOT NULL
    ,role_name   nvarchar(255)   NOT NULL
    ,CONSTRAINT PK_roles PRIMARY KEY CLUSTERED (id)
);
GO