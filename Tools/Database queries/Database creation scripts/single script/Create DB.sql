/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Karma]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Karma')
BEGIN
CREATE DATABASE [Karma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Karma', FILENAME = N'F:\bases\Karma.mdf' , SIZE = 158912KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Karma_log', FILENAME = N'F:\bases\Karma_log.ldf' , SIZE = 36288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Karma] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Karma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Karma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Karma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Karma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Karma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Karma] SET ARITHABORT OFF 
GO
ALTER DATABASE [Karma] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Karma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Karma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Karma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Karma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Karma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Karma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Karma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Karma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Karma] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Karma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Karma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Karma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Karma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Karma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Karma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Karma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Karma] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Karma] SET  MULTI_USER 
GO
ALTER DATABASE [Karma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Karma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Karma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Karma] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Karma] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Karma] SET QUERY_STORE = OFF
GO
USE [Karma]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Karma]
GO
/****** Object:  Table [dbo].[KnownBugs]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownBugs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownBugs](
	[ID] [uniqueidentifier] NOT NULL,
	[KnownPages_id] [uniqueidentifier] NOT NULL,
	[bug_id] [nvarchar](max) NOT NULL,
	[product] [nvarchar](max) NOT NULL,
	[tbfi] [nvarchar](max) NOT NULL,
	[components] [xml] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KnownPages]    Script Date: 10/5/2017 10:12:06 PM ******/
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
/****** Object:  Table [dbo].[KnownPages_contribution]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_contribution]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownPages_contribution](
	[KnownPageID] [uniqueidentifier] NULL,
	[datagram_contribution] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KnownPages_datagrams]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_datagrams]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownPages_datagrams](
	[ID] [uniqueidentifier] NULL,
	[KnownPageID] [uniqueidentifier] NULL,
	[datagram] [varbinary](max) NULL,
	[contributors_datagram] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KnownPages_Users]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KnownPages_Users](
	[ID] [uniqueidentifier] NULL,
	[user_name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KnownPages_UsersContribution]    Script Date: 10/5/2017 10:12:06 PM ******/
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
/****** Object:  Table [dbo].[Page_Karma_votes]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Page_Karma_votes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Page_Karma_votes](
	[ID] [uniqueidentifier] NOT NULL,
	[page_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[direction] [bit] NOT NULL,
	[added] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[page_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserKarma_current]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_current]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserKarma_current](
	[ID] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[karma_score] [varbinary](max) NULL,
	[change_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserKarma_slice]    Script Date: 10/5/2017 10:12:06 PM ******/
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
/****** Object:  Index [iKnownPages_id]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownBugs]') AND name = N'iKnownPages_id')
CREATE UNIQUE NONCLUSTERED INDEX [iKnownPages_id] ON [dbo].[KnownBugs]
(
	[KnownPages_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAdded]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages]') AND name = N'iAdded')
CREATE NONCLUSTERED INDEX [iAdded] ON [dbo].[KnownPages]
(
	[added] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[KnownPages]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKnownPageID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_contribution]') AND name = N'iKnownPageID')
CREATE UNIQUE NONCLUSTERED INDEX [iKnownPageID] ON [dbo].[KnownPages_contribution]
(
	[KnownPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_datagrams]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[KnownPages_datagrams]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKnownPagesID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_datagrams]') AND name = N'iKnownPagesID')
CREATE UNIQUE NONCLUSTERED INDEX [iKnownPagesID] ON [dbo].[KnownPages_datagrams]
(
	[KnownPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_Users]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[KnownPages_Users]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [I_KnownPageIDxUserID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_UsersContribution]') AND name = N'I_KnownPageIDxUserID')
CREATE UNIQUE NONCLUSTERED INDEX [I_KnownPageIDxUserID] ON [dbo].[KnownPages_UsersContribution]
(
	[KnownPageID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKnownPageID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownPages_UsersContribution]') AND name = N'iKnownPageID')
CREATE NONCLUSTERED INDEX [iKnownPageID] ON [dbo].[KnownPages_UsersContribution]
(
	[KnownPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Page_Karma_votes]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[Page_Karma_votes]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ipage_id]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Page_Karma_votes]') AND name = N'Ipage_id')
CREATE NONCLUSTERED INDEX [Ipage_id] ON [dbo].[Page_Karma_votes]
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_current]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[UserKarma_current]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUser_ID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_current]') AND name = N'iUser_ID')
CREATE UNIQUE NONCLUSTERED INDEX [iUser_ID] ON [dbo].[UserKarma_current]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_slice]') AND name = N'iID')
CREATE UNIQUE NONCLUSTERED INDEX [iID] ON [dbo].[UserKarma_slice]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUser_ID]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserKarma_slice]') AND name = N'iUser_ID')
CREATE NONCLUSTERED INDEX [iUser_ID] ON [dbo].[UserKarma_slice]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [icomponents]    Script Date: 10/5/2017 10:12:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KnownBugs]') AND name = N'icomponents')
CREATE PRIMARY XML INDEX [icomponents] ON [dbo].[KnownBugs]
(
	[components]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__KnownBugs__Known__123EB7A3]') AND parent_object_id = OBJECT_ID(N'[dbo].[KnownBugs]'))
ALTER TABLE [dbo].[KnownBugs]  WITH CHECK ADD FOREIGN KEY([KnownPages_id])
REFERENCES [dbo].[KnownPages] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[delete_page]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_page]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[delete_page] AS' 
END
GO
ALTER PROCEDURE [dbo].[delete_page]
    @page_id uniqueidentifier
AS   
SET NOCOUNT ON

delete [dbo].[KnownPages_contribution] where KnownPageID = @page_id
delete [dbo].[KnownPages_datagrams] where KnownPageID = @page_id
delete [dbo].[KnownPages_UsersContribution] where KnownPageID = @page_id
delete [dbo].[Page_Karma_votes] where page_id = @page_id
delete [dbo].[KnownBugs] where KnownPages_id = @page_id
delete [dbo].[KnownPages] where id = @page_id

GO
/****** Object:  StoredProcedure [dbo].[delete_page_by_page_id]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_page_by_page_id]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[delete_page_by_page_id] AS' 
END
GO
ALTER PROCEDURE [dbo].[delete_page_by_page_id]
    @page_id varchar(MAX)
AS   
SET NOCOUNT ON
declare @id as uniqueidentifier
select @id=[id] from [dbo].[KnownPages] where [page_id] = @page_id
delete [dbo].[KnownPages_contribution] where KnownPageID = @id
delete [dbo].[KnownPages_datagrams] where KnownPageID = @id
delete [dbo].[KnownPages_UsersContribution] where KnownPageID = @id
delete [dbo].[Page_Karma_votes] where page_id = @id
delete [dbo].[KnownBugs] where KnownPages_id = @id
delete [dbo].[KnownPages] where id = @id

GO
/****** Object:  StoredProcedure [dbo].[get_page_karma_and_votes]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_page_karma_and_votes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_page_karma_and_votes] AS' 
END
GO


ALTER PROCEDURE [dbo].[get_page_karma_and_votes]
    @page_id uniqueidentifier
AS   
SET NOCOUNT ON
	declare @up as float
	declare @down as float
	declare @karma_total_score as float
	set @karma_total_score = 0

select @up = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 1
select @down = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 0
set @karma_total_score = @karma_total_score + (@up-@down)
if (@karma_total_score = 0 and @up != @down) 
	begin
	set @karma_total_score = 1
	end;
select @up as up, @down as down, @karma_total_score as karma_total_score
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_current_score]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_current_score]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_current_score] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_current_score] 
    @user_id uniqueidentifier
AS   
    SET NOCOUNT ON;  
	declare @page_id as uniqueidentifier
	declare @persent as float
	declare @up as float
	declare @down as float
	DECLARE @CURSOR CURSOR
	declare @karma_total_score as float
	set @karma_total_score = 0
SET @CURSOR = CURSOR SCROLL
FOR
	select [dbo].[KnownPages].id as id, ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as 'percent'
	from [dbo].[KnownPages_UsersContribution] 
	left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
	left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
	where UserID = @user_id and [characters_total] >0
OPEN @CURSOR
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
WHILE @@FETCH_STATUS = 0
BEGIN
IF ((select count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id)= 0)
BEGIN
-- bonus for a page without votes (1 karma point)
set @karma_total_score = @karma_total_score + @persent
--select @page_id, 'no votes found, adding..',@persent, @karma_total_score as 'current karma'
END
ELSE
BEGIN
/*
select [dbo].[KnownPages].page_title as 'page_title', [dbo].[Page_Karma_votes].[direction] as 'direction', @persent as 'multipl',[dbo].[KnownPages_Users].user_name
from [dbo].[KnownPages] 
left join [dbo].[Page_Karma_votes] on [dbo].[KnownPages].id = [dbo].[Page_Karma_votes].page_id
left join [dbo].[KnownPages_Users] on [dbo].[Page_Karma_votes].user_id = [dbo].[KnownPages_Users].id
where [dbo].[KnownPages].id = @page_id
*/
select @up = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 1
select @down = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 0
set @karma_total_score = @karma_total_score + ((@up-@down)* @persent)
--select @up as 'up', @down as 'down',((@up-@down)* @persent) as 'summary', @karma_total_score as 'current karma'
END
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
END
CLOSE @CURSOR
select @karma_total_score
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_current_score_detailed]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_current_score_detailed]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_current_score_detailed] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_current_score_detailed] 
    @user_id uniqueidentifier

