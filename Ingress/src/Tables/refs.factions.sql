CREATE TABLE [refs].[factions]
(
     [id]          tinyint         NOT NULL
    ,[faction_en]  nvarchar(20)    NOT NULL
    ,[faction_ru]  nvarchar(20)    NOT NULL
    ,CONSTRAINT PK_Factions PRIMARY KEY CLUSTERED (id)
);
GO
