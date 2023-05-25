USE AdventureWorks2012;


-- quantos produtos vermelhos tem preco entre 500 e 1000


Select count(*) as produtos_vermelhos from Production.Product
where ListPrice between 500 and 1000
AND color = 'red';


-- PRODUTOS QUE POSSUEM ESSA SEQUENCIA DE CARACTERES 'ROAD'
-- % é um caracter coringa


-- quais 
select * from Production.Product
where name like '%road%';


-- quantos diferentes
select count(distinct name) from Production.Product
where name like '%road%';


-- pegando os top 10 sales orders details
select top 10 * from Sales.SalesOrderDetail 


-- pegando os top 10 de baixo pra cima, utilizando o order by 
select top 10 * from Sales.SalesOrderDetail
order by LineTotal asc


-- pegando os top 10 de cima pra baixo, utilizando o order by 
select top 10 * from Sales.SalesOrderDetail
order by LineTotal desc


-- somando todos os valores dos produtos
select SUM(LineTotal) as TOTALVENDAS from Sales.SalesOrderDetail 


-- maior numero na coluna
SELECT MAX(linetotal) as TOTALVENDAS from sales.SalesOrderDetail


-- maior numero na coluna
SELECT MIN(linetotal) as TOTALVENDAS from sales.SalesOrderDetail


-- MÉDIA GERAL DAS VENDAS
SELECT AVG(linetotal) as TOTALVENDAS from sales.SalesOrderDetail


--contando quantos nomes iguais aparecem 
SELECT FirstName, count(FirstName) as qtd_de_nomes FROM Person.Person
group by FirstName;


-- mostrando o quais ofertas e o vlaor gerado por cada um delas (ordenando pelo apelido do sum )
SELECT SpecialOfferID, sum(UnitPrice) as qtd_vendas FROM Sales.SalesOrderDetail
group by SpecialOfferID
order by qtd_vendas asc;

select ProductID, count(OrderQty) as qtd_vendas from Sales.SalesOrderDetail
group by ProductID;

-- media do preco dos produto da cor prata
Select color, avg(ListPrice) from Production.Product
where color = 'silver'
group by color;



--
SELECT MiddleName, count(MiddleName)as qtd from person.person
group by MiddleName
order by MiddleName;






-- mostrando o quais ofertas e o vlaor gerado por cada um delas (ordenando pelo sum )
SELECT SpecialOfferID, sum(UnitPrice) as qtd_vendas FROM Sales.SalesOrderDetail
group by SpecialOfferID
order by sum(UnitPrice) desc;

-- geralmente o campo que eu mostro eu agrupo. E geralmente o campo que eu agregado eu nao mostro





/*DESAFIOS
1- QUAL A MEDIA QUE CADA PRODUTO É VENDIDO 
2- QUAIS OS 10 PRODUTOS QUE NO TOTAL TIVERAM OS MAIORES VALORES 
DE VENDA AGRUPADOS POR PRODUTO DO MAIOR PARA O MENOR
3- QUANTOS PRODUTOS E QUAL A QTD MEDIA DE PRODUTOS TEMOS CADASTRADOS 
NAS ORDENRS DE SERVICO - AGRUPAR PELO ID DO PRODUTo
*/

-- desafio 1 
select ProductID, avg(UnitPrice) as 'media de valor dos produtos' from Sales.SalesOrderDetail
group by ProductID

--desafio 2
select top 10 ProductID, sum(UnitPrice) from Sales.SalesOrderDetail
group by ProductID
order by sum(UnitPrice) desc;

--desafio 3
select ProductID , COUNT(ProductID) as 'quantos produtos por id', avg(OrderQty) as 'media de ordens por produto'  
from Production.WorkOrder
group by ProductID;



-- Usando a tag having 
-- serve como um where porem somente no group by. Voce inclui uma condição para aparecer dentro do grupo.

--apenas os nomes que aparecem mais que 10 vezes
select FirstName, count(FirstName) as 'quantidade de nomes' from Person.Person
group by FirstName
having count(FirstName) > 10;


--apenas os nomes que comecam com A e se repetem mais de 10 vezes
select FirstName, count(FirstName) as 'quantidade de nomes' from Person.Person
where FirstName like 'a%'
group by FirstName
having count(FirstName) > 10



--Produtos por vendas totais entre 162k e 500k 
select * from Sales.SalesOrderDetail

select ProductID, sum(LineTotal) as 'Soma de vendas' from Sales.SalesOrderDetail
group by ProductID
having sum(LineTotal) between 162000 and 500000;


-- quais produtos nao estao trazendo em media vendas de um mil no total 

select ProductID, avg(LineTotal) 'media de vendas' from Sales.SalesOrderDetail
group by ProductID
having avg(LineTotal) < 1000;

