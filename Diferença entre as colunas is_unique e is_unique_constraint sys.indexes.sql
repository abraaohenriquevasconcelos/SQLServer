use Teste1
go
create table tab21(col1 int, col2 int)
go


-- criamos uma unique constraint
alter table tab21 add constraint unique_constraint_tab21_01 unique (col1) 
go
insert into tab21 values (1,2)
/*
O insert abaixo retorna o seguinte erro
Violação da restrição UNIQUE KEY 'unique_constraint_tab21_01'. Não é possível inserir a chave duplicada no objeto 'dbo.tab21'. 
O valor de chave duplicada é (1).
*/
insert into tab21 values (1,3)

--criamos um unique index
--O comando CREATE UNIQUE INDEX cria um índice exclusivo em uma tabela (não são permitidos valores duplicados)
create unique index IX_tab21_001 on tab21 (col2)

insert into tab21 values (2,4)
/* O insert abaixo vai retornar o seguinte erro
Não é possível inserir uma linha de chave duplicada no objeto 'dbo.tab21' com índice exclusivo 'IX_tab21_001'. 
O valor de chave duplicada é (4). */
insert into tab21 values (3,4)


select name, is_unique, is_unique_constraint from sys.indexes
where object_id = object_id('tab21') and index_id <> 0
/*
name										is_unique				is_unique_constraint
unique_constraint_tab21_01						1							1
IX_tab21_001									1							0

*/

/*
Fonte:https://translate.google.com.br/translate?hl=pt-BR&sl=en&tl=pt&u=https%3A%2F%2Fsocial.msdn.microsoft.com%2FForums%2Fsqlserver%2Fen-US%2Fc0ee3665-fe41-4b85-a10f-41af4cfe257c%2Fsysindexesisunique-vs-sysindexesisuniqueconstraint%3Fforum%3Dtransactsql

Talvez seja um choque para a maioria de nós, mas o índice UNIQUE não é um objeto de banco de dados. Restrição UNIQUE (KEY) é.
Na verdade, o índice não é um objeto de banco de dados. Na verdade, o índice não é um objeto de banco de dados. 
Como você pode se perguntar quando metade das discussões em fóruns gira em torno de índices? Bem, o índice é apenas um "assistente" de aceleração. 
As consultas devem funcionar da mesma maneira com ou sem indexação. 
ANSI SQL não se importa como a restrição UNIQUE KEY é implementada pelos fornecedores de RDBMS. O índice UNIQUE é a escolha do SQL Server.


Talvez essa questão seja mais sobre qual é a diferença entre uma restrição exclusiva e um índice exclusivo? 
Ambos aparecem como índices no Mgmt Studio. E ambos reforçam a singularidade. Então, qual é a diferença?

a unique constraint generated index can't have any other features which you can add through create unique index,for example, 
by using create unique index, you are able to add included columns, but unique constrainst can't;

you can't explicit drop an index created by unique constraint, you have to remove by using Alter Table .... Drop Constraint ... 
while you use drop index to drop an index created by using Create Unique Index;


*/

