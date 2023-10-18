CREATE PROCEDURE Atualiza_preço (@NumForn as int) AS
Begin
	DECLARE CursorPreco CURSOR FOR
	SELECT Distinct PeNro FROM fornece_para WHERE FNro = @NumForn
	DECLARE @NumPeca as int

	OPEN CursorPreco
	FETCH NEXT FROM CursorPreco INTO @NumPeca

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Peca
		Set PePreco = PePreco * 1.1
		WHERE PeNro = @NumPeca
		FETCH NEXT FROM CursorPreco INTO @NumPeca
	END

	CLOSE CursorPreco
	DEALLOCATE CursorPreco
end
exec Atualiza_preço 2;