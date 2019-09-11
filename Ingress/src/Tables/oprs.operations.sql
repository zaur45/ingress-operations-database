CREATE TABLE [oprs].[operations]
(
    [id]                     int            DEFAULT NEXT VALUE FOR [oprs].[participants_sequence]   NOT NULL
    ,[name]                  nvarchar(255)                                                          NOT NULL
    ,[start_date]            datetime                                                               NULL
    ,[first_checkpoint_time] datetime                                                               NULL
    ,CONSTRAINT PK_Operations PRIMARY KEY CLUSTERED (id)
);
GO