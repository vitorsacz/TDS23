-- 

use AdventureWorks2012;


-- selecione da person person, o firstname title, middle name todo mundo que tem mr. e tambem dodo que possuem middle a

select FirstName, MiddleName, title from Person.Person
where title = 'Mr.'
and MiddleName Is Not null 
UNION
select FirstName, MiddleName, title from Person.Person
where MiddleName = 'a'
and title is not null 
ORDER BY FirstName asc



-- Testando SELF join
select * from HumanResources.Employee



-- MOSTR A MEDIA MENSAL DE VALORES VENDIDOS 
-- SALES.SALESORDERHEADER

select * from Sales.SalesOrderHeader 

select avg(TotalDue) as 'media mensal', DATEPART(MONTH, OrderDate) as 'mês' from Sales.SalesOrderHeader as SO
group by DATEPART(MONTH, OrderDate)
order by 2 desc; -- o 2 era organizando o segundo campo do select, que neste caso está puxando o mes 

select avg(TotalDue) as 'media ANUAL', DATEPART(YEAR, OrderDate) as 'ANO' from Sales.SalesOrderHeader as SO
group by DATEPART(YEAR, OrderDate)
order by 2 desc;


-- QUAIS SÃO OS PRODUTOS QUE ESTÃO ACIMA DA MÉDIA DE VENDAS
-- production.product - ID, LISTPRICE
-- production.subcategory


select ProductID, ListPrice from Production.Product
where ListPrice > (select avg(ListPrice) from Production.Product)
order by ListPrice;


-- QUAIS SÃO OS PRODUTOS QUE ESTÃO ABAIXO DA MÉDIA DE VENDAS
select ProductID, ListPrice from Production.Product
where ListPrice > (select avg(ListPrice) from Production.Product)
order by 2;



