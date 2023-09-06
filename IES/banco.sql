CREATE TABLE IES(
	IES_codigo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IES_nome varchar(40) NOT NULL
);

CREATE TABLE Pessoas(
	Pes_codigo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Pes_nome varchar(40) NOT NULL
);

CREATE TABLE Clientes (
	Pes_codigo int NOT NULL PRIMARY KEY,
	Cli_cpf varchar(12) NOT NULL UNIQUE,
	Cli_email varchar(30) NULL,
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
);

CREATE TABLE Funcionarios(
	Pes_codigo int NOT NULL PRIMARY KEY,
	Fun_ch int NOT NULL,
	Fun_salario money NOT NULL,
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
);

CREATE TABLE Estagiarios(
	Pes_codigo int NOT NULL PRIMARY KEY,
	Est_data datetime NOT NULL,
	IES_codigo int NOT NULL,
	foreign key (IES_codigo) references IES(IES_codigo),
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
);

INSERT INTO IES (IES_nome) VALUES ('UFSCar');
INSERT INTO IES (IES_nome) VALUES ('USP');

INSERT INTO Pessoas (Pes_nome) VALUES ('João');
INSERT INTO Pessoas (Pes_nome) VALUES ('Maria');

INSERT INTO Pessoas (Pes_nome) VALUES ('Pedro');
INSERT INTO Pessoas (Pes_nome) VALUES ('Lucas');

INSERT INTO Pessoas (Pes_nome) VALUES ('Roberto');
INSERT INTO Pessoas (Pes_nome) VALUES ('Gabriela');
INSERT INTO Pessoas (Pes_nome) VALUES ('Vitor');

INSERT INTO Clientes (Pes_codigo, Cli_cpf, Cli_email) VALUES (1, '55113720801', 'joao@gmail.com');
INSERT INTO Clientes (Pes_codigo, Cli_cpf, Cli_email) VALUES (2, '35138915126', 'maria@hotmail.com');

INSERT INTO Funcionarios (Pes_codigo, Fun_ch, Fun_salario) VALUES (3, 40, 2500.00);
INSERT INTO Funcionarios (Pes_codigo, Fun_ch, Fun_salario) VALUES (4, 35, 3000.00);

INSERT INTO Estagiarios (Pes_codigo, Est_data, IES_codigo) VALUES (5, '2022-01-15', 1);
INSERT INTO Estagiarios (Pes_codigo, Est_data, IES_codigo) VALUES (6, '2022-02-20', 2);
INSERT INTO Estagiarios (Pes_codigo, Est_data, IES_codigo) VALUES (7, '2023-04-20', 2);