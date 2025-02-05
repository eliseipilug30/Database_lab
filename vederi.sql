--select * from Beneficiar
-- vedere ce afiseaza toti furnizorii din cluj
if exists(select Table_Name from INFORMATION_SCHEMA.VIEWS
where Table_Name = 'Furnizori_Cluj')
drop view Furnizori_Cluj 
go
create view Furnizori_Cluj as
select Nume_Furnior=Furnizor.Nume from Furnizor
where Furnizor.Oras='Paris'
go
select * from Furnizori_Cluj
--Sa se creeze o vedere care selecteaza toate ofertele care au un pret mai mare decat pretul mediu;
GO
IF EXISTS (SELECT  TABLE_NAME from INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'Oferte_pret')
DROP VIEW Oferte_pret
GO
CREATE VIEW Oferte_pret AS
	SELECT * FROM Oferte
		WHERE Oferte.Pret >(SELECT AVG(Oferte.Pret) From Oferte)
GO
SELECT * FROM Oferte_pret
--Numele furnizorilor si media valorilor ofertelor pentru fiecare furnizor.
IF EXISTS (SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME= 'Furnizor_si_oferte')
DROP VIEW Furnizor_si_oferte
GO
CREATE VIEW  Furnizor_si_oferte AS 
SELECT f.Nume AS Furnizor, AVG(o.Pret) AS Media_Oferte
FROM Furnizor f
JOIN Oferte o ON f.CodF = o.CodF
GROUP BY f.Nume
GO
SELECT * FROM Furnizor_si_oferte
GO
--Numele beneficiarilor din Vienna care au cumparat biciclete, dar nu au cumparat telefoane.

IF EXISTS (SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME= 'Beneficiar_Vienna')
DROP VIEW Beneficiar_Vienna
GO
CREATE VIEW Beneficiar_Vienna AS
SELECT b.Nume
FROM Beneficiar b
JOIN Cerere c ON b.CodB = c.CodB
JOIN Produs p ON c.CodP = p.CodP
WHERE b.Oras = 'Vienna'
AND p.Nume = 'BICICLETA'
AND b.CodB NOT IN (
  SELECT b.CodB
  FROM Beneficiar b
  JOIN Cerere c ON b.CodB = c.CodB
  JOIN Produs p ON c.CodP = p.CodP
  WHERE b.Oras = 'Vienna'
  AND p.Nume = 'TELEFON'
)
GO
SELECT * FROM Beneficiar_Vienna
GO
