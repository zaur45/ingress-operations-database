CREATE TABLE [oprs].[teams]
(
     [id]               bigint          NOT NULL    CONSTRAINT [DF_teams_id] DEFAULT NEXT VALUE FOR [oprs].[teams_sequence]
    ,[callsign]         nvarchar(50)    NOT NULL
    ,[zone]             geography       NULL
    ,[operation_id]     bigint          NOT NULL

    ,CONSTRAINT [PK_teams]            PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_teams_operations] FOREIGN KEY ([operation_id])  REFERENCES [oprs].[operations]([id])
);
GO


CREATE NONCLUSTERED INDEX [IX_teams_operation_id] ON [oprs].[teams]
(
    [operation_id] ASC
);
GO
