-- testing with duplicate primary key in Parker Assigned table
insert into parker_assigned values('2017-04-03', '0000', '0100', '00000000');
-- testing with first primary key does not exist in Parker Assigned table
insert into parker_assigned values('2000-01-01', '2300', '2400', '00000000');
-- testing with second primary key does not exist in Parker Assigned table
insert into parker_assigned values('2017-04-03', '0000', '0100', '99999999');
-- testing the deleting cascade in Parker Assigned table (gid)
select * from parker_assigned;
delete * from worker where gid = '44444444';
select * from parker_assigned;
