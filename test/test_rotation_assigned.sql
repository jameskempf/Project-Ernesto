-- duplicate primary key
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
-- first foreign key does not exist
insert into rotation_assigned values('AAAAAAAAAAAAAAAA', '2017-04-07', '00000000');
-- second foreign key does not exist
insert into rotation_assigned values('DISP17TU00000100', '2017-04-07', '99999999');
