select * from client;
desc purchase;
select * from item_status;
select * from purchase;
select * from staff_member;

alter table purchase 
modify purchase_id int auto_increment;

show create table purchase;
