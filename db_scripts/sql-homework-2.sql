use ncHomeTask;

/*1*/
select *
from nc_attributes
where object_type_id = 3
order by attr_id desc;

/*2*/
select o.object_id 'Order ID', o.name 'Order Name'
from nc_objects o
inner join nc_params p
on o.object_id=p.object_id
where p.attr_id = 4 and p.value='10 Mbps';

/*3*/
select o.object_id 'Object ID', o.name 'Object Name'
from nc_objects o
inner join nc_references r
on o.object_id=r.object_id
inner join nc_objects o2
on o2.object_id=r.reference
where r.attr_id=2;

/*4*/
select o.object_id 'Object ID', o.name 'Object Name',
		t.object_type_id 'Object Type ID', t.name 'Object Type Name'
from nc_objects o
inner join nc_references r
on o.object_id=r.object_id
inner join nc_objects o2
on o2.object_id=r.reference
inner join nc_object_types t
on o.object_type_id = t.object_type_id
where r.attr_id=2;