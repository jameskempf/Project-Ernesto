-- duplicate primary key
insert into works values('test', '00000000');
-- first foreign key does not exist
insert into works values('test1', '00000000');
-- second foreign key does not exist
insert into works values('test', '00000009');
