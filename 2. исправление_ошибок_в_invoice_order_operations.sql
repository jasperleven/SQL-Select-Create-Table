�������� ��� � invoice_order_operations

select min(dt), max(dt) from invoice_order_operations

��������� ��������� ���, ��� �� ������ �������

select * from invoice_order_operations where dt >'1877-09-08' and dt <'2000-01-01'

�������� ������ ���

DELETE from invoice_order_operations
where dt >'1877-09-08' and dt <'2000-01-01'

����� �������� � ������� ��������� ���������

select distinct (product_category) from invoice_order_operations

����������� ��������

update invoice_order_operations
set product_category = 'Insulation materials'
where product_category = 'insulation Material'

����� �������� � ������� �������������

select distinct (manufacturer) from invoice_order_operations

����������� ��������

update invoice_order_operations
set manufacturer = 'Tikkurila'
where manufacturer = 'Tikurila'

��������� ���, ���������� � ���� �������

select min(cnt) min, max(cnt) max from invoice_order_operations
select min (price) min ,
max (price) max from invoice_order_operations
select min (selling_price) min ,
max (selling_price) max from invoice_order_operations

�������� ��������� ��������

DELETE from invoice_order_operations
where cnt ='999999999'

����� �������� � ������������� �����

select * from invoice_order_operations
where price <'0'

����������� ������������� ��������

update invoice_order_operations
set price = ABS(price)

�������� ����� �� �������� purchase order, ��� ���� ��������� ���� � ��������� null

select min (selling_price) min , max (selling_price) max from invoice_order_operations

DELETE from invoice_order_operations
where order_type ='purchase order'

�������� ����� https://dbfiddle.uk/mb9sVW5e

����������� ����������� � ������������ ����

select min (price), max (price) from invoice_order_operations

���������� �����

select count(*) from invoice_order_operations

���������� ����� � ������������� ������ ��������� ������ � �������������

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

�������, ������������ � ����������� ���������� ������ �� ������ � ���

select avg(cnt) avg, min(cnt) min, max(cnt) max from invoice_order_operations
select avg(price) avg, min (price) min , max (price) max from invoice_order_operations

������ �� �������� �������� �����
https://dbfiddle.uk/2Ir6RwR4











