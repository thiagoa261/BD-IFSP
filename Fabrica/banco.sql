CREATE TABLE Peca
(
PeNro int NOT NULL primary key ,
PeNome varchar(15) NOT NULL,
PePreco float NOT NULL,
PeCor	varchar(15)
);

CREATE TABLE Fornecedor
(
FNro int NOT NULL primary key ,
FNome varchar(30) not null,
FCidade varchar(25) not null,
FCateg varchar(1) not null
);

CREATE TABLE Projeto
(
PNro int NOT NULL primary key ,
PNome varchar(30) not null,
PDuracao varchar(15) not null,
PCusto float not null
);

CREATE TABLE Fornece_Para
(
PeNro int not null,
FNro int NOT NULL,
PNro int NOT NULL,
Quant int NOT NULL,
primary key(PeNro, FNro,PNro),
foreign key (PeNro) references Peca(PeNro),
foreign key (FNro) references Fornecedor(FNro),
foreign key (PNro) references Projeto(PNro)
);

insert into Projeto (Pnro, PNome, PDuracao,PCusto) values (1, 'Detroit', '5', 43000);
insert into Projeto values (2, 'Pegasus', '3', 37000);
insert into Projeto values (3, 'Alfa', '2', 26700);
insert into Projeto values (4, 'Sea', '3', 21200);
insert into Projeto values (5, 'Paraíso', '1', 17000);

insert into Fornecedor values(1, 'Plastec', 'Campinas', 'B');
insert into Fornecedor values(2, 'C&M', 'São Paulo', 'D');
insert into Fornecedor values(3, 'Kirurgic', 'Campinas','A');
insert into Fornecedor values(4, 'Pilotos', 'Piracicaba', 'A');
insert into Fornecedor values(5, 'Equipament', 'São Carlos', 'C');

insert into Peca values(1, 'Cinto', 22, 'Azul');
insert into Peca values(2, 'Volante', 18, 'Vermelho');
insert into Peca values(3, 'Lanterna', 14, 'Preto');
insert into Peca values(4, 'Limpador', 09, 'Amarelo');
insert into Peca values(5, 'Painel', 43, 'Vermelho');
insert into Peca values(6, 'Parabrisa', 56,null);

insert into Fornece_Para values(1,5,4,5);
insert into Fornece_Para values(2,2,2,1);
insert into Fornece_Para values(3,3,4,2);
insert into Fornece_Para values(4,4,5,3);
insert into Fornece_Para values(5,1,1,1);
insert into Fornece_Para values(2,2,3,1);
insert into Fornece_Para values(4,3,5,2);