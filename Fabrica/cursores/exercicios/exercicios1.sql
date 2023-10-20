--Faça uma Stored Procedure com um cursor que receba todos os projetos que têm custo superior a R$ 25.000,00
--e selecione todos os nomes e categorias de fornecedores que fornecem para estes projetos.
CREATE PROCEDURE ExibeForns AS
BEGIN
    DECLARE CProjetosCaros CURSOR FOR
    SELECT PNro FROM Projeto WHERE PCusto > 25000
    DECLARE @NumProjeto int

    OPEN CProjetosCaros
    FETCH NEXT FROM CProjetosCaros INTO @NumProjeto

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT DISTINCT FNome, FCateg
        FROM Fornecedor F, Fornece_Para Fp
        where F.FNro = Fp.FNro
        and Fp.PNro = @NumProjeto
        FETCH NEXT FROM CProjetosCaros INTO @NumProjeto
    END

    CLOSE CProjetosCaros
    DEALLOCATE CProjetosCaros
END
--exec ExibeForns;



--Crie um Trigger que é disparado quando se atualiza uma categoria qualquer de Fornecedor,
--com um cursor que armazene os fornecedores que não são das categorias ‘A’, ‘B’ e ‘C’, e atualize suas categorias para ‘C'.
CREATE TRIGGER AtualizaForn ON Fornecedor
AFTER UPDATE AS IF UPDATE (FCateg)
    DECLARE CFornCateg CURSOR FOR
    SELECT FNro FROM Fornecedor WHERE FCateg NOT IN ('A', 'B', 'C')
    DECLARE @NumForn int

    OPEN CFornCateg
    FETCH NEXT FROM CFornCateg INTO @NumForn

    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE Fornecedor
        SET FCateg = 'C'
        WHERE FNro = @NumForn
        FETCH NEXT FROM CFornCateg INTO @NumForn
    END

    CLOSE CFornCateg
    DEALLOCATE CFornCateg



--Faça uma Stored Procedure que armazene em um cursor todos os códigos de projetos que têm fornecedores que são da categoria A ou B.
--Atualize todos os custos desses projetos de tais fornecedores em 10%.
CREATE PROCEDURE Atualiza_precoAB AS
BEGIN
    DECLARE CursorProj CURSOR FOR
    SELECT DISTINCT P.PNro FROM Fornece_Para Fp, Fornecedor F, Projeto P
    WHERE Fp.PNro = P.PNro and Fp.FNro = F.FNro and F.FCateg IN ('A', 'B')
    DECLARE @NumProj int

    OPEN CursorProj
    FETCH NEXT FROM CursorProj INTO @NumProj

    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE Projeto
        SET PCusto = PCusto * 1.1
        WHERE PNro = @NumProj
        FETCH NEXT FROM CursorProj INTO @NumProj
    END

    CLOSE CursorProj
    DEALLOCATE CursorProj
END
--exec Atualiza_precoAB;



--Faça uma Stored Procedure com um cursor que receba o código do fornecedor,
--selecionando todos os projetos nos quais este fornecedor possui fornecimento e aumente em 15% o custo de tais projetos.
CREATE PROCEDURE Atualiza_precoForn (@NumForn int) AS
BEGIN
    DECLARE CursorProje CURSOR FOR
    SELECT DISTINCT PNro FROM Fornece_Para Fp WHERE Fp.FNro = @NumForn
    DECLARE @NumProj int

    OPEN CursorProje
    FETCH NEXT FROM CursorProje INTO @NumProj

    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE Projeto
        SET PCusto = PCusto * 1.15
        WHERE PNro = @NumProj
        FETCH NEXT FROM CursorProje INTO @NumProj
    END

    CLOSE CursorProje
    DEALLOCATE CursorProje
END
--exec Atualiza_precoForn 1;