select * from client;
desc client;

alter table purchase 
modify purchase_id int auto_increment;
select * from item_status;
desc item_status;
select * from purchase;
show create table purchase;


alter table purchase
add constraint fk_Purchase_staff_member
foreign key (staff_member_staff_code)
references staff_member(staff_code)
on delete cascade
on update cascade;

select * from staff_member;

alter table purchase
drop foreign key fk_Purchase_Item_status;

alter table purchase 
drop foreign key fk_Purchase_Staff_Member;
