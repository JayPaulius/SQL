-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
-- Id, ProductName, Manufacturer, ProductCount, Price
-- Заполните БД данными.

CREATE TABLE `sql1`.`new_table` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `ProductCount` INT NULL,
  `Price` INT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `ProductName_UNIQUE` (`ProductName` ASC) VISIBLE);

INSERT INTO `sql1`.`new_table` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 13', 'Apple', '2', '77000');
INSERT INTO `sql1`.`new_table` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 11', 'Apple', '3', '56500');
INSERT INTO `sql1`.`new_table` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S21', 'Samsung ', '1', '51000');
INSERT INTO `sql1`.`new_table` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S23', 'Samsung ', '4', '120000');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT ProductName, Manufacturer, Price 
FROM sql1.new_table
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM sql1.new_table
WHERE Manufacturer = 'Samsung';

-- 4.*** С помощью регулярных выражений найти:


-- Товары, в наименовании которых есть упоминание "Iphone"

SELECT * FROM sql1.new_table
WHERE ProductName LIKE '%Iphone%';

-- Товары, в наименовании которых есть упоминание "Samsung"

SELECT * FROM sql1.new_table
WHERE ProductName LIKE '%Samsung%';

-- Товары, в наименовании которых есть ЦИФРЫ

SELECT * FROM sql1.new_table
WHERE ProductName REGEXP '[0-9]+$';
--WHERE ProductName RLIKE '[0-9]';

-- Товары, в наименовании которых есть ЦИФРА "8"

SELECT * FROM sql1.new_table
WHERE ProductName LIKE '%8%';