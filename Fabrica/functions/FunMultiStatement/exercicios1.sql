CREATE FUNCTION fc_QtdPe�asFornecidas (@QtdPe int)
RETURNS @Pe�asFornecidas TABLE 
(
  PeNome varchar(15),
  PeCor varchar(15),
  Quant int
)
AS
BEGIN
  INSERT @Pe�asFornecidas
  SELECT p.PeNome, p.PeCor, fp.Quant
  FROM Peca p, Fornece_Para fp
  WHERE p.PeNro = fp.PeNro
  AND fp.Quant > @QtdPe
  RETURN
END
select * from fc_QtdPe�asFornecidas(2);


CREATE FUNCTION exe_1()
RETURNS @table TABLE 
(
  PeNome varchar(15),
  PNome varchar(15),
  FNome varchar(15)
) 
AS
BEGIN
  INSERT @table
  SELECT PE.PeNome, P.PNome, F.FNome
  FROM Peca PE, Projeto P, Fornecedor F, Fornece_Para FP
  WHERE FP.PeNro = PE.PeNro
  AND FP.PNro = P.PNro
  AND FP.FNro = F.FNro
  AND PE.PePreco > 20
  AND F.FCidade = 'S�o Paulo'
  RETURN
END