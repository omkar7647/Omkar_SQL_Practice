-- ------------------------------------------ Assignment no 4 : Joins --------------------------------------------------------------------
-- Instructions: For each question, write an SQL query using the specified JOIN type on the provided PostgreSQL schema. Produce
-- output similar to the sample shown. Use ISO date formats (YYYY-MM-DD) where applicable.

use ass1;

-------------------------------------------------------------------------------------------------------------------------------------------
-- Q1: INNER JOIN
-- Show all purchase orders along with the supplier name who provided them
-- po_id po_date, status ,supplier_name
 
 select po_id,po_date,status,supplier_name from purchase_orders as po
 inner join suppliers as s 
 on s.supplier_id=po.supplier_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q2: LEFT JOIN
-- Show all customers and any sales orders they have placed. Include customers who have not placed any orders.
-- customer_name, sales_order_id, order_date

select customer_name, sales_order_id, order_date from customers as c
left join sales_orders as s 
on  c.customer_id=s.customer_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
 -- Q3: RIGHT JOIN
-- Show all sales orders and the name of the customer who placed them. Include orders even if customer info is missing.
-- sales_order_id, order_date, customer_name
 
select sales_order_id, order_date, customer_name from sales_orders as s
right join customers as c 
on c.customer_id=s.customer_id;

 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q4: FULL OUTER JOIN
-- Show all suppliers and all warehouses together. Include suppliers without warehouses and warehouses without suppliers.
 -- supplier_name, warehouse_name
 
SELECT supplier_name,warehouse_name FROM suppliers s
LEFT JOIN warehouse w
ON s.country = w.country

UNION

SELECT supplier_name,warehouse_name FROM suppliers s
RIGHT JOIN warehouse w
ON s.country = w.country;

 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q5: INNER JOIN
-- Show each sales order along with its shipment details (shipment date and status).
-- sales_order_id, order_date, shipment_date, shipment_status
 
select s.sales_order_id, order_date, shipment_date, shipment_status from sales_orders as s 
inner join shipments as sh
on s.sales_order_id=sh.sales_order_id;
 
 
 
 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q6: LEFT JOIN
-- Show all warehouses and the inventory stored in them. Include warehouses with no inventory.
-- warehouse_name, product_id ,quantity_on_hand

select warehouse_name, product_id ,quantity_on_hand from warehouse as w
left join inventory as i
on w.warehouse_id=i.warehouse_id;

 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q7: FULL OUTER JOIN
-- Show all purchase orders and all purchase order items together. Include orders without items and items without orders.
 -- po_id ,po_item_id
 
 select po.po_id ,po_item_id from purchase_orders as po
 left join purchase_order_items as poi
 on po.po_id=poi.po_id
 
 union 
 
 select po.po_id ,po_item_id from purchase_orders as po
 right join purchase_order_items as poi
 on po.po_id=poi.po_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q8: INNER JOIN
-- Show each customer along with the products they ordered and the quantity
-- customer_name ,product_id ,quantity 

select c.customer_name,soi.product_id ,soi.quantity   from sales_orders as so
inner join customers as c
on so.customer_id = c.customer_id
inner join sales_order_items as soi
on soi.sales_order_id=so.sales_order_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q9: LEFT JOIN
-- Show all suppliers and the purchase orders linked to them. Include suppliers with no purchase orders.
-- supplier_name, po_id status

select  supplier_name, po_id, status  from suppliers as s
left join purchase_orders as po
on po.supplier_id=s.supplier_id;


 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q10: RIGHT JOIN
-- Show all warehouses and any inventory linked to them. Include warehouses even if inventory is missing.
-- warehouse_name ,product_id

select warehouse_name ,product_id from warehouse as w
right join inventory as i
on w.warehouse_id=i.warehouse_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
 -- Q11: FULL OUTER JOIN
-- Show all customers and all suppliers together. Include unmatched rows from both sides.
-- customer_name ,supplier_name
 
 SELECT c.customer_name, s.supplier_name FROM customers c
