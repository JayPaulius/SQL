-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

drop function if exists converter;
delimiter //
create function converter(s int)
returns varchar(100) deterministic
begin
	declare res varchar(100);
	set res = concat(s div 86400, ' days ');
    set s = s mod 86400;
    set res = concat(res, s div 3600, ' hours ');
    set s = s mod 3600;
    set res = concat(res, s div 60, ' minutes ');
    set s = s mod 60;
    set res = concat(res, s, ' seconds');
    return res;
end//
delimiter ;
select converter(123456);

-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

drop procedure if exists nums;
delimiter //
create procedure nums()
begin
	declare n int default 2;
    declare res varchar(100) default '';
    while n <= 10 do
		set res = concat(res, n, ' ');
        set n = n + 2;
    end while;
    select res;
end//
call nums();