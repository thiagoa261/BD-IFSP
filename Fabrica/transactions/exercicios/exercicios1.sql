--Faça duas transações não aninhadas para atualização de custo em 10% na tabela projeto
--e inserção de um registro na tabela de fornecedores.
BEGIN TRANSACTION Up_Custo
	 update Projeto set PCusto = PCusto + (PCusto*10/100)

	 if @@ERROR <> 0
		ROLLBACK TRANSACTION Up_Custo
	 else
		COMMIT TRANSACTION Up_Custo


BEGIN TRANSACTION InserirF
insert into Fornecedor values(100, 'Nome', 'Catanduva', 'Z')

if @@ERROR <> 0
	ROLLBACK TRANSACTION InserirF
else
	COMMIT TRANSACTION InserirF
--select * from Fornecedor;



--Reescreva as operações do exercício anterior com duas transações aninhadas.
BEGIN TRANSACTION Up_Custo
	update Projeto set PCusto = PCusto + (PCusto*10/100)

	if @@ERROR <> 0
		ROLLBACK TRANSACTION Up_Custo
	else
		BEGIN TRANSACTION InserirF
		insert into Fornecedor values(100, 'Nome', 'Catanduva', 'Z')

		if @@ERROR <> 0
			ROLLBACK TRANSACTION InserirF
		else
			COMMIT TRANSACTION InserirF

		COMMIT TRANSACTION Up_Custo