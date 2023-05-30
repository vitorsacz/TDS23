USE AdventureWorks2012;

select * from person.Person


--Testando a TAG UPPER e LOWER, mostrando o texto em caixa alta e caixa baixa, respectivamente.
select FirstName, UPPER(FirstName), LastName, LOWER(LastName) from person.person

--TAG LEN (LENGHT), que mostra o tamanho dos itens.

select FirstName, len(FirstName) from Person.Person
where len(FirstName) <= 2


-- TAG substring
select FirstName, SUBSTRING(FirstName, 2, 1) from Person.Person

-- tratamento de erro gramatical no brasil
select FirstName, SUBSTRING(FirstName, 2, 1) from Person.Person
WHERE SUBSTRING(FirstName,2,1) = '.'

-- usando a TAG REPLACE
select ProductNumber, REPLACE(ProductNumber,'-', '-2023-') from Production.Product


-- CRIANDO UMA VIEW

select FirstName,MiddleName, LastName from Person.Person

--view
CREATE OR ALTER VIEW NOMES AS
select FirstName, MiddleName, LastName
from Person.Person
where title = 'Ms.'

select * from nomes
order by 3 desc

CREATE OR ALTER VIEW EMAIL AS 
select p.BusinessEntityID AS 'ID', P.FirstName AS 'NOME', E.EmailAddress AS 'EMAIL' from Person.Person P
INNER JOIN Person.EmailAddress E
on P.BusinessEntityID = E.BusinessEntityID

SELECT * FROM EMAIL

-- USANDO GAMBI COM A VIEW 
SELECT PERSON.Person.*, EMAIL.* FROM PERSON.Person, EMAIL
WHERE person.Person.BusinessEntityID = EMAIL.ID


DROP VIEW NOMES

SELECT * FROM NOMES

