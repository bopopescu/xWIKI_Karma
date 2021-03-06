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
/****** Object:  Table [dbo].[UserKarma_slice]    Script Date: 10/5/2017 10:13:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_slice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserKarma_slice](
	[ID] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[karma_score] [float] NOT NULL,
	[karma_diff] [float] NULL,
	[change_time] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_slice]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[UserKarma_slice]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUser_ID]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_slice]') AND name = N'iUser_ID')
CREATE NONCLUSTERED INDEX [iUser_ID] ON [dbo].[UserKarma_slice]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
