DECLARE CursorFornCateg CURSOR FOR
SELECT FNome, FCateg FROM Fornecedor
DECLARE @Nome varchar(30) 
DECLARE @Categ varchar(1)

OPEN CursorFornCateg
FETCH NEXT FROM CursorFornCateg INTO @Nome, @Categ

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @Categ = 'A' OR @Categ = 'B'
		BEGIN
		PRINT 'Execelente fornecedor: ' + @Nome + '-' + @Categ
		END
	ELSE
		BEGIN
		PRINT 'Fornecedor meia boca: ' + @Nome + '-' + @Categ
		END
	FETCH NEXT FROM CursorFornCateg INTO @Nome, @Categ
END

CLOSE CursorFornCateg
DEALLOCATE CursorFornCateg



DECLARE CursorProjetos CURSOR FOR
SELECT PNome, PCusto, PDuracao FROM Projeto
DECLARE @Nome varchar(30)
DECLARE @Custo float
DECLARE @Duracao varchar(15)

OPEN CursorProjetos
FETCH NEXT FROM CursorProjetos INTO @Nome, @Custo, @Duracao

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @Nome + ' ' + CAST(@Custo AS varchar(10)) + ' ' + @Duracao
	FETCH NEXT FROM CursorProjetos INTO @Nome, @Custo, @Duracao
END

CLOSE CursorProjetos
DEALLOCATE CursorProjetos



CREATE PROCEDURE Reajuste(@NumForn int, @Porcentagem float) AS
BEGIN
	DECLARE CursorReajuste CURSOR FOR
	SELECT DISTINCT Pe.PeNro FROM Peca Pe, Fornece_Para Fp
	WHERE Pe.PeNro = Fp.PeNro AND Fp.FNro = @NumForn
	DECLARE @PeNro int
	
	OPEN CursorReajuste
	FETCH NEXT FROM CursorReajuste INTO @PeNro
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Peca
		SET PePreco = PePreco + (PePreco*@Porcentagem/100)
		WHERE PeNro = @PeNro 
		SELECT * FROM Peca WHERE PeNro = @PeNro
	END
	
	CLOSE CursorReajuste
	DEALLOCATE CursorReajuste
END
--exec Reajuste 3, 25;
select * from Fornecedor;
select * from Peca;