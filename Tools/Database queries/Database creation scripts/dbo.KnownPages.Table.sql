/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [Karma]
GO
/****** Object:  Table [dbo].[KnownPages]    Script Date: 10/5/2017 10:13:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownPages](
	[ID] [uniqueidentifier] NULL,
	[page_title] [nvarchar](max) NULL,
	[page_id] [varchar](max) NULL,
	[author] [nvarchar](max) NULL,
	[author_ID] [nvarchar](255) NULL,
	[added] [datetime] NULL,
	[last_modified] [datetime] NULL,
	[version] [int] NULL,
	[last_check] [datetime] NULL,
	[is_uptodate] [bit] NULL,
	[characters_total] [nvarchar](max) NULL,
	[platform] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [iAdded]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages]') AND name = N'iAdded')
CREATE NONCLUSTERED INDEX [iAdded] ON [dbo].[KnownPages]
(
	[added] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[KnownPages]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
