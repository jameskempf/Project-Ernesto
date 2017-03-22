-- duplicate primary key
insert into parker_assigned values('2017-04-03', '0000', '0100', '00000000');
-- first primary key does not exist
insert into parker_assigned values('2000-01-01', '2300', '2400', '00000000');
-- second primary key does not exist
insert into parker_assigned values('2017-04-03', '0000', '0100', '99999999');
