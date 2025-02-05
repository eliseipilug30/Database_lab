--Numarul de beneficiari din fiecare oras;
select Oras, count(CodB)
from Beneficiar
group by Oras
--Numarul de beneficiari din fiecare oras care au proprietatea ca au incheiat cel putin o tranzactie;
select Oras, count(*)
from Beneficiar,Tranzactii
where Tranzactii.CodB = Beneficiar.CodB
group by Oras 
having count (Tranzactii.CodB)>=1
--Numarul produsului si numarul de oferte pentru fiecare produs;
select Nume, count(*)
from Produs, Oferte
where Produs.CodP = Oferte.CodP
group by Nume
--Numele produsului impreuna cu pretul mediu si cantitatea totala oferita din acel produs;
select Nume ,avg(Pret),
sum (Oferte.Cantitate)
from Produs, Oferte
where Oferte.CodP = Produs.CodP
group by Produs.Nume
--Lista perechilor furnizor-beneficiar care au incheiat intre ei tranzactii si au sediul in acelasi oras;
select Furnizor.Nume, Beneficiar.Nume
from Furnizor,Tranzactii, Beneficiar
where Furnizor.CodF = Tranzactii.CodF
and Tranzactii.CodP = Tranzactii.CodP
and Furnizor.Oras = Beneficiar.Oras
group by Furnizor.Nume, Beneficiar.Nume
--Lista oraselor impreuna cu perechile furnizor-beneficiar care au incheiat intre ei tranzactii si au sediul in acelasi oras;
select  Beneficiar.Oras,Furnizor.Oras count(*)
from Beneficiar, Furnizor,Tranzactii 
where Furnizor.CodF = Tranzactii.CodF
and Tranzactii.CodB = Beneficiar.CodB
and Beneficiar.Oras = Furnizor.Oras 
group by Furnizor.Oras, Beneficiar.Oras