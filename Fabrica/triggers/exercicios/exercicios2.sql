create trigger exer001
on Peca
instead of insert as
declare @PeNro int
declare @PeNome varchar(20)
declare @PePreco float
declare @PeCor varchar(20)
set @PeNro = (select PeNro from inserted)
set @PeNome = (select PeNome from inserted)
set @PePreco = (select PePreco from inserted)
set @PeCor = (select PeCor from inserted)
if(@PePreco < 5)
	begin
	insert into Peca values (@PeNro, @PeNome, 5.0, @PeCor)
	end
else
	insert into Peca values (@PeNro, @PeNome, @PePreco, @PeCor);
	
	
create trigger exer002
on Fornecedor
instead of delete as
update fornecedor
set FCateg = 'C'
where FNro = (select FNro from deleted)
and FCateg NOT IN ('A', 'B', 'C');


create trigger exer003
on Projeto
instead of insert as
declare @PNro int
declare @PNome varchar(20)
declare @PDuracao varchar(15)
declare @PCusto float
set @PNro = (select PNro from inserted)
set @PNome = (select PNome from inserted)
set @PDuracao = (select PDuracao from inserted)
set @PCusto = (select PCusto from inserted)
if(@PCusto > 50000)
	begin
	insert into Peca values (@PNro, @PNome, @PDuracao, 50000)
	end
else
	insert into Peca values (@PNro, @PNome, @PDuracao, @PCusto);
	
	
	
create table historico_projetos (
PNro int NOT NULL,
PNome varchar(30) not null,
PDuracao varchar(15) not null,
PCusto float not null
)
	
create trigger exer005
on Projeto
after update as if update(PDuracao)
declare @PNro int
declare @PNome varchar(30)
declare @PDuracao varchar(15)
declare @PCusto float
set @PNro = (select PNro from inserted)
set @PNome = (select PNome from inserted)
set @PDuracao = (select PDuracao from deleted)
set @PCusto = (select PCusto from inserted)
insert into historico_projetos values(@PNro, @PNome, @PDuracao, @PCusto);



create table projeto_antigo (
PNro int NOT NULL,
PNome varchar(30) not null,
PDuracao varchar(15) not null,
PCusto float not null
)

create table projeto_atualizado (
PNro int NOT NULL,
PNome varchar(30) not null,
PDuracao varchar(15) not null,
PCusto float not null
)

create trigger exer007 
on Projeto
after update as
declare @PNro int
declare @PNome varchar(30)
declare @PDuracao varchar(15)
declare @PCusto float

set @PNro = (select PNro from deleted)
set @PNome = (select PNome from deleted)
set @PDuracao = (select PDuracao from deleted)
set @PCusto = (select PCusto from deleted)
insert into projeto_antigo values(@PNro, @PNome, @PDuracao, @PCusto)

set @PNro = (select PNro from inserted)
set @PNome = (select PNome from inserted)
set @PDuracao = (select PDuracao from inserted)
set @PCusto = (select PCusto from inserted)
insert into projeto_atualizado values(@PNro, @PNome, @PDuracao, @PCusto)