Определение числа заказанных товаров

SELECT product_id,

SUM(case when order_type_id=2 then cnt ELSE 0 END)
AS Remains

FROM operations_data

GROUP BY product_id

Определение числа проданных товаров

SELECT product_id,

SUM(case when order_type_id=1 then cnt ELSE 0 END)
AS Remains

FROM operations_data

GROUP BY product_id

Вычисление остатков на основе разницы значений

WITH ProductRemains AS
(

SELECT product_id,

SUM(case when order_type_id=1 then cnt ELSE 0 END) -
SUM(case when order_type_id=2 then cnt ELSE 0 END)

AS Remains

FROM operations_data

GROUP BY product_id)


Группировка итоговых значений


SELECT p.product, ps.Remains FROM ProductRemains ps

JOIN product p ON p.product_id = ps.product_id;,


Ссылка на итоговую тестовую среду

https://dbfiddle.uk/TtcfUnxS