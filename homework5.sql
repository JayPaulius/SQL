create table cars
(
	id int primary key auto_increment,
    name varchar(45),
	cost int
);
insert cars(name, cost)
values
("Audi", 52642),
("Mercedes", 57127),
("Skoda", 9000),
("Volvo", 29000),
("Bentley", 350000),
("Citroen", 21000),
("Hummer", 41400),
("Volkswagen", 21600);
select * from cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

create view cars1 as
select * from cars where cost < 25000;

select * from cars1;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

alter view  cars1 as
select * from cars where cost < 30000;

select * from cars1;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

create view cars2 as
select * from cars where name = 'Skoda' or name = 'Audi';

select * from cars2;

-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

insert Analysis
values
(1,'название1',100,100,'группа1'),
(2,'название2',200,200,'группа2'),
(3,'название3',300,300,'группа3'),
(4,'название4',400,400,'группа4');
insert `Groups`
values
(1,'группа1',25),
(2,'группа2',25),
(3,'группа3',25),
(4,'группа4',25);
insert Orders
values
(1,'2020-02-05 12:00:00',1),
(2,'2020-02-07 12:00:00',2),
(3,'2020-02-09 12:00:00',3),
(4,'2020-02-15 12:00:00',4);

select an_name, an_price
from analysis
join orders
on an_id = ord_an
where ord_datetime between '2020-02-05 12:00:00' and '2020-02-12 12:00:00';

-- 5. Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
-- В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

create table table1
(
	train_id int,
	station varchar(20),
    station_time time
);
insert table1
values
(1, 'станция1', '10:00:00'),
(1, 'станция2', '10:54:00'),
(1, 'станция3', '11:02:00'),
(1, 'станция4', '12:35:00'),
(2, 'станция1', '11:00:00'),
(2, 'станция3', '12:49:00'),
(2, 'станция4', '13:30:00');
select * from table1;

select *,
timediff(lead(station_time) over w, station_time) as 'time_to_next_station'
from table1
window w as (partition by train_id order by station_time);