CREATE FUNCTION Exercicio_01()
RETURNS @tab TABLE (
    PeNome varchar(15),
    FNome varchar(30),
    PNome varchar(30)
)
AS
BEGIN
  INSERT @tab
  SELECT Pe.PeNome, F.FNome, P.PNome
    FROM Peca Pe, Fornecedor F, Projeto P, Fornece_Para FP
    WHERE Pe.PeNro = FP.PeNro
    AND F.FNro = FP.FNro
    AND P.PNro = FP.PNro
    AND Pe.PePreco > 20
    AND F.FCidade = 'São Paulo'
    AND P.PDuracao > '2'
  RETURN
END
-- Chamada à função
SELECT * FROM Exercicio1_01();


CREATE FUNCTION Exercicio_02()
RETURNS @tab TABLE (
    PNome varchar(30),
    FNome varchar(30)
)
AS
BEGIN
  INSERT @tab
    SELECT P.PNome, F.FNome
    FROM Projeto P, Fornecedor F, Fornece_Para FP
    WHERE P.PNro = FP.PNro
    AND F.FNro = FP.FNro
    AND F.FCidade = 'Campinas'
  RETURN
END
-- Chamada à função
SELECT * FROM Exercicio_02();


CREATE FUNCTION Exercicio_03()
RETURNS @tab TABLE (
    PNome varchar(30),
    PeNome varchar(15)
)
AS
BEGIN
  INSERT @tab
    SELECT P.PNome, Pe.PeNome
    FROM Projeto P, Peca Pe, Fornece_Para FP, Fornecedor F
    WHERE P.PNro = FP.PNro
    AND Pe.PeNro = FP.PeNro
    AND F.FCateg <> 'B'
    AND NOT EXISTS (
        SELECT *
        FROM Fornece_Para FP2, Fornecedor F2
        WHERE P.PNro = FP2.PNro
        AND Pe.PeNro = FP2.PeNro
        AND F2.FNro = FP2.FNro
        AND F2.FCateg = 'B'
    )
    RETURN;
END
-- Chamada à função
SELECT * FROM Exercicio_03();


CREATE FUNCTION Exercicio_04(@quantidade int, @codigo_peca int)
RETURNS @tab TABLE (
    PNome varchar(30),
    FNome varchar(30)
)
AS
BEGIN
  INSERT @tab
    SELECT P.PNome, F.FNome
    FROM Projeto P, Peca Pe, Fornece_Para FP, Fornecedor F
    WHERE P.PNro = FP.PNro
    AND Pe.PeNro = FP.PeNro
    AND F.FNro = FP.FNro
    AND Pe.PeNro = @codigo_peca
    AND FP.Quant < @quantidade
  RETURN
END
-- Chamada à função
SELECT * FROM Exercicio_04(3, 1);