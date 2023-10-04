create trigger exe_01
on Peca
after insert
as
update Peca
set PeCor = 'Azul'
where Pecor = 'Amarelo'
and PeNro = (SELECT PeNro FROM inserted);

select * from Peca;
insert into Peca values(200, 'Nome', 100, 'Amarelo');



create trigger exe_02
on Peca
instead of delete
as
update Peca
set PePreco = 50
where PeNro = (SELECT PeNro FROM deleted);

select * from Peca;
delete from Peca where PeNro = 1;



create trigger exe_03
on Peca
instead of update
as
update Peca
set Pecor = 'Amarelo'
where PeNro = (SELECT PeNro FROM inserted);

select * from Peca;
update Peca set PeNome = 'NovoNome' where PeNro = 4;



create trigger exe_04
on Peca
instead of insert
as
insert into Peca (PeNro, PeNome, PePreco, PeCor)
select PeNro, PeNome, PePreco, 'Roxo'
from inserted;

select * from Peca;
insert into Peca values(202, 'NomeGenerico', 100, 'AlgumaCor');
