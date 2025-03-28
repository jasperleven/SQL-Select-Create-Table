—оздание таблиц-справочников

create table order_type
(order_type_id int identity (1,1) primary key,

order_type varchar(200));

create table product_category
(product_category_id int identity (1,1) primary key,

product_category varchar(200));

create table product
(product_id int identity (1,1) primary key,

product varchar(200));

create table manufacturer
(manufacturer_id int identity (1,1) primary key,

manufacturer varchar(200))

«аполенение созданных таблиц

insert into order_type
select DISTINCT order_type from invoice_order_operations;
insert into product_category
select DISTINCT product_category from invoice_order_operations;
insert into product
select DISTINCT product from invoice_order_operations;
insert into manufacturer
select DISTINCT manufacturer from invoice_order_operations

—оздание таблицы с упрощенной структурой данных

create table operations_data

(dt date,

  tm time,

  order_number int,

  order_type_id int,

  product_category_id int,

  product_id int,

  manufacturer_id int,
  cnt int,
 
 price decimal,

  selling_price decimal)


—опоставление созданной таблицы с данными из таблиц справочников


insert into operations_data

 (dt,tm,order_number,order_type_id,product_category_id,product_id,manufacturer_id,cnt,price,selling_price)

select dt, tm, order_number,
 t1.order_type_id,t2.product_category_id,t3.product_id,
t4.manufacturer_id,cnt, price, selling_price

  from invoice_order_operations t

  left join order_type t1 on t.order_type=t1.order_type

  left join product_category t2 on t.product_category=t2.product_category

  left join product t3 on t.product=t3.product

  left join manufacturer t4 on t.manufacturer=t4.manufacturer



¬ычислние количества строк в созданой таблице

SELECT COUNT(*) FROM operations_data

 оличество строк в каждой категории товара и по производителю

SELECT COUNT(*) FROM operations_data where product_category_id = '1'

SELECT COUNT(*) FROM operations_data where product_category_id = '2'

SELECT COUNT(*) FROM operations_data where product_category_id = '3'

SELECT COUNT(*) FROM operations_data where product_category_id = '4'

SELECT COUNT(*) FROM operations_data where product_category_id = '5'

SELECT COUNT(*) FROM operations_data where manufacturer_id = '1'

SELECT COUNT(*) FROM operations_data where manufacturer_id = '2'

SELECT COUNT(*) FROM operations_data where manufacturer_id = '3'

SELECT COUNT(*) FROM operations_data where manufacturer_id = '4'

SELECT COUNT(*) FROM operations_data where manufacturer_id = '5'

¬ычисление среднего, максимального и минимального значени€ cnt и price

select avg(cnt), min(cnt), max(cnt) from operations_data
select avg(price), min(price), max(price) from operations_data

—сылка на итоговую тестовую среду


