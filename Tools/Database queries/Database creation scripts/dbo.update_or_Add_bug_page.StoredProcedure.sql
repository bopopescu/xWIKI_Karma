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
/****** Object:  StoredProcedure [dbo].[update_or_Add_bug_page]    Script Date: 10/5/2017 10:13:52 PM ******/
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
