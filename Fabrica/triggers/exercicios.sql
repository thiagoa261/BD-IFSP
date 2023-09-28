CREATE TRIGGER TriggerExercicio1
ON Peca
AFTER INSERT
AS
BEGIN
    UPDATE Peca
    SET PeCor = 'Azul'
    WHERE PeCor = 'Amarelo' AND PeNro IN (SELECT PeNro FROM inserted);
END;

CREATE TRIGGER TriggerExercicio2
ON Peca
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Peca
    SET PePreco = 50
    WHERE Peca.PeNro = deleted.PeNro;
END;

CREATE TRIGGER TriggerExercicio3
ON Peca
AFTER UPDATE
AS
BEGIN
    UPDATE Peca
    SET Peca.PeCor = 'Amarelo'
    FROM Peca, inserted
    WHERE Peca.PeNro = inserted.PeNro AND Peca.PeNome <> inserted.PeNome;
END;

CREATE TRIGGER TriggerExercicio4
ON Peca
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO Peca (PeNro, PeNome, PePreco, PeCor)
    SELECT PeNro, PeNome, PePreco, 'Roxo'
    FROM inserted;
END;