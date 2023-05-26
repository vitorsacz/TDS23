-- mostrar todos os funcionarios que entraram no mesmo ano 

select f1.FirstName, f1.HireDate, f2.FirstName, f2.HireDate from Employees F1, Employees F2
where DATEPART(YEAR, f1.HireDate) = DATEPART(year, F2.HireDate )


--mostrando apenas o ano e sem repetição 
select distinct f1.FirstName,DATEPART(YEAR,f1.HireDate) as 'ano de admissão' from Employees F1, Employees F2
where DATEPART(YEAR, f1.HireDate) = DATEPART(year, F2.HireDate )


-- mostrar todos os funcionarios que entraram no mesmo mês 

select f1.FirstName, f1.HireDate, f2.FirstName, f2.HireDate from Employees F1, Employees F2
where DATEPART(MONTH, f1.HireDate) = DATEPART(MONTH, F2.HireDate )
