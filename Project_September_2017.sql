--Common Table Expressions

with cte as (
select distinct column_1, count(distinct isnull(column_2,'NULL'))countdist, count(*)countall
from table
where column_3>='1/1/1900'
group by column_1
)
select sum(countall)
from cte


--“Exists” Query – Selects all rows where particular conditions are met across multiple tables

select column_1, sum(column_2) sumcomm, a.column_3
from  table a
	where exists 
			(select 'x' 
			 from table_2 b
			 where a.column_1 = b.column_1
			 and a.column_3 = b.column_3
			 and column_4 >= '1/1/1900')
 group by column_1, a.column_3
 order by 1

-- “Exists” Query – Selects all rows where particular conditions, utilizes temporary table

select distinct column_1, column_2, sum(column_4) 
from table a 
where exists 
(select 'x' from temporary_table where 0=0 
and column_1 = column_1
and column_3 > '01/1/1900'
group by column_1, column_2
order by 2 desc, 3 desc

--3 queries that select all rows from table 1 that do not appear in table 2 or table 3. Text column resulted in the long run times. All three queries ran successfully and resulted in the same results.

SELECT *
FROM table_1 t1
WHERE NOT EXISTS 
    (SELECT * 
    FROM table_2 t2
    WHERE t2.Column_1 = t1.Column_1)
AND NOT EXISTS 
    (SELECT * 
     FROM table_2 t2
     WHERE t2.Column_2 = t1.Column_2)
--Time:4:28:57

with cte as
    (select distinct column_1 
     from table_1
		union all
	 select distinct column_1 
     from table_2)
select *
from table_1 t1
where not exists 
    (select 'x' 
     from cte t2
     where t2.column_1 = t1.column_1) e
--Time: 5:00:20

select *
from table_1 t1
where not exists 
    (select 'x' 
    from table_2 t2
    where t2.column_1 = t1.column_1)
and not exists 
    (select 'x' 
     from table_3 t3
     where t3.column_1 = t1.column_1)
--Same as report query but substitutes 'x' for *
--Time: 4:40:31

select Column_1, Column_2, Column_3, Column_4, Column_5, Column_6
, sum(case when  Year(Column_7) = 1900 AND Month(Column_7) IN (1,2,3) then Column_8 else 0 end) '1900 Q1'
, sum(case when  Year(Column_7) = 1900 AND Month(Column_7) IN (4,5,6) then Column_8 else 0 end) '1900 Q2'
, sum(case when  Year(Column_7) = 1900 AND Month(Column_7) IN (7,8,9) then Column_8 else 0 end) '1900 Q3'
, sum(case when  Year(Column_7) = 1900 AND Month(Column_7) IN (10,11,12) then Column_8 else 0 end) '1900 Q4'
, sum(case when  Year(Column_7) = 1901 AND Month(Column_7) IN (1,2,3) then Column_8 else 0 end) '1901 Q1'
, sum(case when  Year(Column_7) = 1901 AND Month(Column_7) IN (4,5,6) then Column_8 else 0 end) '1901 Q2'
, sum(case when  Year(Column_7) = 1901 AND Month(Column_7) IN (7,8,9) then Column_8 else 0 end) '1901 Q3'
, sum(case when  Year(Column_7) = 1901 AND Month(Column_7) IN (10,11,12) then Column_8 else 0 end) '1901 Q4'
, sum(case when  Year(Column_7) = 1902 AND Month(Column_7) IN (1,2,3) then Column_8 else 0 end) '1902 Q1'
, sum(case when  Year(Column_7) = 1902 AND Month(Column_7) IN (4,5,6) then Column_8 else 0 end) '1902 Q2'
, sum(case when  Year(Column_7) = 1902 AND Month(Column_7) IN (7,8,9) then Column_8 else 0 end) '1902 Q3'
, sum(case when  Year(Column_7) = 1902 AND Month(Column_7) IN (10,11,12) then Column_8 else 0 end) '1902 Q4'
, sum(case when  Year(Column_7) = 1903 AND Month(Column_7) IN (1,2,3) then Column_8 else 0 end) '1903 Q1'
, sum(case when  Year(Column_7) = 1903 AND Month(Column_7) IN (4,5,6) then Column_8 else 0 end) '1903 Q2'
, sum(case when  Year(Column_7) = 1903 AND Month(Column_7) IN (7,8,9) then Column_8 else 0 end) '1903 Q3'
, sum(case when  Year(Column_7) = 1903 AND Month(Column_7) IN (10,11,12) then Column_8 else 0 end) '1903 Q4'
from Table
where Column_9 > '01/1/1900'
group by Column_1, Column_2, Column_3, Column_4, Column_5, Column_6
order by Column_1, Column_2, Column_3, Column_4, Column_5, Column_6


