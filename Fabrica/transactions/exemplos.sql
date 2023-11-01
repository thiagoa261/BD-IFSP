begin transaction
    delete from Peca where PePreco > 65

    if @@ERROR <> 0
        ROLLBACK TRANSACTION
    else
        COMMIT TRANSACTION



BEGIN TRANSACTION TRAN_01
    DELETE FROM TABELA1

    IF @@ERROR <> 0
        ROLLBACK TRANSACTION TRAN_01
    ELSE
        COMMIT TRANSACTION TRAN_01



SELECT 'Antes de BEGIN TRAN principal', @@TRANCOUNT

BEGIN TRAN main
	SELECT 'Depois do BEGIN TRAN principal', @@TRANCOUNT
	update fornecedor set FCateg = 'X' where FNro = 5
	SAVE TRAN Ponto1 
	SELECT 'Depois do SAVE TRAN Ponto1', @@TRANCOUNT
	
	BEGIN TRAN aninhada
		SELECT 'Depois do BEGIN TRAN aninhado', @@TRANCOUNT
		update Projeto set PDuracao = '4' where PNro = 5
		SAVE TRAN Ponto2 
		SELECT 'Depois do SAVE TRAN Projetos', @@TRANCOUNT
		ROLLBACK TRAN Ponto1
		
		SELECT 'Depois do ROLLBACK TRAN Fornecedores', @@TRANCOUNT