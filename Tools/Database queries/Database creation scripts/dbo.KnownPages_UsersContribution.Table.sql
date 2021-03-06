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
/****** Object:  Table [dbo].[KnownPages_UsersContribution]    Script Date: 10/5/2017 10:13:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_UsersContribution]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownPages_UsersContribution](
	[UserID] [uniqueidentifier] NULL,
	[KnownPageID] [uniqueidentifier] NULL,
	[contribution] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [I_KnownPageIDxUserID]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_UsersContribution]') AND name = N'I_KnownPageIDxUserID')
CREATE UNIQUE NONCLUSTERED INDEX [I_KnownPageIDxUserID] ON [dbo].[KnownPages_UsersContribution]
(
	[KnownPageID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKnownPageID]    Script Date: 10/5/2017 10:13:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_UsersContribution]') AND name = N'iKnownPageID')
CREATE NONCLUSTERED INDEX [iKnownPageID] ON [dbo].[KnownPages_UsersContribution]
(
	[KnownPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
