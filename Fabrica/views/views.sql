create view Fornecedores as
select f.FNome NomeFornecedor, f.FCateg Categoria, f.FCidade Cidade
from fornecedor f
where f.FCidade = 'Campinas'
and f.FCateg in ('A', 'B');

create view VerProje as
select p.PNome NomeProjeto, fp.PNro NumeroProjeto
from projeto p inner join fornece_para fp on p.PNro = fp.PNro;

create view QuantPecas as
select p.PeNome NomePeca, fp.Quant QuantidadePeca
from peca p, fornece_para fp where p.PeNro = fp.PeNro
and fp.Quant > 2;

create view FornecedoresPecas as
select f.FNome Fornecedor, p.PeNome PecaNome
from fornecedor f, peca p, fornece_para fp
where fp.PeNro = p.PeNro and fp.FNro = f.FNro;

create view exe as
select f.FNome, f.FCidade
from fornecedor f, fornece_para fp
where f.FCateg = 'C' and fp.FNro = f.FNro;

Create view PecasNome as
Select PeNome
From Peca;