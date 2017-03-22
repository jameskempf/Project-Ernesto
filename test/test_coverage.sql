-- duplicate primary key
insert into coverage values('DISP17MD00000100', '2017-04-03', '00000000', 'F');
-- first foreign key does not exist
insert into coverage values('AAAAAAAAAAAAAAAA', '2017-04-03', '00000000', 'F');
-- second foreign key does not exist
insert into coverage values('DISP17TU00000100', '2017-04-03', '99999999', 'F');
-- improper boolean value
insert into coverage values('DISP17TU00000100', '2017-04-03', '00000000', 'N');
