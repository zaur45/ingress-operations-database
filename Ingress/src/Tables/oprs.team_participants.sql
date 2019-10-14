CREATE TABLE [oprs].[team_participants]
(
     [id]             bigint    NOT NULL    CONSTRAINT [DF_team_paricipants_id] DEFAULT NEXT VALUE FOR [oprs].[team_paricipants_sequence] 
    ,[team_id]        bigint    NOT NULL 
    ,[participant_id] bigint    NOT NULL 
    ,[is_team_lead]   bit       NOT NULL    CONSTRAINT [DF_team_paricipants_is_team_lead]   DEFAULT 0 
    ,[is_driver]      bit       NOT NULL    CONSTRAINT [DF_team_participants_is_driver]     DEFAULT 0

    ,CONSTRAINT [PK_team_paricipants]               PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_team_participants_participants] FOREIGN KEY ([participant_id])  REFERENCES [oprs].[participants]([id])
    ,CONSTRAINT [FK_team_participants_teams]        FOREIGN KEY ([team_id])         REFERENCES [oprs].[teams]([id])
    --,CONSTRAINT [CH_] CHECK ( проверка на принадлежность участника и команды одной опрц )
);
GO


CREATE NONCLUSTERED INDEX [IX_team_participants_team_id] ON [oprs].[team_participants] 
(
    [team_id] ASC
);
GO

CREATE NONCLUSTERED INDEX [IX_team_participants_participant_id] ON [oprs].[team_participants] 
(
    [participant_id] ASC
);
GO
