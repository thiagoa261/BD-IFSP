create trigger set_cidade
on Fornecedor
after insert as
update fornecedor
set Fcidade = 'Catanduva'
where FNro = (select FNro from inserted)
and FCidade = '';


create trigger set_Cidade2 
on fornecedor 
instead of delete as
select * from deleted
update fornecedor set FCidade = 'Monte Azul'
where FNro = (select FNro from deleted);


create trigger set_status3
on fornecedor
instead of update as
update fornecedor set FCidade = null
where FNro = (select FNro from inserted;


create trigger set_insert 
on Fornecedor 
instead of insert as
insert into Fornecedor select FNro, Fnome, FCidade, null
from inserted


create trigger inserir_fornecimento 
on Fornece_Para 
instead of insert as
declare @FNro int
declare @PeNro int
declare @PNro int
declare @qtd int
set @FNro = (select FNro from inserted)
set @PeNro = (select PeNro from inserted)
set @PNro = (select PNro from inserted)
set @qtd = (select Quant from inserted)
if (@qtd > 10)
begin
	insert into Fornece_Para values (@PeNro, @FNro, @PNro, 10)
end
else
	insert into Fornece_Para values (@PeNro, @FNro, @PNro, @qtd)
	
	
	

create table historico_precos(
PeNro int,
Peça_preco_antigo money,
Peça_preco_novo money,
Peça_data_atualizacao datetime,
usuario_bd varchar(30), 
usuario_sistema varchar(30)
)


create trigger atualizar_historico 
on Peca 
after update as if update(PePreco)
declare @PeNro int
declare @preco_antigo money
declare @preco_novo money
select @PeNro = (select PeNro from deleted)
select @preco_antigo = (select PePreco from deleted)
select @preco_novo = (select PePreco from inserted)
insert into historico_precos values
(@PeNro, @preco_antigo, @preco_novo, getdate(), user_name(),system_user)


create trigger mostrar_historico 
on Peca 
after update as if update(PePreco)
select count(*) Conta_atualização from historico_precos




create table fornecedor_atualizado(
FNro int not null,
FNome varchar(20),
FCidade varchar(20),
FCateg varchar(1)
)

create table fornecedor_antigo(
FNro int not null,
FNome varchar(20),
FCidade varchar(20),
FCateg varchar(1)
)

create trigger fornecedor_atualizar
on fornecedor 
after update as
insert into fornecedor_antigo select * from deleted
insert into fornecedor_atualizado select * from inserted