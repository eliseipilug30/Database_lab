--Orasele furnizorilor al caror nume incepe cu litera 'A';
Select Oras FROM Furnizor 
WHERE Nume LIKE 'C%'
--Numele furnizorilor din Cluj-Napoca care vand automobile;
select Nume from Furnizor
where Oras = 'Paris' and Furnizor.CodF = (select CodF from Oferte where CodP = (select CodP from Produs where Nume ='MINGE'))
--Numele beneficiarilor din Bucuresti ordonate alfabetic;
select Nume from Beneficiar where Oras = 'Vienna'
order by Nume
--Numele beneficiarilor, orasele lor si produsele cerute de fiecare beneficiar;
select Beneficiar.Nume, Oras, Produs.Nume  from Beneficiar, Produs, Cerere
where Beneficiar.CodB =Cerere.CodB and Cerere.CodP = Produs.CodP
--Numele furnizorilor din Cluj si numele beneficiarilor din Bucuresti care au incheiat intre ei tranzactii, numele produsului tranzactionat,cantitatea,
--pretul si data tranzactiei;Ordonare dupa: numele furnizorului, apoi numele beneficiarului, apoi produs, apoi pret;
select Furnizor.Nume, Beneficiar.Nume, Produs.Nume, Tranzactii.Cantitate, Tranzactii.Pret from Furnizor, Beneficiar, Tranzactii, Produs
where Furnizor.Oras = 'Bucuresti' and Beneficiar.Oras = 'Cluj'
and Furnizor.CodF = Tranzactii.CodF and Beneficiar.CodB = Tranzactii.CodB and Produs.CodP = Tranzactii.CodP
order by Furnizor.Nume, Beneficiar.Nume
--Numele furnizorilor din Bucuresti si numarul de oferte de calculatoare pentru fiecare furnizor;
select Furnizor.Nume from Furnizor
where Furnizor.Oras = 'Bucuresti'
