Declare @tabela Table (
PeNro int primary key, Penome varchar(30)
)

Insert into @tabela
select distinct PeNro, Penome
from Peca where PeNome like 'L%'

Select * from @tabela