CREATE TABLE [oprs].[participants]
(
    [id]              bigint    NOT NULL    CONSTRAINT [DF_participants_id] DEFAULT NEXT VALUE FOR [oprs].[participants_sequence]
    ,[operation_id]   bigint    NOT NULL
    ,[agent_id]       bigint    NOT NULL
    ,[role_id]        tinyint   NOT NULL    CONSTRAINT [DF_role_id] DEFAULT 0
    ,[ping_result_id] tinyint   NOT NULL    CONSTRAINT [DF_ping_result_id] DEFAULT 0

    ,CONSTRAINT [PK_partisipants]               PRIMARY KEY CLUSTERED (id)
    ,CONSTRAINT [FK_participants_operations]    FOREIGN KEY ([operation_id])    REFERENCES [oprs].[operations]([id])
    ,CONSTRAINT [FK_participants_agents]        FOREIGN KEY ([agent_id])        REFERENCES [refs].[agents]([id])
    ,CONSTRAINT [FK_partisipants_role]          FOREIGN KEY (role_id)           REFERENCES [refs].[roles] ([id])
    ,CONSTRAINT [FK_partisipants_ping_result]   FOREIGN KEY (ping_result_id)    REFERENCES [refs].[ping_results] ([id])
);
GO

CREATE NONCLUSTERED INDEX IX_Participants_Operation_id ON [oprs].[participants]
(
    [operation_id] ASC
);
GO

CREATE INDEX IX_Participants_Agent_id ON [oprs].[participants]
(
    [agent_id] ASC
);
GO
