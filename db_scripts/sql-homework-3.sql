use ncHomeTask;

/*1*/
select a.object_type_id 'Object Type ID',
	sum(p.value) 'Sum Value'
from nc_params p
inner join nc_attributes a
on p.attr_id=a.attr_id
where p.attr_id in(10, 11, 12)
group by p.attr_id
having sum(p.value)>60;

/*2*/
select o.object_id 'Order ID',
		o.name 'Order Name',
        min(p.value) 'Minimum Price'
from nc_params p
inner join nc_objects o
on p.object_id=o.object_id
where p.attr_id in(10, 11, 12) and o.name like 'Internet%';

/*3*/
select o.object_id 'Order ID',
		o.name 'Order Name',
        max(p.value) 'Maximum Period'
from nc_params p
inner join nc_objects o
on p.object_id=o.object_id
where p.attr_id in(7, 8, 9) and o.name like 'Internet%'
union
select o.object_id 'Order ID',
		o.name 'Order Name',
        max(p.value) 'Maximum Period'
from nc_params p
inner join nc_objects o
on p.object_id=o.object_id
where p.attr_id in(7, 8, 9) and o.name like 'Video%';

/*4*/
select round(avg(p1.value * (
		select p2.value
		from nc_params p2
		inner join nc_objects o2
		on p2.object_id=o2.object_id
		where p2.attr_id in(10, 11, 12) and o2.object_id=o1.object_id
        )), 3) 'Average Coast'
from nc_params p1
inner join nc_objects o1
on p1.object_id=o1.object_id
where p1.attr_id in(7, 8, 9);

/*5*/
select p1.value * (
		select p2.value
		from nc_params p2
		inner join nc_objects o2
		on p2.object_id=o2.object_id
		where o2.name='Internet Order #1' and p2.attr_id in(10, 11, 12)
        ) as 'Cost For n Months'
from nc_params p1
inner join nc_objects o1
on p1.object_id=o1.object_id
where o1.name='Internet Order #1' and p1.attr_id in(7, 8, 9);

/*6*/
select sum(p.value) 'Triple Play Sum'
from nc_params p
inner join nc_objects o
on o.object_id=p.object_id
where o.name in('Internet Order #1', 'Video Order #1', 'Mobile Order #1')
and p.attr_id in(10, 11, 12);

/*7*/
select o.object_id 'Order Name', 
		o.name 'Order Name',
        p.value 'Product Price',
        case
			when p.value = (select max(value) from nc_params where attr_id in(10, 11, 12))
            then 'The most expensive'
			when p.value = (select min(value) from nc_params where attr_id in(10, 11, 12))
            then 'The cheapest'
            else 'The other'
		end 'Result'
from nc_params p
inner join nc_objects o
on o.object_id=p.object_id
where p.attr_id in(10, 11, 12)
order by p.value;

/*8*/
select count(*) 'Counter', p.value 'Value', p.list_value_id 'List Value'
from nc_params p
group by case
			when p.list_value_id is not null then p.list_value_id
            else p.value
            end;
            
/*9*/
select *
from nc_objects o
inner join nc_object_types t
on o.object_type_id=t.object_type_id
order by case 
			when t.name = 'Phone Number' then o.description
            else o.object_type_id
            end;