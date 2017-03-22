-- testing with duplicate primary key in Coverage table
insert into coverage values('DISP17MD00000100', '2017-04-03', '00000000', 'F');
-- testing with first foreign key does not exist in Coverage table
insert into coverage values('AAAAAAAAAAAAAAAA', '2017-04-03', '00000000', 'F');
-- testing with second foreign key does not exist in Coverage table
insert into coverage values('DISP17TU00000100', '2017-04-03', '99999999', 'F');
-- testing with improper boolean value in Coverage table
insert into coverage values('DISP17TU00000100', '2017-04-03', '00000000', 'N');
-- testing the deleting cascade in Coverage table (sid)
select * from coverage;
delete * from shift where sid = 'AAAAAAAAAAAAAAAA';
select * from coverage;
