  drop table #temp
  select distinct T.N.value('.','varchar(300)') as nodeName, product, bug_id into #temp from [dbo].[KnownBugs] cross apply components.nodes('./components/component/name') as T(N) 
  where [product] in ('BNR 9.5.0.1038', 'BNR 9.5.0.1536', 'BNR 9.5.0.1922', 'BNR 9.5.0.823')
  
  select * from #temp

  select distinct nodeName from #temp order by nodeName