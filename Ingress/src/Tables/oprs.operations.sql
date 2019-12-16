CREATE TABLE [oprs].[operations]
(
    [id]                     bigint           NOT NULL  CONSTRAINT [DF_operations_id] DEFAULT NEXT VALUE FOR [oprs].[participants_sequence]
   ,[name]                   nvarchar(255)    NOT NULL
   ,[start_date]             datetimeoffset       NULL
   ,[first_checkpoint_time]  datetimeoffset       NULL

   ,CONSTRAINT PK_Operations PRIMARY KEY CLUSTERED ([id] ASC)
);
GO

CREATE NONCLUSTERED INDEX IX_Operations_Start_date ON [oprs].[operations] 
(
    [start_date] ASC
);
GO
