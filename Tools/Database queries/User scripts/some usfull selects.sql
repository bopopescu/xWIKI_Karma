select * FROM [Karma].[dbo].[KnownPages] where added between dateadd(dd,-25,getdate()) and GETDATE() and author != 'Addbug' and platform != 'MediaWIKI'
order by author

select * FROM [Karma].[dbo].[KnownPages] where platform = 'MediaWIKI' and author != 'Addbug' order by author

--select all contributors of some page by its title
select [KnownPages_Users].user_name, ROUND(100* (CAST([KnownPages_UsersContribution].contribution AS float) / CAST([KnownPages].characters_total AS float)),2) as 'percent'
FROM [Karma].[dbo].[KnownPages_UsersContribution]
left join [dbo].[KnownPages_Users] on [KnownPages_UsersContribution].UserID=[KnownPages_Users].id
left join [dbo].[KnownPages] on [KnownPages_UsersContribution].KnownPageid=[KnownPages].id
where [KnownPages_UsersContribution].KnownPageid in
(select ID from [KnownPages] where page_title ='Networking 6. Basic Network Troubleshooting')


--select all contribute made by some user
select [dbo].[KnownPages].page_title, ROUND(100* (CAST([dbo].[KnownPages_UsersContribution].contribution AS float) / CAST([dbo].[KnownPages].characters_total AS float)),1) as 'percent'
from [dbo].[KnownPages_UsersContribution] 
left join [dbo].[KnownPages] on [dbo].[KnownPages_UsersContribution].KnownPageID = [dbo].[KnownPages].ID
left join [dbo].[KnownPages_Users] on [dbo].[KnownPages_UsersContribution].UserID=[KnownPages_Users].id
where UserID in
(select id from [dbo].[KnownPages_Users] where user_name ='Kirill Avramenko')
order by 'percent' desc

--select from all tables by page id
declare @id as uniqueidentifier
	select @id=id from [Karma].[dbo].[KnownPages] where page_title = 'SMTPDummy'
	select * from [Karma].[dbo].[KnownPages_datagrams] where KnownPageID = @id
	select * from [Karma].[dbo].[KnownPages] where id = @id
	select * FROM [Karma].[dbo].[KnownPages_contribution] where KnownPageID = @id
	select * from [dbo].[KnownPages_UsersContribution] where KnownPageID = @id

/*
delete FROM [Karma].[dbo].[KnownPages] 
delete FROM [Karma].[dbo].[KnownPages_contribution] 
delete FROM [Karma].[dbo].[KnownPages_Users]
delete FROM [Karma].[dbo].[KnownPages_UsersContribution]
delete FROM [Karma].[dbo].[KnownPages_datagrams]

declare @id as uniqueidentifier
select @id=id from [Karma].[dbo].[KnownPages] where page_title = 'Drafts:API test page'
	IF NOT EXISTS(SELECT id FROM [Karma].[dbo].[KnownPages_datagrams] WHERE KnownPageID = @id)
			delete from [Karma].[dbo].[KnownPages_datagrams] where KnownPageID = @id
			delete from [Karma].[dbo].[KnownPages] where id = @id
			delete FROM [Karma].[dbo].[KnownPages_contribution] where KnownPageID = @id
			delete from [Karma].[dbo].[KnownPages_UsersContribution] where KnownPageID = @id

*/

declare @id as uniqueidentifier
	select @id=id from [Karma].[dbo].[KnownPages] where page_id = '9076785'
	delete from [Karma].[dbo].[KnownPages_datagrams] where KnownPageID = @id
	delete from [Karma].[dbo].[KnownPages] where id = @id
	delete FROM [Karma].[dbo].[KnownPages_contribution] where KnownPageID = @id
	delete from [dbo].[KnownPages_UsersContribution] where KnownPageID = @id

declare @id as uniqueidentifier
	select @id=id from [Karma].[dbo].[KnownPages] where page_title = 'Bug 70318 - Point in time restore is not available for DB til next image level backup if it never was backed up before'
	delete from [Karma].[dbo].[KnownPages_datagrams] where KnownPageID = @id
	delete from [Karma].[dbo].[KnownPages] where id = @id
	delete FROM [Karma].[dbo].[KnownPages_contribution] where KnownPageID = @id
	delete from [dbo].[KnownPages_UsersContribution] where KnownPageID = @id




SELECT * 
FROM [dbo].[KnownBugs]
WHERE ( Charindex('WAN Accelerator',CAST([components] AS VARCHAR(MAX)))>0 ) and ( Charindex('BackupCopy',CAST([components] AS VARCHAR(MAX)))>0 )
