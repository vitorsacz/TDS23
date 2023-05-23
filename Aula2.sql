select * from sys.tables;

select count from authors;

select * from authors;

select * from dbo.authors

select au_fname, au_lname, phone from dbo.authors

select COUNT(phone) from dbo.authors

select COUNT(au_fname) from dbo.authors
select COUNT(au_lname) from dbo.authors

SELECT au_fname, phone FROM authors 
order by au_fname desc

select au_fname from dbo.authors
order by au_id asc;



select * from dbo.sales

select top 5 stor_id from dbo.sales
order by 


select au_fname, state from dbo.authors
where state != 'CA'

select sum(qty) as QTD_PRODUTOS from dbo.sales


SELECT * FROM dbo.sales; 6380

UPDATE sales SET qty='40'
where stor_id = '6380'

UPDATE sales SET qty='100'
where title_id = 'PC8888'

SELECT qty FROM sales
where title_id = 'PC8888'


