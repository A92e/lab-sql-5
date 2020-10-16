use sakila;

/* 
    Drop column picture from staff.
    A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
    Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.
    Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.
*/


 --  1- Drop column picture from staff.
ALTER TABLE staff
  DROP COLUMN picture;
  
  
  -- 2- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
  
insert into staff values ('3','TAMMY','SANDERS','5','Tammy.Sanders@sakilastaff.com','2','1','Tammy','21121c215c5','2008-01-01 00:00:01');
-- current_date



--  3- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.

insert into rental values( rental_id, current_date, 2 ,
 (select customer_id from customer where first_name='Charlotte' and last_name='Hunter'),'2008-01-01 00:00:01',
 (select staff_id from staff where first_name='Mike' and last_name='Hillyer'), current_date);

-- sHOW COLUMNS FROM rental;

-- select * from rental;

-- select * from rental where return_date= '2008-01-01 00:00:01';




-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.
-- drop table deleted_users;
drop table deleted_users;

create table deleted_users
as (select customer_id, email from customer where active <> 1);
ALTER TABLE deleted_users
ADD created_date datetime default now(); 

select * from deleted_users;