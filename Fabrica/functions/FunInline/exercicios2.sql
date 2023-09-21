create function ValorPeça(@numPeca int)
returns table
as
return (
select PePreco from Peca
where PeNro = @numPeca
);
--select * from ValorPeça(2);


create function NomeDuracaoProjeto(@numPeca int)
returns table
as
return (
select p.PNome, p.PDuracao
from Peca pe, Projeto p, Fornece_para fp
where fp.PeNro = @numPeca
and fp.PNro = p.PNro
and fp.PeNro = pe.PeNro
and p.PCusto > 30000
);
--select * from NomeDuracaoProjeto(2);


create function CategoriaFornecedor(@categ varchar(1))
returns table
as
return (
select f.FNome, p.PNome, p.PDuracao
from Fornecedor f, Fornece_Para fp, Projeto p
where f.FCateg = @categ
and f.FNro = fp.FNro
and p.PNro = fp.PNro
)
--select * from CategoriaFornecedor('A');