OUTPUT AS 
	declare @page_id as uniqueidentifier
	declare @persent as float
	declare @up as float
	declare @down as float
	DECLARE @CURSOR CURSOR
	declare @page_title_temp nvarchar(MAX)
	declare @karma_total_score as float
	set @karma_total_score = 0
	IF OBJECT_ID('tempdb..#Temp') IS NOT NULL DROP Table #Temp
	CREATE TABLE #Temp (
	page_title nvarchar(MAX),
	page_id uniqueidentifier,
	result nvarchar(max),
	up int,
	down int,
	added_to_karma float,
	)
SET @CURSOR = CURSOR SCROLL
FOR
	select [dbo].[KnownPages].id as id, ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as 'percent'
	from [dbo].[KnownPages_UsersContribution] 
	left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
	left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
	where UserID = @user_id and [characters_total] >0
OPEN @CURSOR
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
WHILE @@FETCH_STATUS = 0
BEGIN
IF ((select count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id)= 0)
BEGIN
-- bonus for a page without votes (1 karma point * @persent)
select @page_title_temp =page_title from [dbo].[KnownPages] where id = @page_id
set @karma_total_score = @karma_total_score + @persent

Insert INTO #Temp (page_title,page_id,result,added_to_karma,up,down)
select @page_title_temp as page_title,@page_id as page_id, 'no votes found' as result, @persent as added_to_karma, NULL as up,  NULL as down
END
ELSE
BEGIN
select @up = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 1
select @down = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 0
set @karma_total_score = @karma_total_score + ((@up-@down)* @persent)
Insert INTO #Temp (page_title,page_id,result,added_to_karma,up,down)
select [dbo].[KnownPages].page_title as page_title,@page_id as page_id, 'votes found: '+cast((@up+@down) as nvarchar) as result, ((@up-@down)* @persent) as added_to_karma, @up as up,  @down as down
from [dbo].[Page_Karma_votes] 
left join [dbo].[KnownPages] on [dbo].[KnownPages].id = [dbo].[Page_Karma_votes].page_id
where [Page_Karma_votes].page_id = @page_id
GROUP BY page_title
END
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
END
CLOSE @CURSOR
select * from #Temp order by added_to_karma desc;
--select sum(added_to_karma) from #Temp
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_current_score_global]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_current_score_global]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_current_score_global] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_current_score_global]
AS
		declare @page_id as uniqueidentifier
		declare @user_name as nvarchar(MAX)
		declare @user_id as uniqueidentifier
		declare @persent as float
		declare @up as float
		declare @down as float
		DECLARE @CURSOR CURSOR
		DECLARE @CURSOR_users CURSOR
		declare @karma_total_score as float
	SET NOCOUNT ON
	IF OBJECT_ID('tempdb.dbo.#TempKarmaTotal', 'U') IS NOT NULL
	  DROP TABLE #TempKarmaTotal; 
	CREATE TABLE tempdb.dbo.#TempKarmaTotal(user_name nvarchar(MAX), karma_total_score float)

	SET @CURSOR_users = CURSOR SCROLL
	FOR
	SELECT [ID], [user_name] FROM [Karma].[dbo].[KnownPages_Users] where user_name like LOWER('xwiki%') and user_name not in
	('XWiki.bot','XWiki.XWikiGuest','XWiki.root', 'XWiki.guest', 'XWiki.drozhdestvenskiy')
	OPEN @CURSOR_users
	FETCH NEXT FROM @CURSOR_users INTO @user_id, @user_name
	set @karma_total_score = 0
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @CURSOR = CURSOR SCROLL
			FOR
				select [dbo].[KnownPages].id as id, ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as 'percent'
				from [dbo].[KnownPages_UsersContribution] 
				left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
				left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
				where UserID = @user_id and [characters_total] >0
			OPEN @CURSOR
			FETCH NEXT FROM @CURSOR INTO @page_id, @persent
			WHILE @@FETCH_STATUS = 0
			BEGIN
			IF ((select count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id)= 0)
			BEGIN
			-- bonus for a page without votes (1 karma point)
			set @karma_total_score = @karma_total_score + @persent
			--select @page_id, 'no votes found, adding..',@persent, @karma_total_score as 'current karma'
			END
			ELSE
			BEGIN
			/*
			select [dbo].[KnownPages].page_title as 'page_title', [dbo].[Page_Karma_votes].[direction] as 'direction', @persent as 'multipl',[dbo].[KnownPages_Users].user_name
			from [dbo].[KnownPages] 
			left join [dbo].[Page_Karma_votes] on [dbo].[KnownPages].id = [dbo].[Page_Karma_votes].page_id
			left join [dbo].[KnownPages_Users] on [dbo].[Page_Karma_votes].user_id = [dbo].[KnownPages_Users].id
			where [dbo].[KnownPages].id = @page_id
			*/
			select @up = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 1
			select @down = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 0
			set @karma_total_score = @karma_total_score + ((@up-@down)* @persent)
			--select @up as 'up', @down as 'down',((@up-@down)* @persent) as 'summary', @karma_total_score as 'current karma'
			END
			FETCH NEXT FROM @CURSOR INTO @page_id, @persent
			END
			CLOSE @CURSOR
			insert INTO #TempKarmaTotal(user_name, karma_total_score) values (@user_name, @karma_total_score)
			set @karma_total_score = 0
	
	FETCH NEXT FROM @CURSOR_users INTO @user_id, @user_name 
	END
	CLOSE @CURSOR_users
	select user_name, karma_total_score from #TempKarmaTotal order by karma_total_score desc
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_current_score_to_var]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_current_score_to_var]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_current_score_to_var] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_current_score_to_var]
    @user_id uniqueidentifier,
	@return_value float OUTPUT
