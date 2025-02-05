IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'inserat_furnizor' AND type = 'TR')
DROP TRIGGER inserat_furnizor
GO
CREATE TRIGGER inserat_furnizor
ON Furnizor
FOR INSERT AS
PRINT 'Furnizor inserat cu succes!'
GO 

--Trigger la inserare (update) pe tabela Furnizori: sa nu se poata insera furnizori care nu sunt  din Cluj 

IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'insereare_furnizor_nu_cluj' AND type = 'TR')
DROP TRIGGER insereare_furnizor_nu_cluj
GO
CREATE TRIGGER insereare_furnizor_nu_cluj
ON Furnizor
FOR INSERT, UPDATE AS
IF EXISTS (SELECT Furnizor.Oras FROM Furnizor
	WHERE Furnizor.Oras<>'Paris')
BEGIN
	RAISERROR('Nu se pot adauga furnizori din acest oras',16,1)
	ROLLBACK TRANSACTION
END
PRINT 'Furnizor inserat cu succes!'
GO 


UPDATE Furnizor
SET Oras = 'Area'
WHERE CodF = 1


UPDATE Furnizor
SET Furnizor.Nume = 'eMAG'
WHERE Furnizor.Oras ='Bucuresti'

IF EXISTS (SELECT name FROM sysobjects
       WHERE name='inserat_furnizorcluj' AND type='TR')
	   DROP TRIGGER inserat_furnizorcluj
	   GO
	   CREATE TRIGGER inserat_furnizorcluj
	   ON Furnizor
	   FOR INSERT, UPDATE  AS
	   IF EXISTS(SELECT Furnizor.Oras FROM Furnizor, inserted 
	        WHERE Furnizor.Oras='Paris')
			where Furnizor.CodF=inserted.CodF
			BEGIN
			   RAISERROR ('Nu se poate', 16,1)
			   ROLLBACK TRANSACTION
			   END
			   ELSE
	   PRINT 'Furnizor inserat cu succes'
	   GO

	   UPDATE Furnizor
	   SET Oras='Vatra Dornei'
	   WHERE CodF=2

