-- 1.	Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

select mark, color, count(color) 'количество'
from auto
where mark in ('bmw', 'lada')
group by mark, color
order by mark;

-- 2.	Вывести на экран марку авто(количество) и количество авто не этой марки.
-- 100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
select 
mark, 
count(*) 'количество авто марки', 
(select count(*) from auto) - count(*) 'количество авто других марок',
(select count(*) from auto) 'общее количество авто'
from auto
group by mark;

SELECT MARK, count(*),  all_auto - count(*)
FROM AUTO 
JOIN (SELECT COUNT(*) AS all_auto FROM AUTO ) tab
GROUP BY MARK, all_auto;

-- 3. Даны 2 таблицы. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
create table test_a (id int, data varchar(10));
create table test_b (id int);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

select * from test_a
where test_a.id in (select tbl.id from
(select test_a.id from test_a
union all
select test_b.id from test_b) tbl
group by tbl.id
having count(tbl.id) = 1);

SELECT * FROM test_a
LEFT JOIN test_b on test_b.id = test_a.id
WHERE test_b.id IS NULL;