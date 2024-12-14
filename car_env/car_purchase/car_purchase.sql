select * from client;
desc client;

alter table staff_member 
modify staff_code int auto_increment;
select * from item_status;
desc item_status;
select * from purchase;
show create table purchase;


alter table purchase
add constraint fk_Purchase_Client1
foreign key (Client_client_id)
references client(client_id)
on delete cascade
on update cascade;

select * from staff_member;

alter table purchase
drop foreign key fk_Purchase_Item_status1;

alter table purchase 
drop foreign key fk_Purchase_Staff_Member;

alter table purchase
drop foreign key fk_Purchase_Client1;
