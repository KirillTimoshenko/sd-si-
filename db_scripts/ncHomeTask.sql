create database ncHomeTask;
use ncHomeTask;
show tables;

create table object_types(
object_type_id int(6) unsigned auto_increment primary key,
name varchar(50) not null,
description varchar(200));

create table nc_objects(
object_id int(6) unsigned auto_increment primary key,
object_type_id int references object_types(object_type_id),
name varchar(50) not null,
description varchar(50));

create table nc_attributes(
attr_id int(6) unsigned auto_increment primary key,
object_type_id int(6) not null,
name varchar(50) not null,
type int(6) not null);

create table list_values(
list_value_id int(6) unsigned auto_increment primary key,
value varchar(50));

create table nc_params(
object_id int not null references nc_objects(object_id),
attr_if int not null references nc_attribures(attr_id),
list_value_id int references list_values(list_value_id),
value varchar(50));

create table nc_references(
object_id int not null references nc_objects(object_id),
attr_id int not null references nc_attribures(attr_id),
reference int(6) not null);


insert into object_types values(6, 'Internet Order Object Type', null);
insert into object_types values(7, 'Video Order Object Type', null);
insert into object_types values(8, 'Mobile Order Object Type', null);
insert into object_types values(18, 'Abstract Order Object Type', 'Abstract object type for all product orders');
insert into object_types values(20, 'Internet Instance Object Type', null);
insert into object_types values(21, 'Video Instance Object Type', null);
insert into object_types values(22, 'Mobile Instance Object Type', null);
insert into object_types values(23, 'Abstract Instance Object Type', 'Abstract object type for all product instances');
insert into object_types values(24, 'Phone Number', null);

insert into nc_objects values(null, 6, 'Internet Order #1', null);
insert into nc_objects values(null, 7, 'Video Order #1', null);
insert into nc_objects values(null, 7, 'Video Order #2', null);
insert into nc_objects values(null, 6, 'Internet Order #2', null);
insert into nc_objects values(null, 8, 'Mobile Order #1', null);
insert into nc_objects values(24, 24, '07454343676', 'Number in the system');

insert into nc_attributes values(9, 18, 'Due Date', 4);
insert into nc_attributes values(10, 8, 'Phone Number', 9);
insert into nc_attributes values(11, 6, 'Access Type', 6);
insert into nc_attributes values(12, 6, 'Download Speed', 0);
insert into nc_attributes values(13, 8, 'Service Type', 6);
insert into nc_attributes values(19, 7, 'Suspend Reason', 0);

insert into list_values values(14, 'XDSL');
insert into list_values values(15, 'GPON');
insert into list_values values(16, 'Postpaid');
insert into list_values values(17, 'Prepaid');

insert into nc_params values(1, 11, 15, null);
insert into nc_params values(1, 12, null, '100 Mbps');
insert into nc_params values(2, 19, null, 'Device Stolen');
insert into nc_params values(3, 19, null, 'Tariff Change');
insert into nc_params values(4, 11, 14, null);
insert into nc_params values(4, 12, null, '500 Mbps');
insert into nc_params values(5, 13, 16, null);

insert into nc_references values(5, 10, 24);