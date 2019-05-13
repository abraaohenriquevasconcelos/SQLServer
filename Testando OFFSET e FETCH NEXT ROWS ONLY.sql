create table tab11(numero int identity(1,1))

alter table tab11 add nome varchar(20) default('teste')

insert tab11 values ('testando')
go 10



select  * from tab11
order by numero asc
offset 3 rows --Pula as 3 primeiras linhas
fetch next 4 rows only --mostra apenas as próximas 4 linhas depois de pular as 10 primeiras