AS   
    SET NOCOUNT ON;  
	declare @page_id as uniqueidentifier
	declare @persent as float
	declare @up as float
	declare @down as float
	DECLARE @CURSOR CURSOR
	declare @karma_total_score as float
	set @karma_total_score = 0
SET @CURSOR = CURSOR SCROLL
FOR
	select [dbo].[KnownPages].id as id, ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as 'percent'
	from [dbo].[KnownPages_UsersContribution] 
	left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
	left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
	where UserID = @user_id and [characters_total] >0
OPEN @CURSOR
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
WHILE @@FETCH_STATUS = 0
BEGIN
IF ((select count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id)= 0)
BEGIN
-- bonus for a page without votes (1 karma point)
set @karma_total_score = @karma_total_score + @persent
--select @page_id, 'no votes found, adding..',@persent, @karma_total_score as 'current karma'
END
ELSE
BEGIN
/*
select [dbo].[KnownPages].page_title as 'page_title', [dbo].[Page_Karma_votes].[direction] as 'direction', @persent as 'multipl',[dbo].[KnownPages_Users].user_name
from [dbo].[KnownPages] 
left join [dbo].[Page_Karma_votes] on [dbo].[KnownPages].id = [dbo].[Page_Karma_votes].page_id
left join [dbo].[KnownPages_Users] on [dbo].[Page_Karma_votes].user_id = [dbo].[KnownPages_Users].id
where [dbo].[KnownPages].id = @page_id
*/
select @up = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 1
select @down = count(*) from [dbo].[Page_Karma_votes] where [page_id] = @page_id and [direction] = 0
set @karma_total_score = @karma_total_score + ((@up-@down)* @persent)
--select @up as 'up', @down as 'down',((@up-@down)* @persent) as 'summary', @karma_total_score as 'current karma'
END
FETCH NEXT FROM @CURSOR INTO @page_id, @persent
END
CLOSE @CURSOR
set @return_value = @karma_total_score
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_raw]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_raw]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_raw] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_raw] 
    @id uniqueidentifier

