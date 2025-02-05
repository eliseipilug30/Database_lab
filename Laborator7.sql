
--a.Lista beneficiarilor impreuna cu numarul de cereri al fiecarui beneficiar(pentru beneficiarii
--fara oferte se va trece 0 la numarul de cereri)?
SELECT Beneficiar.Nume, COUNT(Cerere.CodB) FROM Beneficiar LEFT JOIN Cerere ON
Beneficiar.CodB=Cerere.CodB
GROUP BY Nume
--b.Numele produsului si numarul de oferte, respectiv cereri pentru ficare produs(pentru
--produsele fara oferte se va trece 0  la numarul de oferte, iar la cele fara cereri se 
--va trece 0 la numarul de cereri.
SELECT Produs.Nume, 'Nr oferte'=COUNT(Oferte.CodP), 'Nr cereri'=COUNT (Cerere.CodP) FROM Produs LEFT JOIN Cerere 
ON  Produs.CodP=Cerere.CodP LEFT JOIN Oferte ON Produs.CodP=Oferte.CodP 
GROUP BY Nume
--c.Numele produsului si media valorilor ofertelor, cererilor si tranzactiilor pentru fiecare 
--produs (in lispa de oferte, cereri sau tranzactii se va trece 0 pentru media respectiva)
SELECT Produs.Nume, 'Media ofertelor'=AVG(Oferte.CodP), 'Media cererilor'=AVG(Cerere.CodP),
'Media tranzactiilor'=AVG(Tranzactii.CodP) FROM Produs LEFT JOIN Oferte ON Produs.CodP=Oferte.CodP LEFT JOIN
Cerere ON Produs.CodP=Cerere.CodP RIGHT JOIN Tranzactii ON Produs.CodP=Tranzactii.CodP
GROUP BY Nume
--d.Lista prechilor oras_furnizor, oras_beneficiar si numarul de perechi furnizor_beneficiar
--din orasele respective si care au incheiat intre ei cel putin o tranzactie(se va trece 0
--in lipsa)
SELECT Furnizor.Oras, Beneficiar.Oras, 'Nr perechi'=COUNT(ISNULL(Tranzactii.CodT,0)) FROM
Furnizor LEFT JOIN Tranzactii ON Furnizor.CodF=Tranzactii.CodF LEFT JOIN Beneficiar ON 
Tranzactii.CodB=Beneficiar.CodB
GROUP BY Furnizor.Oras, Beneficiar.Oras
