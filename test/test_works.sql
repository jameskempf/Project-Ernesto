--  testing with duplicate primary key in Works table
insert into works values('test', '00000000');
--  testing with first foreign key does not exist in Works table
insert into works values('test1', '00000000');
--  testing with second foreign key does not exist in Works table
insert into works values('test', '00000009');
