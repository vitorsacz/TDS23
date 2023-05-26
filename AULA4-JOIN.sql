-- AULA 4 JOIN

CREATE DATABASE AULAJOIN;

USE AULAJOIN;

CREATE TABLE TabelaA(
Id int,
NOME varchar(10)
);

CREATE TABLE TabelaB(
Id int,
Nome varchar(10)
);


-- Inserindo valores na tabela A
insert into TabelaA (ID, NOME)
VALUES ('1', 'Robo');

insert into TabelaA (ID, NOME)
VALUES ('2', 'Macaco');

insert into TabelaA (ID, NOME)
VALUES ('3','Samurai');

insert into TabelaA (ID, NOME)
VALUES ('4', 'Monitor');


-- Inserindo valores na tabela B
insert into TabelaB (ID, NOME)
VALUES ('1', 'Espada');

insert into TabelaB (ID, NOME)
VALUES ('2', 'Robo');

insert into TabelaB (ID, NOME)
VALUES ('3', 'Mario');

insert into TabelaB (ID, NOME)
VALUES ('4', 'Samurai');


select * from TabelaA
select * from TabelaB


-- testando o INNER join
select * from TabelaA A
INNER JOIN TabelaB B
On A.nome = B.nome


-- testando o FULL OUTER join
select * from TabelaA A
FULL OUTER JOIN TabelaB B
On A.nome = B.nome



-- testando o LEFT join
select * from TabelaA A
LEFT JOIN TabelaB B
On A.nome = B.nome


-- testando o LEFT join, pegando os nomes que estao em B e noa estao em A
select * from TabelaA A
LEFT JOIN TabelaB B
On A.nome = B.nome
where b.nome is null


-- testando o RIGHT join
select * from TabelaA A
RIGHT JOIN TabelaB B
On A.nome = B.nome



-- testando o RIGHT join pegando os nomes que estao em A e noa estao em B
select * from TabelaA A
RIGHT JOIN TabelaB B
On A.nome = B.nome
where A.nome is null







USE AdventureWorks2012;


--usando o UNION. 
--Unindo dois selects como uma lista só
Select ProductID, name, ProductNumber from Production.Product
where name like '%chai%'
UNION
Select ProductID, name, ProductNumber from Production.Product
where name like '%decal%'
order by name desc



/*
PERSON.PERSON
ID,FIRSTNAME, LASTNAME, EMAIL
*/

--pegando dados das pessoas + email + o trabalho delas
select p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress, rh.JobTitle
from person.Person P
INNER JOIN Person.EmailAddress PE
ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN HumanResources.Employee RH
ON p.BusinessEntityID = RH.BusinessEntityID
where rh.JobTitle like '%desi%'


-- NOME DOS PRODUTOS E AS INFORMAÇÕES DE SUBCATEGORIA
-- LISTPRICE, NAME, NOME SUBCATEGORIA.


select * from Production.Product
select * from Production.ProductSubcategory


select P.ListPrice, P.Name, SC.name 
from Production.Product P
inner join Production.ProductSubcategory SC
ON P.ProductSubCategoryID = SC.ProductSubCategoryID


-- trazer o cliente id, tipo de telefone, id do telefone, numero do telefone
select * from person.Person
select * from Person.PhoneNumberType
select * from Person.PersonPhone


select PN.FIRSTNAME AS 'NOME' ,PP.BusinessEntityID AS 'ID PESSOA', NT.Name AS 'TIPO DE TELEFONE', PP.PhoneNumberTypeID AS 'ID DO TIPO', PP.PhoneNumber AS 'NUMERO DE TELEFONE' 
from Person.PersonPhone PP
INNER JOIN Person.PhoneNumberType NT
ON PP.PhoneNumberTypeID = NT.PhoneNumberTypeID
INNER JOIN Person.Person PN
ON PP.BusinessEntityID = PN.BusinessEntityID



use adventureworks2012;

select * from Person.Person
select * from Person.EmailAddress
select * from Sales.PersonCreditCard


-- pegando 




-- pessoas que TEM cartao de credito registrado
-- Id da pessoa, firstname , email, creditcardid
select P.BusinessEntityID as 'id pessoa', P.FirstName as 'primeiro nome', pe.EmailAddress as 'email',  cc.CreditCardID as 'id cartão'
from Person.Person P
INNER JOIN Sales.PersonCreditCard CC
ON P.BusinessEntityID = CC.BusinessEntityID
inner join person.EmailAddress PE
on p.BusinessEntityID = pe.BusinessEntityID



-- pessoas que NÃO TEM cartao de credito registrado
-- Id da pessoa, firstname , email, creditcardid

select P.BusinessEntityID as 'id pessoa', P.FirstName as 'primeiro nome', pe.EmailAddress  as 'email', cc.CreditCardID as 'id cartão'
from Person.Person P
left JOIN Sales.PersonCreditCard CC
ON P.BusinessEntityID = CC.BusinessEntityID
inner join Person.EmailAddress PE
on p.BusinessEntityID = pe.BusinessEntityID
where cc.CreditCardID is null



select * from Production.Product order by ListPrice desc




--TESTANDO SUB SELECT


select AVG(listprice) from Production.Product

select Productid, ListPrice  from Production.Product
where ListPrice > (select avg(ListPrice) from Production.Product)

-- nome dos funcionarios que sao desgin engenieers

select FirstName,  from person.person 


select * from HumanResources.Employee HE
where JobTitle = 'design engineer'

select FirstName from person.person
where BusinessEntityID in (5,6,15)




SELECT P.FirstName FROM PERSON.PERSON P
INNER JOIN HumanResources.Employee HE
ON P.BusinessEntityID = HE.BusinessEntityID
WHERE HE.JobTitle = 'DESIGN ENGINEER'



SELECT FirstName FROM Person.Person
WHERE BusinessEntityID IN (select BusinessEntityID from HumanResources.Employee HE
where JobTitle = 'design engineer')