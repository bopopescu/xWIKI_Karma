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
/****** Object:  StoredProcedure [dbo].[get_page_karma_and_votes]    Script Date: 10/5/2017 10:13:52 PM ******/
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
