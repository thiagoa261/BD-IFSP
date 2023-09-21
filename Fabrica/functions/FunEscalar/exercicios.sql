DECLARE @ProjetosComCustoAlto TABLE
(
    Numero int,
    Nome varchar(30),
    Duracao varchar(15)
)

INSERT INTO @ProjetosComCustoAlto (Numero, Nome, Duracao)
SELECT PNro, PNome, PDuracao
FROM Projeto
WHERE PCusto > 20000

SELECT * FROM @ProjetosComCustoAlto
WHERE Duracao >= 2



CREATE FUNCTION CalcularDelta
(
    @A float,
    @B float,
    @C float
)
RETURNS float
AS
BEGIN
    DECLARE @Delta float
    SET @Delta = (@B * @B) - (4 * @A * @C)
    RETURN @Delta
END
--select dbo.CalcularDelta(2, 4, 2) as Delta;
--select dbo.CalcularDelta(2, 5, 2) as Delta;



CREATE PROCEDURE CalcularRaiz
(
    @A float,
    @B float,
    @C float
)
AS
BEGIN
    DECLARE @Delta float
    SET @Delta = dbo.CalcularDelta(@A, @B, @C)

    IF @Delta < 0
    BEGIN
        PRINT 'Não existem raízes reais.'
    END

    ELSE IF @Delta = 0
    BEGIN
        DECLARE @Raiz float
        SET @Raiz = -@B / (2 * @A)
        PRINT 'x = ' + CAST(@Raiz AS varchar(30))
    END

    ELSE
    BEGIN
        DECLARE @Raiz1 float
        DECLARE @Raiz2 float
        SET @Raiz1 = (-@B + SQRT(@Delta)) / (2 * @A)
        SET @Raiz2 = (-@B - SQRT(@Delta)) / (2 * @A)
        PRINT 'x1 = ' + CAST(@Raiz1 AS varchar(30))
        PRINT 'x2 = ' + CAST(@Raiz2 AS varchar(30))
    END
END
--CalcularRaiz 5, 1, 5
--CalcularRaiz 2, 4, 2
--CalcularRaiz 2, 5, 2



CREATE FUNCTION ReajustarPrecoPeca
(
    @PrecoAtual float,
    @PorcentagemReajuste float
)
RETURNS float
AS
BEGIN
    DECLARE @NovoPreco float
    SET @NovoPreco = @PrecoAtual + (@PrecoAtual * @PorcentagemReajuste / 100)
    RETURN @NovoPreco
END
select dbo.ReajustarPrecoPeca((SELECT PePreco FROM Peca WHERE PeNro = 1), 50) as NovoPreco
--select * from Peca where PeNro = 1