Диапазон дат в invoice_order_operations

select min(dt), max(dt) from invoice_order_operations

Выделение диапазона дат, где не велись продажи

select * from invoice_order_operations where dt >'1877-09-08' and dt <'2000-01-01'

Удаление лишних дат

DELETE from invoice_order_operations
where dt >'1877-09-08' and dt <'2000-01-01'

Вывод значений в столбце категории продуктов

select distinct (product_category) from invoice_order_operations

Исправление опечатки

update invoice_order_operations
set product_category = 'Insulation materials'
where product_category = 'insulation Material'

Вывод значений в столбце производитель

select distinct (manufacturer) from invoice_order_operations

Исправление опечатки

update invoice_order_operations
set manufacturer = 'Tikkurila'
where manufacturer = 'Tikurila'

Диапазоны цен, количества и цены товаров

select min(cnt) min, max(cnt) max from invoice_order_operations
select min (price) min ,
max (price) max from invoice_order_operations
select min (selling_price) min ,
max (selling_price) max from invoice_order_operations

Удаление ошибочных значений

DELETE from invoice_order_operations
where cnt ='999999999'

Вывод значений с отрицательной ценой

select * from invoice_order_operations
where price <'0'

Исправление отрицательных занчений

update invoice_order_operations
set price = ABS(price)

Удаление анных со статусом purchase order, где были розничные цены с значенией null

select min (selling_price) min , max (selling_price) max from invoice_order_operations

DELETE from invoice_order_operations
where order_type ='purchase order'

тестовая среда https://dbfiddle.uk/mb9sVW5e

Определение минимальной и максимальной цены

select min (price), max (price) from invoice_order_operations

Количество строк

select count(*) from invoice_order_operations

Количество строк в распределении каждой категории товара и производителя

select count(*) from invoice_order_operations
where product_category = 'Construction chemistry'
select count(*) from invoice_order_operations
where product_category = 'Dry building mixes'
select count(*) from invoice_order_operations
where product_category = 'Insulation materials'
select count(*) from invoice_order_operations
where product_category = 'Two-component mortar'
select count(*) from invoice_order_operations
where product_category = 'Varnishes and paints'
select count(*) from invoice_order_operations
where manufacturer = 'Ceresit'
select count(*) from invoice_order_operations
where manufacturer = 'Knauf'
select count(*) from invoice_order_operations
where manufacturer = 'Makroflex'
select count(*) from invoice_order_operations
where manufacturer = 'Rockwool'
select count(*) from invoice_order_operations
where manufacturer = 'Tikkurila'

Среднее, максимальное и минимальное количество товара на складе и цен

select avg(cnt) avg, min(cnt) min, max(cnt) max from invoice_order_operations
select avg(price) avg, min (price) min , max (price) max from invoice_order_operations

Ссылка на итоговую тестовую среду
https://dbfiddle.uk/2Ir6RwR4











