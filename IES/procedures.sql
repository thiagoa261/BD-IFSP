CREATE PROCEDURE InserirIES
    @IES_nome varchar(40)
AS
BEGIN
    INSERT INTO IES (IES_nome)
    VALUES (@IES_nome)
END
--exec InserirIES 'IES';
--select * from IES;


CREATE PROCEDURE ExcluirIES
    @IES_codigo int
AS
BEGIN
    DELETE FROM IES
    WHERE IES_codigo = @IES_codigo
END
--exec ExcluirIES 3;
--select * from IES;


CREATE PROCEDURE AtualizarNomeIES
    @IES_codigo int,
    @NovoNome varchar(40)
AS
BEGIN
    UPDATE IES
    SET IES_nome = @NovoNome
    WHERE IES_codigo = @IES_codigo
END
--exec ExcluirIES 1, 'UFMJ';
--select * from IES;


CREATE PROCEDURE MostrarInformacoesCliente
    @Pes_codigo int
AS
BEGIN
    SELECT C.Pes_codigo, P.Pes_nome, C.Cli_cpf, C.Cli_email
    FROM Clientes C, Pessoas P
    WHERE C.Pes_codigo = @Pes_codigo
    and C.Pes_codigo = P.Pes_codigo
END
--exec MostrarInformacoesCliente 2;


CREATE PROCEDURE MostrarEstagiarios
AS
BEGIN
	SELECT E.Pes_codigo, P.Pes_nome, E.Est_data, E.IES_codigo, I.IES_nome
	FROM Estagiarios E, Pessoas P, IES I
	where E.Pes_codigo = P.Pes_codigo
	and E.IES_codigo = I.IES_codigo
END
--exec MostrarEstagiarios;


CREATE PROCEDURE MostrarInformacoesPorCodigo
    @Pes_codigo int
AS
BEGIN
    SELECT E.Pes_codigo, P.Pes_nome, E.Est_data, E.IES_codigo, I.IES_nome
	FROM Estagiarios E, Pessoas P, IES I
	where E.Pes_codigo = @Pes_codigo
	and E.Pes_codigo = P.Pes_codigo
	and E.IES_codigo = I.IES_codigo
END
--exec MostrarInformacoesPorCodigo 6;