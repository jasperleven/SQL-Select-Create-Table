Создание таблицы с типом данных

create table type (
Column_Title nvarchar(200),
Data_type nvarchar(1000) )

Добавление столбцов из таблицы invoice_order_operations

insert into type (
Column_Title, Data_type)
values 
('date', N'дата заказа'),
('time', N'время заказа'),
('order_number', N'номер заказа'),
('order_type',N'тип заказа'),
('product_category',N'заказанная продуктовая категория'),
('product', N'заказанный тип продукта'),
('manufacturer', N'производитель'),
('cnt', N'количество заказов'),
('price', N'цена'),
('selling_price', N'цена продажи')

Исключение отрицательных занчений из колонки price

UPDATE invoice_order_operations
SET price = REPLACE(price, '-','')

Расчет количества строк в invoice_order_operations

select count(*) from invoice_order_operations

Запрос к invoice_order_operations с выводом занчений с диапазоном данных представленных в таблице

select min(dt), max(dt) from invoice_order_operations
select min(tm), max(tm) from invoice_order_operations
select count (distinct order_number) from invoice_order_operations
select distinct (order_type) from invoice_order_operations
select distinct (product_category) from invoice_order_operations
select distinct (manufacturer) from invoice_order_operations
select distinct (product) from invoice_order_operations
select avg (cnt), min(cnt), max(cnt) from invoice_order_operations
where cnt != 999999999
select avg (price), min (price), max (price) from invoice_order_operations
select avg (selling_price), min (selling_price),
max (selling_price) from invoice_order_operations

Создание таблицы type_2 с выводом основных данных из invoice_order_operations

create table type_2 (
Column_Title nvarchar(200),
Data_characteristics nvarchar(1000),
Appointment nvarchar(1000))

insert into type_2 (
Column_Title, Data_characteristics, Appointment)
values 
('date', N'min 1877-09-08 max 2001-08-16', N'минимальная и максимальная дата'),
('time', N'min 09:17:00 max 17:37:00', N'минимальное и максимальное время'),
('order_number',N'102', N'102 уникальных номера заказа'),
('order_type',N'purchase order, sales invoice',
N'два типа заказов - выставленный счет продажи и заказ на покупку'),
('product_category',N'Construction chemistry,
Dry building mixes,
insulation Material,
Insulation materials,
Two-component mortar,
Varnishes and paints',N'6 видов категорий продуктов участвующих в продажах'),
('product', N'epoxy grouts, everal aqua 10, everal aqua 10 interior,
everal aqua 40, fugen, glue cm 11, glue cm 17, grout, helmi 10, helmi 30,
helmi primer, kiva 10, kiva 30, kiva 70,partial fill cavity slab 100
partial fill cavity slab 50, partial fill cavity slab 80, polyurethane foam
polyurethane foam premium of winter, rockclose insulated dpc 20 .rotband, uniflott',
N'22 продукта участвующих в продажах'),
('manufacturer', N'Ceresit, Knauf, Makroflex, Rockwool, Tikkurila, Tikurila',
N'5 производителей, в 1 есть опечатка'),
('cnt', N'avg 747, min 1, max 5800', N'747 в среднем заказанных позиций,
одна минимальная заказанная позиция и 5800 максимум заказанных позиций'),
('price', N'avg 17.26, min 3.2, max 90', N'17.26 средняя оптовая цена, 3.2 минимальная
и 90 максимальная'),
('selling_price', N'18.85 avg, 3.28 min, 97.69 max', N'18.85 средняя оптовая цена,
3.28 минимальная и 90 максимальная')


Ссылка на тестовую среду
https://dbfiddle.uk/NJq4LnNU