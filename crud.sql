update Oferte
set Pret=Pret*0.9
from Oferte, Produs
where  (select count(CodP) from Produs where Oferte.CodP=Produs.CodP) >= 2;


delete from Oferte
--from Oferte, Tranzactii
where Oferte.CodF 
not in (select Tranzactii.CodF from Tranzactii)