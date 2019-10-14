CREATE TABLE [oprs].[links]
(
     [id]               bigint  NOT NULL    CONSTRAINT [DF_links_id] DEFAULT NEXT VALUE FOR [oprs].[links_sequence]
    ,[draw_scheme_id]   bigint  NOT NULL
    ,[portal_from_id]   bigint  NOT NULL
    ,[portal_to_id]     bigint  NOT NULL

    ,CONSTRAINT [PK_links]              PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_links_draw_schemes] FOREIGN KEY ([draw_scheme_id])  REFERENCES [oprs].[draw_schemes]([id])
    ,CONSTRAINT [FK_links_portal_from]  FOREIGN KEY ([portal_from_id])  REFERENCES [refs].[portals]([id])
    ,CONSTRAINT [FK_links_portals_to]   FOREIGN KEY ([portal_to_id])    REFERENCES [refs].[portals]([id])
);
GO


CREATE NONCLUSTERED INDEX [IX_links_portal_from_id] ON [oprs].[links]
(
    [portal_from_id] ASC
);
GO

CREATE NONCLUSTERED INDEX [IX_links_portal_to_id] ON [oprs].[links]
(
    [portal_to_id] ASC
);
GO

CREATE NONCLUSTERED INDEX [IX_links_draw_scheme_id] ON [oprs].[links]
(
    [draw_scheme_id] ASC
);
GO
