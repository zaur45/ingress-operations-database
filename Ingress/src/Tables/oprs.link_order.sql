CREATE TABLE [oprs].[link_order]
(
     [id]           bigint
    ,[link_id]      bigint
    ,[team_id]      bigint
    ,[link_order]   int
    ,[is_done]      tinyint

    ,CONSTRAINT [PK_link_order]       PRIMARY KEY CLUSTERED ([id] ASC)
    ,CONSTRAINT [FK_link_order_links] FOREIGN KEY ([link_id])  REFERENCES [oprs].[links]([id])
    ,CONSTRAINT [FK_link_order_teams] FOREIGN KEY ([team_id])  REFERENCES [oprs].[teams]([id])
);
GO

CREATE NONCLUSTERED INDEX [IX_link_order_link_id] ON [oprs].[link_order]
(
    link_id ASC
);
GO

CREATE NONCLUSTERED INDEX [IX_link_order_team_id] ON [oprs].[link_order]
(
    team_id ASC
);
GO
