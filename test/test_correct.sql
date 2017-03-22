-- correct example of POSITION
insert into position values('test', '10.00');
-- correct example of WORKER
insert into worker values('00000000', 'test', 'person');
-- correct example of WORKS
insert into works values('test', '00000000');
-- correct example of SHIFT
insert into shift values('DISP17MD00000100', 'Monday', '0000', '0100', 'Spring', 'F', '00000000');
insert into shift values('DISP17TU00000100', 'Tuesday', '0000', '0100', 'Spring', 'F', '00000000');
-- correct example of SHIFT_TYPE
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
-- correct example of ROTATION_ASSIGNED
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
-- correct example of COVERAGE
insert into coverage values('DISP17MD00000100', '2017-04-03', '00000000', 'F');
-- correct example of PARKER_SHIFT
insert into parker_shift values('2017-04-03', '0000', '0100', '05');
-- correct example of PARKER_ASSIGNED
insert into parker_assigned values('2017-04-03', '0000', '0100', '00000000');