OUTPUT AS   
	select [dbo].[KnownPages].page_title as 'page_title', ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as 'percent'
	from [dbo].[KnownPages_UsersContribution] 
	left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
	left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
	where UserID = @id and [characters_total] >0
GO
/****** Object:  StoredProcedure [dbo].[get_user_karma_raw_score]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_user_karma_raw_score]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_user_karma_raw_score] AS' 
END
GO
ALTER PROCEDURE [dbo].[get_user_karma_raw_score]  
    @id uniqueidentifier

AS   
    SET NOCOUNT ON;  
    DECLARE	@return_value int
	IF OBJECT_ID('tempdb..#TempTable') IS NOT NULL DROP Table #TempTable
	select [dbo].[KnownPages].page_title, ROUND(1* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),2) as persent
	INTO #TempTable
	from [dbo].[KnownPages_UsersContribution] 
	left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
	left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
	where UserID = @id and [characters_total] >0
	select SUM(persent) from #TempTable;  
GO
/****** Object:  StoredProcedure [dbo].[make_new_global_karma_slice]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[make_new_global_karma_slice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[make_new_global_karma_slice] AS' 
END
GO
ALTER PROCEDURE [dbo].[make_new_global_karma_slice]
AS   
    SET NOCOUNT ON; 
	DECLARE @user_id as uniqueidentifier
	DECLARE @CURSOR CURSOR
SET @CURSOR = CURSOR SCROLL
FOR
select id from [Karma].[dbo].[KnownPages_Users]
OPEN @CURSOR
FETCH NEXT FROM @CURSOR INTO @user_id
WHILE @@FETCH_STATUS = 0
BEGIN
  exec [dbo].[make_new_karma_slice] @user_id
FETCH NEXT FROM @CURSOR INTO @user_id
END
CLOSE @CURSOR
GO
/****** Object:  StoredProcedure [dbo].[make_new_karma_slice]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[make_new_karma_slice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[make_new_karma_slice] AS' 
END
GO

ALTER PROCEDURE [dbo].[make_new_karma_slice]
    @user_id uniqueidentifier
AS   
SET NOCOUNT ON   
declare @curent_karma_score as float
declare @previous_karma_score as float
exec [dbo].[get_user_karma_current_score_to_var] @user_id, @curent_karma_score output
select top 1 @previous_karma_score=[karma_score] from [dbo].[UserKarma_slice] where [user_id] = @user_id order by change_time desc
if (@previous_karma_score = @curent_karma_score)
	begin
		select 'Karma wasn''t changed' as result
	END
else
	begin
		insert into [dbo].[UserKarma_slice] values (newid(),@user_id, @curent_karma_score, @previous_karma_score, getdate())
		select round(@curent_karma_score, 2) as result
	END

GO
/****** Object:  StoredProcedure [dbo].[update_or_Add_bug_page]    Script Date: 10/5/2017 10:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[update_or_Add_bug_page]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[update_or_Add_bug_page] AS' 
END
GO
ALTER PROCEDURE [dbo].[update_or_Add_bug_page]
@KnownPages_id as uniqueidentifier,
@bug_id as varchar(max), 
@product as varchar(max),
@tbfi as varchar(max),
@xml as xml
AS
  BEGIN
   IF NOT EXISTS (SELECT * FROM [dbo].[KnownBugs] 
                   WHERE [KnownPages_id] = @KnownPages_id)
   BEGIN
       insert into [dbo].[KnownBugs] ([ID],[KnownPages_id],[bug_id],[product],[tbfi],[components])
	   values (newid(), @KnownPages_id, @bug_id, @product, @tbfi, @xml)
   END
   ELSE
	BEGIN
	update [dbo].[KnownBugs] set [bug_id] = @bug_id, [product] = @product, [tbfi] = @tbfi, [components] = @xml where [KnownPages_id] = @KnownPages_id
	END
END
GO
USE [master]
GO
ALTER DATABASE [Karma] SET  READ_WRITE 
GO
