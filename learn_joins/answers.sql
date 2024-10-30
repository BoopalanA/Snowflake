--1. What is the total sales amount in system? (output value in decimal)
select sum(quantity * price_per_unit) as total_sales
from learn_db.raw.sales;

--2. what is the total sales amount for the customers available in system? (output value in decimal)
select sum(s.quantity * s.price_per_unit) as total_sales
from learn_db.raw.sales as s
inner join learn_db.raw.customer as c
on s.customer_id = c.id;

--3. what is the total sales amount for the customers not available in system? (output value in decimal)
select sum(s.quantity * s.price_per_unit) as total_sales
from learn_db.raw.sales as s
left join learn_db.raw.customer as c
on s.customer_id = c.id
where c.id is null;

--4. what is the total sales amount for the products available in system? (output value in decimal)
select sum(s.quantity * s.price_per_unit) as total_sales
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku;

--5. what is the total sales amount for the products not available in system? (output value in decimal)
select sum(s.quantity * s.price_per_unit) as total_sales
from learn_db.raw.sales as s
left join learn_db.raw.product as p
on s.sku = p.sku
where p.sku is null;

--6. What are the customer IDs in sales data that are not available in customer master data?
select distinct s.customer_id as customer_id
from learn_db.raw.sales as s
left join learn_db.raw.customer as c
on s.customer_id = c.id
where c.id is null;

--7. What are the Product IDs in sales data that are not available in product master data?
select distinct s.sku as product_id
from learn_db.raw.sales as s
left join learn_db.raw.product as p
on s.sku = p.sku
where p.sku is null;

--8. How many apples are sold?
select sum(s.quantity) as total_quantity
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku
where upper(p.name) = 'APPLE';

--9. How many apples did John cena buy?
select sum(s.quantity) as total_quantity
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku
inner join learn_db.raw.customer as c
on s.customer_id = c.id
where upper(p.name) = 'APPLE'
and upper(concat(c.first_name,' ',c.last_name)) = 'JOHN CENA';

--10. How many fruits did Randy Orton buy?
select sum(s.quantity) as total_quantity
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku
inner join learn_db.raw.customer as c
on s.customer_id = c.id
where upper(p.type) = 'FRUIT'
and upper(concat(c.first_name,' ',c.last_name)) = 'RANDY ORTON';

--11. How many active customers have bought apple and paper?
select count(distinct c.id) as count_of_customers
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku
inner join learn_db.raw.customer as c
on s.customer_id = c.id
where upper(c.is_active) = 'Y'
and upper(p.name) in ('APPLE', 'PAPER');

--12. How much amount has been spent by active customer on pencil and Bannana?
select sum(s.quantity * s.price_per_unit) as total_amount
from learn_db.raw.sales as s
inner join learn_db.raw.product as p
on s.sku = p.sku
inner join learn_db.raw.customer as c
on s.customer_id = c.id
where upper(c.is_active) = 'Y'
and upper(p.name) in ('PENCIL', 'BANNANA');
