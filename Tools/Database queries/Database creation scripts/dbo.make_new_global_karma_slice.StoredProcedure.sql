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
/****** Object:  StoredProcedure [dbo].[make_new_global_karma_slice]    Script Date: 10/5/2017 10:13:52 PM ******/
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
