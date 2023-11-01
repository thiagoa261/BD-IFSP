--Crie um cursor para a tabela “Fornecedor”. Armazene nesse cursor o nome do fornecedor, bem como a categoria do mesmo.
--Para os fornecedores das Categorias “A” e “B”, mostre os nomes do fornecedor juntamente com o texto “Excelentes Fornecedores”.
--Caso contrário, imprima os nomes do fornecedor juntamente com o texto “Fornecedores Meia Boca”.
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



--Utilizando cursores, realize uma consulta que retorne todos os nomes de  Projetos e seus respectivos custos e durações e mostre somente esses dados.
DECLARE CursorProjetos CURSOR FOR
SELECT PNome, PCusto, PDuracao FROM Projeto
DECLARE @Nome varchar(30)
DECLARE @Custo float
DECLARE @Duracao varchar(15)

OPEN CursorProjetos
FETCH NEXT FROM CursorProjetos INTO @Nome, @Custo, @Duracao

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Nome do Projeto: ' + @Nome + ', Custo: ' + CAST(@Custo AS VARCHAR) + ', Duração: ' + @Duracao;
    FETCH NEXT FROM CursorProjetos INTO @Nome, @Custo, @Duracao
END

CLOSE CursorProjetos
DEALLOCATE CursorProjetos



--Realize uma consulta que retorne em um cursor o número de todas as peças que são fornecidas para um fornecedor,
--sendo que o fornecedor é selecionado através da passagem de um parâmetro, juntamente com uma porcentagem para reajuste das peças selecionadas,
--que serão reajustadas uma a uma com tal porcentagem.
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
        FETCH NEXT FROM CursorReajuste INTO @PeNro
    END

    CLOSE CursorReajuste
    DEALLOCATE CursorReajuste
END
--exec Reajuste 3, 25;
select * from Fornecedor;
select * from Peca;