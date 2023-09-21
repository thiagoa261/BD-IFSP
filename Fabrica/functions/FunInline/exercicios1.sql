CREATE FUNCTION exercicio01(@projetoID int)
RETURNS TABLE
AS
RETURN (
    SELECT PE.PeNome, PE.PePreco
    FROM Peca PE, Fornece_Para Fp
    WHERE PE.PeNro = FP.PeNro
    AND PE.PePreco < 20
    AND FP.PNro = @projetoID
);
--SELECT * FROM exercicio01(4);


CREATE FUNCTION exercicio02(@pecaID int, @projetoID int)
RETURNS TABLE
AS
RETURN (
    SELECT P.PNome AS NomeProjeto, PE.PeNome AS NomePeca, FP.Quant
    FROM Projeto P, Fornece_Para FP, Peca PE
    WHERE FP.PNro = P.PNro
    AND FP.PeNro = PE.PeNro
    AND FP.PeNro = @pecaID
    AND FP.PNro = @projetoID
);
--SELECT * FROM exercicio02(2, 3);


CREATE FUNCTION exercicio03(@fornecedorID int)
RETURNS TABLE
AS
RETURN (
    SELECT PE.PeNome
    FROM Peca PE, Fornece_Para FP, Projeto P
    WHERE FP.PeNro = PE.PeNro
    AND FP.PNro = P.PNro
    AND PE.PePreco > 20
    AND P.PDuracao <= 4
    AND FP.FNro = @fornecedorID    
);
--SELECT * FROM exercicio03(5); 
