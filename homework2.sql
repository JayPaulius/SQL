-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

create table sales
(
	id int primary key auto_increment not null,
    order_date date not null,
    amount int not null,
    bucket varchar(10) null
);

insert sales (order_date, amount)
values
	('2021-01-01', 90),
    ('2021-01-02', 100),
    ('2021-01-03', 200),
    ('2021-01-04', 350);

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

update sales 
set sales.bucket =
	case
		when sales.amount < 100 then 'меньше 100'
        when sales.amount >= 100 and sales.amount <= 300 then '100-300'
		else 'больше 300'
    end;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

create table orders
(
	order_id int primary key auto_increment not null,
    employee_id varchar(45) not null,
    amount float not null,
    order_status varchar(45) not null
);

insert orders (employee_id, amount, order_status)
values
	('a01', 15.00, 'OPEN'),
    ('b02', 25.50, 'OPEN'),
    ('c03', 100.70, 'CLOSED'),
    ('d04', 22.18, 'OPEN'),
    ('e05', 9.50, 'CANCELLED');
    
select order_id, order_status,
case
	when order_status = 'OPEN' then  'Order is open state'
    when order_status = 'CLOSED' then 'Order is closed'
    when order_status = 'CANCELLED' then 'Order is cancelled'
end as order_summary
from orders;

-- 4. Чем NULL отличается от 0?

-- NULL означает, что ячейка пустая, она не имеет значения, а 0 означает, что само значение ячейки равно целому числу 0.
-- Операция над переменной, содержащей NULL, приведет либо к NULL, либо к ошибке,
-- потому что, если одно из значений переменной неизвестно, то результат выражения не может быть известен.
-- Операция над нулем, за исключением деления на него, обычно допустима и возвращает другое известное уникальное значение.
