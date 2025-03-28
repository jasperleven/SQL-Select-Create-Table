����������� �� ���� (���������� ��������� � ����� �������), ���������� �������� purchase order � order_type, ������ price � cnt

select format (t1.dt, 'MM-yyyy') "������",

count (t1.order_type) "���������� ���������",

sum (t1.price*t1.cnt) "����� �������"

from invoice_order_operations t1
where t1.order_type = 'purchase order'
and year(t1.dt) <2001
group by format (t1.dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "������",

count (t2.order_type) "���������� ���������",

sum (t2.price*t2.cnt) "����� �������"

from invoice_order_operations t2

where t2.order_type = 'purchase order'
and year(t2.dt) >=2001
group by format (t2.dt, 'MM-yyyy')

������ �������

select sum(cnt*selling_price) - sum (cnt*price)
from invoice_order_operations
where order_type = 'sales invoice'

������ ���������� ��������� �������, ������� � �������. ��������� ������� ���� �� MM-yyyy. ���������� ���������� �� sales invoice

select format (t1.dt, 'MM-yyyy') "������",

sum(t1.cnt) "����������",
sum(t1.cnt*t1.price) "�������",

sum(case when t1.order_type='sales invoice'

then t1.cnt*t1.selling_price - t1.cnt*t1.price else 0 end) "�������"

from invoice_order_operations t1

where year(t1.dt) <2001

group by format (t1.dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "������",

sum(t2.cnt) "����������",
sum(t2.cnt*t2.price) "�������",

sum(case when t2.order_type='sales invoice'

then t2.cnt*t2.selling_price - t2.cnt*t2.price else 0 end) "�������"

from invoice_order_operations t2

where year(t2.dt) >=2001

group by format (t2.dt, 'MM-yyyy')


������ ����� ������� � ������� ������� �� �������. 

select format (t1.dt, 'MM-yyyy') "������",

sum (case when t1.order_type='purchase order' then t1.cnt*t1.price else 0 end) "�������",

sum (case when t1.order_type='sales invoice' then t1.cnt*t1.selling_price else 0 end) "�������"

from invoice_order_operations t1

where year(t1.dt) <2001

group by format (dt, 'MM-yyyy')

union all

select format (t2.dt, 'MM-yyyy') "������",

sum (case when t2.order_type='purchase order' then t2.cnt*t2.price else 0 end) "�������",

sum (case when t2.order_type='sales invoice' then t2.cnt*t2.selling_price else 0 end) "�������"

from invoice_order_operations t2

where year(t2.dt) >=2001

group by format (dt, 'MM-yyyy')

������ ���������� ��������� �������, ������� � ������� �� ����������

select product_category "��������� ������",

sum(cnt) "����������",

sum(cnt*price) "�������",

sum(case when order_type='sales invoice'

then cnt*selling_price - cnt*price else 0 end) "�������"

from invoice_order_operations

group by product_category

������ �� �������� �����
https://dbfiddle.uk/lMhKM3Vn



