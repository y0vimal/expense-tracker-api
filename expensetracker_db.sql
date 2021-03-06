drop database expensetracker_db;
drop user expensetracker;

create user expensetracker with password 'password';
create database expensetracker_db with template=template0 owner=expensetracker;

\connect expensetracker_db;

alter default privileges grant all on tables to expensetracker;
alter default privileges grant all on sequences to expensetracker;

create table et_users(
user_id integer primary key not null,
firstname varchar(20) not null,
lastname varchar(20) not null,
email_id varchar(50) not null,
password text not null
);

create table et_categories(
category_id integer primary key not null,
user_id integer not null,
title varchar(20) not null,
description varchar(100) not null
);

alter table et_categories add constraint cat_user_fk
foreign key (user_id) references et_users (user_id);

create table et_transactions(
transaction_id integer primary key not null,
category_id integer not null,
user_id integer not null,
note varchar(50) not null,
amount numeric(10,2) not null,
transaction_date bigint not null
);

alter table et_transactions add constraint  trans_cat_fk
foreign key(category_id) references et_categories(category_id);

alter table et_transactions add constraint trans_user_fk
foreign key(user_id) references et_users(user_id);


