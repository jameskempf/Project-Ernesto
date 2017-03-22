--  testing with duplicate primary key in Rotation Assigned table
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
--  testing with first foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('AAAAAAAAAAAAAAAA', '2017-04-07', '00000000');
--  testing with second foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('DISP17TU00000100', '2017-04-07', '99999999');
