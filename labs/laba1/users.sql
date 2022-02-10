create database lab1;
create user first_user with password '111';
create user second_user with password '111';
grant all on database lab1 to first_user;
grant connect on database 'lab1' to second_user;
