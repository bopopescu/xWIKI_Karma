/****** Script for SelectTopNRows command from SSMS  ******/


declare @page_title as nvarchar(max) = 'Certutil.exe',
@page_id as uniqueidentifier

IF OBJECT_ID('tempdb.dbo.#temp', 'U') IS NOT NULL
  DROP TABLE #temp; 


select @page_id=id from [dbo].[KnownPages] where page_title like @page_title


SELECT [page_id], [user_id],[direction],[added], @page_title as page_title  into #temp
  FROM [Karma].[dbo].[Page_Karma_votes] where page_id=@page_id

  select * from #temp

  --exec [dbo].[delete_page] 'E11ED523-FDD8-4E06-B64E-D35A91625054'

  DECLARE @CURSOR CURSOR,
  @user_id uniqueidentifier,
  @direction bit,
  @added datetime,
  @new_page_id uniqueidentifier,
  @page_title nvarchar(max) = 'Certutil.exe'
  select @new_page_id=id from [dbo].[KnownPages] where page_title like @page_title

  SET @CURSOR = CURSOR SCROLL
FOR
	select user_id,direction,added from #temp where page_title=@page_title

OPEN @CURSOR

FETCH NEXT FROM @CURSOR INTO @user_id, @direction, @added
WHILE @@FETCH_STATUS = 0

BEGIN
 insert into [dbo].[Page_Karma_votes] values(newid(),@new_page_id, @user_id, @direction, @added)

FETCH NEXT FROM @CURSOR INTO @user_id, @direction, @added
END

CLOSE @CURSOR