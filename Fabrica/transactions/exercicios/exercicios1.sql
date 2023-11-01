--Faça duas transações não aninhadas para atualização de custo em 10% na tabela projeto 
--e inserção de um registro na tabela de fornecedores.
BEGIN TRANSACTION Up_Custo
	 update Projeto set PCusto = PCusto + (PCusto*10/100)
	 
	 if @@ERROR <> 0
		ROLLBACK TRANSACTION Up_Custo
	 else
		COMMIT TRANSACTION Up_Custo
		
		
		
create procedure InsereForn (
	@FNro int,
	@FNome varchar(30),
	@FCidade varchar(30),
	@FCateg varchar(1)
) as
BEGIN
	BEGIN TRANSACTION InserirF
	insert into Fornecedor values(@FNro, @FNome, @FCidade, @FCateg)
	
	if @@ERROR <> 0
		ROLLBACK TRANSACTION InserirF
	else
		COMMIT TRANSACTION InserirF
END
--exec InsereForn 80, 'teste', 'Catanduva', 'A';
--select * from Fornecedor;