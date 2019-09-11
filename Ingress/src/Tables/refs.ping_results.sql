CREATE TABLE [refs].[ping_results] (
    [id]                tinyint         NOT NULL
    ,[ping_result_name] nvarchar(255)   NOT NULL
    ,CONSTRAINT PK_ping_results PRIMARY KEY CLUSTERED (id)
);
GO