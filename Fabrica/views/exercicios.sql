/* Com os projetos de duração entre 3 e 5 meses, inclusive os que possuem um preço menor que $ 30.000.
Mostre os nomes, a duração e o custo, todos com apelidos. */
create view exe1 as
select p.PNome NomeProjeto, p.PDuracao DuracaoProjeto, p.PCusto CustoProjeto
from projeto p
where p.PCusto < 30000
and p.PDuracao between 3 and 5

/* Com os projetos que tenham custo inferior a R$ 30.000,00 e apenas 1 peça fornecida.
Mostrar nome e custo do projeto. */
create view exe2 as
select p.PNome NomeProjeto, p.PCusto CustoProjeto
from projeto p, fornece_para fp
where p.PCusto < 30000
and fp.PNro = p.PNro
group by p.PNro
having sum(fp.Quant) = 1;

/* Criar uma visão com os nomes e os códigos das peças que são fornecidas. */
create view exe3 as
select pe.PeNro CodigoPeca, pe.PeNome NomePeca
from peca pe, fornece_para fp
where pe.PeNro = fp.PeNro
group by pe.PeNro;

/* Visão com os nomes de fornecedores e suas peças (nomes) fornecidas.  */
create view exe4 as
select f.FNome NomeFornecedor, pe.PeNome NomePecaFornecida
from fornece_para fp, fornecedor f, peca pe
where fp.FNro = f.FNro
and fp.PeNro = pe.PeNro
group by pe.PeNro, f.FNro;

/* Com os nomes de projetos e as peças (nome) fornecidas que sejam da cor Vermelho. */
create view exe5 as
select p.PNome NomeProjeto, pe.PeNome NomePeca
from fornece_para fp, projeto p, peca pe
where pe.PeCor = 'Vermelho'
and fp.PeNro = pe.PeNro
and fp.PNro = p.PNro
group by p.PNro, pe.PeNro;

select * from exe1;