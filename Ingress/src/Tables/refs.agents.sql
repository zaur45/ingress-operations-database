CREATE TABLE [refs].[agents]
(
     [id]           int             DEFAULT NEXT VALUE FOR [refs].[agents_sequence] NOT NULL
    ,[nickname]     nvarchar(255)                                                   NOT NULL
    ,[faction_id]   tinyint                                                         NOT NULL
    ,[level]        tinyint                                                         NOT NULL
    ,CONSTRAINT PK_Agents PRIMARY KEY CLUSTERED (id)
    ,CONSTRAINT FK_Agents_Faction FOREIGN KEY (faction_id) REFERENCES refs.factions (id)
    ,CONSTRAINT CK_Agents_Level CHECK ([level] BETWEEN 1 AND 16)
);
GO
