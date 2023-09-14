/*
Create Procedure Nome_Projetos(@num_projeto int)as
Select PNro, PNome, PCusto from Projeto
where Projeto.PNro = @num_projeto;
exec Nome_Projetos 3;
*/

create procedure NomesPeFoQt as
select pe.PeNome, f.FNome, fp.Quant
from Peca pe, Fornece_Para fp, Fornecedor f
where fp.FNro = f.FNro
and fp.PeNro = pe.PeNro;
exec NomesPeFoQt;

create procedure sp_pecas_fornecidas(@peca_num int) as
select pe.PeNome NomePeça, fp.Quant Quantidade
from Fornece_Para fp, Peca pe
where pe.PeNro = @peca_num
and pe.PeNro = fp.PeNro;
exec sp_pecas_fornecidas 4;

create procedure sp_quant_fornecida(@qtd int) as
select pe.PeNome NomePeça, f.FNome Fornecedor
from Peca pe, Fornece_Para fp, Fornecedor f
where fp.FNro = f.FNro
and pe.PeNro = fp.PeNro
and fp.Quant >= @qtd;
exec sp_quant_fornecida 2;

create procedure cor_peca(
@cor varchar(20),
@qtd int
) as
select pe.PeNome, fp.Quant
from Peca pe, Fornece_Para fp
where pe.PeNro = fp.PeNro
and fp.Quant <= @qtd
and pe.PeCor = @cor;
exec cor_peca 'Amarelo', 3;