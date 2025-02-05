--Procedura stocata de inserare in tabela Oferte, cu urmatorii parametri: nume furnizor, nume produs, cantitate, pret. 
IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'tab_oferte' AND type = 'P')
	DROP PROCEDURE tab_oferte
GO
CREATE PROCEDURE 
	tab_oferte(@Cod_Furnizor int, @Cod_Produs int, @Cantitate int, @Pret int)
	AS
	INSERT INTO Oferte
	VALUES (@Cod_Furnizor, @Cod_Produs, @Cantitate, @Pret)
	GO
EXECUTE tab_oferte 2,1,100,3

--Procedura de actualizare (update) pe Cereri: sa se scada cu 25% pretul pentru produsul al carui nume este dat ca parametru. 
IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'act_cereri' AND type = 'P')
	DROP PROCEDURE act_cereri
GO
CREATE PROCEDURE 
	act_cereri(@Cod_Produs int)
	AS
	UPDATE Cerere SET Pret=0.75*Pret
	WHERE Cerere.CodP = @Cod_Produs
	GO
	EXECUTE act_cereri 1
	GO
	SELECT * FROM Cerere
