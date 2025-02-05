--Trigger la inserare (update) pe tabela Furnizori: sa nu se poata insera furnizori din Paris
if exists (select name from sysobjects
where name='inserare_furnizor' and type ='TR')
drop trigger inserare_furnizor
go
create trigger inserare_furnizor
on Furnizor
for insert,update as 
if exists(select Oras from Furnizor 
where Oras not in  ('Paris'))
begin 
raiserror ('Nu se pot insera furnizorii din Paris',16,1)
rollback transaction 
end 
else
print 'Furnizor inserat cu succes '
go
update Furnizor set Oras='Timisoara' where 
Furnizor.CodF=1
