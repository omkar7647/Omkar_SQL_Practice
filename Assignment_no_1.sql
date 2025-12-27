-- Assignment No 1 (columns and data types)

create database ass1;
use ass1; 
-------------------------------------------------------------------------------------
-- suppliers

create table suppliers (
		supplier_id serial,
        supplier_name varchar(150),
        contact_person varchar(100),
        phone_number varchar(20),
        email varchar(150),
        country varchar(100),
        created_at datetime
        );
describe suppliers;

----------------------------------------------------------------------------------------------------
-- warehouses

create table warehouse (
		warehouse_id serial,
        warehouse_name varchar(150),
        city varchar(100),
        state varchar(100),
        country varchar(100),
        capacity_units int,
        created_at datetime
        );
describe warehouse;

------------------------------------------------------------------------------------------------
-- customers

create table customers (
		customer_id serial,
		customer_name varchar(150),
        phone_number varchar(20),
        email varchar(150),
        city varchar(100),
        country varchar(100),
        created_at datetime
        );
describe customers;
------------------------------------------------------------------------------------------------
-- purchase_orders

create table purchase_orders (
		po_id serial,
        supplier_id int,
        po_date date,
        expected_date date,
        status varchar(50),
        total_amount numeric(10,2),                  -- ex= 9999999999.99  (max)
        created_at datetime
        );
describe purchase_orders;


------------------------------------------------------------------------------------------------
-- purchase_order_items

create table purchase_order_items (
		po_item_id serial,
        po_id int,
        product_id int,
        quantity int,
        unit_price numeric(10,2),
		created_at datetime
        );
describe purchase_order_items;

------------------------------------------------------------------------------------------------
-- inventory

create table inventory (
		inventory_id serial,
        warehouse_id int,
        product_id int,
        quantity_on_hand int,
        reorder_level  int,
        last_updated timestamp
        );
describe inventory;

------------------------------------------------------------------------------------------------
-- sales_orders

create table sales_orders (
		sales_order_id serial,
        customer_id int,
        order_date date,
        status varchar(50),
        total_amount numeric(12,2),
        created_at datetime
        );
describe sales_orders;

------------------------------------------------------------------------------------------------
-- sales_order_items

create table sales_order_items (
		so_item_id serial,
        sales_order_id int,
        product_id int,
        quantity int,
        unit_price numeric(12,2),
        created_at datetime
        );
describe sales_order_items;

------------------------------------------------------------------------------------------------
-- shipments
create table shipments(
		shipment_id serial,
        sales_order_id int,
        warehouse_id int,
        shipment_date date,
        delivery_date date,
        shipment_status varchar(50),
        tracking_number varchar(100),
        created_at timestamp
);

describe shipments;

----------------------------------------------------------------------------------------------------------
show tables 


