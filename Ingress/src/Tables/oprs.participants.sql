CREATE TABLE [oprs].[participants](
    [id]              int     DEFAULT NEXT VALUE FOR [oprs].[participants_sequence] NOT NULL
    ,[operation_id]   int                                                           NOT NULL
    ,[agent_id]       int                                                           NOT NULL
    ,[role_id]        tinyint DEFAULT 0                                             NOT NULL
    ,[ping_result_id] tinyint DEFAULT 0                                             NOT NULL
    ,CONSTRAINT PK_partisipants PRIMARY KEY CLUSTERED (id)
    ,CONSTRAINT FK_partisipants_role FOREIGN KEY (role_id) REFERENCES refs.roles (id)
    ,CONSTRAINT FK_partisipants_ping_result FOREIGN KEY (ping_result_id) REFERENCES refs.ping_results (id)
);
GO