left  JOIN suppliers s
ON c.country = s.country

union 

 SELECT c.customer_name, s.supplier_name FROM customers c
right  JOIN suppliers s
ON c.country = s.country;

 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q12: INNER JOIN
-- Show all shipments along with the warehouse name from which they were shipped.
-- shipment_id, warehouse_name ,shipment_status

select shipment_id, warehouse_name ,shipment_status from shipments as s
inner join warehouse as w
on s.warehouse_id=w.warehouse_id;
 
 ------------------------------------------------------------------------------------------------------------------------------------------
-- Q13: LEFT JOIN
-- Show all sales orders and their shipment dates. Include orders that have not been shipped yet.
-- sales_order_id ,shipment_date

select so.sales_order_id ,shipment_date from sales_orders as so
left join shipments as s
on so.sales_order_id=s.sales_order_id;

------------------------------------------------------------------------------------------------------------------------------------------
-- Q14: RIGHT JOIN
-- Show all purchase orders and the supplier names. Include orders even if supplier info is missing.
-- po_id, supplier_name

select po_id, supplier_name from purchase_orders as po 
right join suppliers as s
on s.supplier_id=po.supplier_id
where po_id is not null;

------------------------------------------------------------------------------------------------------------------------------------------
-- Q15: FULL OUTER JOIN
-- Show all sales orders and all purchase orders together. Include unmatched rows from both sides.
-- sales_order_id,  po_id

SELECT so.sales_order_id,po_id FROM sales_orders so
LEFT JOIN purchase_orders po
ON DATE(so.created_at) = DATE(po.created_at)

UNION

SELECT so.sales_order_id, po.po_id FROM sales_orders so
RIGHT JOIN purchase_orders po
ON DATE(so.created_at) = DATE(po.created_at);

------------------------------------------------------------------------------------------------------------------------------------------
-- Q16: INNER JOIN
-- Show inventory details along with the purchase order item price for the same product.
-- product_id, unit_price

select i.product_id, unit_price from inventory as i
inner join purchase_order_items as p
on i.product_id=p.product_id;

------------------------------------------------------------------------------------------------------------------------------------------
-- Q17: LEFT JOIN
-- Show all customers and the shipment status of their orders. Include customers without shipments.
-- customer_name, shipment_status

SELECT c.customer_name,sh.shipment_status FROM customers c
LEFT JOIN sales_orders so
ON c.customer_id = so.customer_id
LEFT JOIN shipments sh
ON so.sales_order_id = sh.sales_order_id;


------------------------------------------------------------------------------------------------------------------------------------------
-- Q18: RIGHT JOIN
-- Show all warehouses and the shipment status of orders shipped from them. Include warehouses with no shipments.
-- warehouse_name, shipment_status

SELECT w.warehouse_name, sh.shipment_status FROM shipments sh
RIGHT JOIN warehouse w
ON sh.warehouse_id = w.warehouse_id;

------------------------------------------------------------------------------------------------------------------------------------------
-- Q19: FULL OUTER JOIN
-- Show all inventory items and all sales order items together. Include unmatched rows from both sides.
-- product_id ,quantity

SELECT i.product_id, i.quantity_on_hand AS inventory_quantity, soi.quantity AS sales_quantity FROM inventory i
LEFT JOIN sales_order_items soi
ON i.product_id = soi.product_id

UNION

SELECT i.product_id, i.quantity_on_hand AS inventory_quantity,soi.quantity AS sales_quantity FROM inventory i
RIGHT JOIN sales_order_items soi
ON i.product_id = soi.product_id;


------------------------------------------------------------------------------------------------------------------------------------------
-- Q20: INNER JOIN
-- Show all purchase order items along with the purchase order details (order date and status).
-- po_item_id, po_id, po_date ,status

SELECT poi.po_item_id, poi.po_id, po.po_date,po.status FROM purchase_order_items poi
INNER JOIN purchase_orders po
ON poi.po_id = po.po_id ;

-- ----------------------------------------------------------------------------------------------------------------------------------------