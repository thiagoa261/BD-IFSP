CREATE TABLE Peca2
(
PeNro int NOT NULL primary key ,
PeNome varchar(15) NOT NULL,
PePreco float NOT NULL,
PeCor	varchar(15)
);


/* Replicação de Inserção */
create trigger Replic
on Peca
for insert as
Insert into Peca2
Select * from Inserted

Insert Peca values (100, 'Nome1', 80.00, 'Vermelha');
Insert Peca values (101, 'Nome2', 60.00, 'Vermelha');
Insert Peca values (102, 'Nome3', 150.00, 'Azul');
Insert Peca values (103, 'Nome4', 10.00, 'Roxo');
select * from Peca;
select * from Peca2;


/* Replicação de Exclusão */
Create Trigger DelReplic 
On Peca 
For Delete as
Delete From Peca2
Where Peca2.PeNro in (
	Select PeNro From Deleted
)

Delete from Peca Where PeNro = 103
Select * from Peca
Select * from Peca2


/* Replicação de Alteração */
Create Trigger UpdReplic 
On Peca 
For Update as
update Peca2
set PePreco = (Select PePreco From Inserted)
where Peca2.PeNro in (Select PeNro From Inserted)

Select * from Peca
Select * from Peca2

Update Peca
Set PePreco = 555
Where PeNro = 100

Select * from Peca
Select * from Peca2