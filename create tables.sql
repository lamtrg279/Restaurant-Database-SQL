create table chef (
id char(3) primary key,
name varchar(20) ,
salary int,
address varchar(30));

create table meal (
meal_id char(3) primary key,
name varchar(20) not null,
price int);

create table ingredient (
ingre_id char(3) primary key, 
supplier_id char(3),
foreign key (supplier_id) references supplier(supplier_id), 
price int, 
qty int, 
description varchar(50));

create table supplier (
supplier_id char(3) primary key, 
name varchar(20) not null, 
location varchar(50));

create table waiter (
waiter_id char(3) primary key,
name varchar(20) not null,
salary int,
address varchar(50));

create table customer (
customer_id char(3) primary key,
name varchar(20) not null,
address varchar(50));

create table orders (
orders_id char(5) primary key,
customer_id char(3),
waiter_id char(3),
foreign key (customer_id) references customer(customer_id),
foreign key (waiter_id) references waiter(waiter_id),
totalprice int);

create table bill (
bill_id char(5) primary key,
customer_id char(3),
orders_id char(5),
foreign key (orders_id) references orders(orders_id),
foreign key (customer_id) references customer(customer_id),
datepaid date,
totalprice int);

create table meal_made (
chef_id char(3),
meal_id char(3),
foreign key (meal_id) references meal(meal_id),
foreign key (chef_id) references chef(chef_id));

create table order_line (
orders_id char(3) primary key,
foreign key (orders_id) references orders(orders_id),
item_description varchar(100),
qty int);

create table meal_w_ingredient (
meal_id char(3),
ingre_id char(3),
foreign key (meal_id) references meal(meal_id),
foreign key (ingre_id) references ingredient(ingre_id));



