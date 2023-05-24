SELECT * FROM PERSON.Person;

/*
AND - E 
OR - OU 
NOT - acompanhado

= igual
> menor
< maior 
<> diferente
*/

select * from Person.PERSON 
where businessentityid = 5 
OR businessentityid = 11
OR businessentityid = 23;

select * from Person.PERSON 
where businessentityid = 5 
OR businessentityid = 111
OR businessentityid = 23;

select FirstName from Person.PERSON 
where businessentityid = 5 
OR businessentityid = 111
OR businessentityid = 23;

SELECT * FROM Production.Product
where weight > '500' 
and weight <= '700';

SELECT * FROM Production.Product
where weight > '500' 
or weight <= '700';


select * from HumanResources.Employee
where MaritalStatus = 'M'
and SalariedFlag = 1;

select * from HumanResources.Employee
where MaritalStatus = 'M'
and SalariedFlag = 1
and BirthDate <= '1983'

select * from HumanResources.Employee
where MaritalStatus = 'M'
and SalariedFlag = 1
and BirthDate <= '1983/01/01'


select * from Person.PERSON 
where FirstName = 'Peter'
and LastName = 'Krebs'


select * from Person.EmailAddress
where BusinessEntityID = '26'

--Pegando o nome, last name e o email da person, informações de várias tabelas em um unico select 
Select Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress 
From Person.Person, Person.EmailAddress
WHERE person.BusinessEntityID = EmailAddress.BusinessEntityID
and person.BusinessEntityID = 26

select COUNT(*) as qtd_produtos from Production.Product

select * from Production.Product
select distinct name from Production.Product

Select count(title) from person.person
where title = 'Ms.'
Select distinct title from person.person

Select * from Production.Product
where ListPrice >= 1000
and ListPrice <= 1500

Select ListPrice from Production.Product
where ListPrice >= 1000
and ListPrice <= 1500


--usando a tag between para pegar uma faixa entre dois valores
Select ListPrice from Production.Product
where ListPrice between 1000 and 1500

select count(*) from HumanResources.Employee
where HireDate between '2009/01/01' and '2010/01/01'


-- forma de trazer com or tres itens diferentes
select * from person.person
where BusinessEntityID = 5
or BusinessEntityID = 111
or BusinessEntityID = 23
--usando a tag in para trazer o resultado
select * from person.person
where BusinessEntityID in (5,111,23)

--usando a tag like para pesquisa
select * from person.person
where FirstName like 'Ro%'

--usando a tag like com underline(_) para saber quantas caracteres voce precisa na pesquisa
select * from person.person
where FirstName like 'R__';

--quantos produtos temos no bd acima de 1500 dolares(preco)
select count(8) as qtd_de_produtos from Production.Product
where ListPrice > 1500;

-- quantas pessoas tem o sobrenome que comeca com a letra p 
select count(*) as 'Pessoas coma letra P' from person.Person
where LastName like 'P%';

-- em quantas cidades unicas estao as pessoas/clientes
select count(distinct city) from person.Address



