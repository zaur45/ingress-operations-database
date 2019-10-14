CREATE TABLE [oprs].[draw_schemes]
(
     [id]               bigint          NOT NULL    CONSTRAINT [DF_draw_scheme_id] DEFAULT NEXT VALUE FOR [oprs].[draw_schemes_sequence]
    ,[name]             nvarchar(255)   NOT NULL 
    ,[dt]               nvarchar(max)   NOT NULL 
    ,[operation_id]     bigint          NULL 
    ,[is_template]      bit             NOT NULL    CONSTRAINT [DF_draw_schemes_is_template] DEFAULT 0 
    ,[from_template]    bigint          NULL 

    ,CONSTRAINT [PK_dt]                                     PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_draw_schemes_draw_schemes_as_template]  FOREIGN KEY ([from_template])   REFERENCES [oprs].[draw_schemes]([id])
    ,CONSTRAINT [FK_operations_draw_schemes]                FOREIGN KEY ([operation_id])    REFERENCES [oprs].[operations]([id])
);
GO


CREATE NONCLUSTERED INDEX [IX_draw_schemes_operation_id] ON [oprs].[draw_schemes] 
 (
  [operation_id] ASC
 );
GO
