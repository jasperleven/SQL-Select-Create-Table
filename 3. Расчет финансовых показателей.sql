Группировка по дате (количество накладных и сумма закупки), фильтрация значения purchase order в order_type, расчет price и cnt

select format (t1.dt, 'MM-yyyy') "Период",

count (t1.order_type) "Количество накладных",

sum (t1.price*t1.cnt) "Сумма закупки"

from invoice_order_operations t1
where t1.order_type = 'purchase order'
and year(t1.dt) <2001
group by format (t1.dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "Период",

count (t2.order_type) "Количество накладных",

sum (t2.price*t2.cnt) "Сумма закупки"

from invoice_order_operations t2

where t2.order_type = 'purchase order'
and year(t2.dt) >=2001
group by format (t2.dt, 'MM-yyyy')

Расчет прибыли

select sum(cnt*selling_price) - sum (cnt*price)
from invoice_order_operations
where order_type = 'sales invoice'

Расчет количества проданных товаров, выручки и прибыли. Изменение формата даты на MM-yyyy. Фильтрация вычислений по sales invoice

select format (t1.dt, 'MM-yyyy') "Период",

sum(t1.cnt) "Количество",
sum(t1.cnt*t1.price) "Выручка",

sum(case when t1.order_type='sales invoice'

then t1.cnt*t1.selling_price - t1.cnt*t1.price else 0 end) "Прибыль"

from invoice_order_operations t1

where year(t1.dt) <2001

group by format (t1.dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "Период",

sum(t2.cnt) "Количество",
sum(t2.cnt*t2.price) "Выручка",

sum(case when t2.order_type='sales invoice'

then t2.cnt*t2.selling_price - t2.cnt*t2.price else 0 end) "Прибыль"

from invoice_order_operations t2

where year(t2.dt) >=2001

group by format (t2.dt, 'MM-yyyy')


Расчет суммы закупки и продажи товаров по месяцам. 

select format (t1.dt, 'MM-yyyy') "Период",

sum (case when t1.order_type='purchase order' then t1.cnt*t1.price else 0 end) "Закупка",

sum (case when t1.order_type='sales invoice' then t1.cnt*t1.selling_price else 0 end) "Продажа"

from invoice_order_operations t1

where year(t1.dt) <2001

group by format (dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "Период",

sum (case when t2.order_type='purchase order' then t2.cnt*t2.price else 0 end) "Закупка",

sum (case when t2.order_type='sales invoice' then t2.cnt*t2.selling_price else 0 end) "Продажа"

from invoice_order_operations t2

where year(t2.dt) >=2001

group by format (dt, 'MM-yyyy')

Расчет количества проданных товаров, выручки и прибыли по категориям

select product_category "Категория товара",

sum(cnt) "Количество",

sum(cnt*price) "Выручка",

sum(case when order_type='sales invoice'

then cnt*selling_price - cnt*price else 0 end) "Прибыль"

from invoice_order_operations

group by product_category

Ссылка на итоговую среду
https://dbfiddle.uk/lMhKM3Vn



