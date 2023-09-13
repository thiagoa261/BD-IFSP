create procedure exer1(@codigo int) as
select p.PNome as NomeProjeto, pe.PeNome as NomePeça, SUM(fp.Quant) as QuantidadePeça
from Peca pe, Projeto p, Fornece_Para fp
where p.PNro = @codigo
and p.PNro = fp.PNro
and pe.PeNro = fp.PeNro
group by pe.PeNome, p.PNome;
exec exer1 4;

create procedure exer2(@codigo int) as
select p.PNome NomeProjeto, f.FNome NomeFornecedor
from Fornece_Para fp, Fornecedor f, Projeto p
where fp.PNro = 5
and fp.FNro = f.FNro
and fp.PNro = p.PNro
group by f.FNome, p.PNome
exec exer2 5;