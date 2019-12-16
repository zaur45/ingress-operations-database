CREATE TABLE [refs].[portals]
(
     [id]       bigint          NOT NULL  CONSTRAINT [DF_portals_id] DEFAULT NEXT VALUE FOR [oprs].[portals_sequence]
    ,[name]     nvarchar(255)   NULL
    ,[lat]      decimal(18,15)  NULL
    ,[lon]      decimal(18,15)  NULL
    ,[coords]   AS geography::Point(lat, lon, 4326)

    ,CONSTRAINT [PK_portals] PRIMARY KEY CLUSTERED ([id] ASC)
);
GO
