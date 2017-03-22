-- Queries for populating each table

--Queries to fill in Position table
insert into position values('Dispatcher', '12.00');
insert into position values('Senior Dispatcher', '13.00');
insert into position values('PEA', '13.00' );
insert into position values('Parker', '11.50');
insert into position values('Opener', '11.50');
insert into position values('Closer', '12.00');
insert into position values('Head Dispatcher', '14.00');

--Queries to fill in Worker table
insert into worker values('11223344', 'Audrey', 'Hepburn');
insert into worker values('55667788', 'Sherlock', 'Holmes');
insert into worker values('11335577', 'Bill', 'Cipher');
insert into worker values('22446688', 'Jessica', 'Jones');
insert into worker values('11111111', 'Amy', 'Pond');
insert into worker values('22222222', 'Sheldon', 'Cooper');
insert into worker values('33333333', 'Mabel', 'Pines');
insert into worker values('44444444', 'Gideon', 'Flower');
insert into worker values('12345678', 'Kitty', 'Purr');
insert into worker values('66666666', 'River', 'Song');
insert into worker values('23456789', 'Dextra', 'Ulta');
insert into worker values('34567891', 'Harold', 'Mossimo');
insert into worker values('45678912', 'Thorin', 'Oakenshield');
insert into worker values('56789012', 'Martin', 'Freeman');
insert into worker values('67891234', 'Bilbo', 'Baggins');
insert into worker values('78912345', 'Leo', 'Tolstoy');
insert into worker values('89123456', 'Trixie', 'Adipose');
insert into worker values('91234567', 'Svetlana', 'Livingstone');
insert into worker values('98765432', 'Scooby', 'Doo');
insert into worker values('87654321', 'Donna', 'Noble');
insert into worker values('76543219', 'Harry', 'Potter');
insert into worker values('65432198', 'Draco', 'Malfoy');
insert into worker values('54321987', 'Hermione', 'Granger');
insert into worker values('43219876', 'Ron', 'Weasley');
insert into worker values('32198765', 'Donita', 'Paul');
insert into worker values('21987654', 'Rosie', 'Williams');
insert into worker values('19876543', 'Tad', 'Doctor');
insert into worker values('11112222', 'John', 'Smith');
insert into worker values('33334444', 'Jim', 'Gordon');
insert into worker values('55556666', 'Bruce', 'Wayne');


--Queries to fill Works table
insert into works values('Dispatcher', '12345678');
insert into works values('Senior Dispatcher', '11223344');
insert into works values('Head Dispatcher', '55667788');
insert into works values('Opener', '11335577');
insert into works values('Parker', '22446688');
insert into works values('Closer', '11111111');
insert into works values('Opener', '22222222');
insert into works values('Closer', '33333333');
insert into works values('Parker', '44444444');
insert into works values('PEA', '66666666');
insert into works values('Senior Dispatcher', '23456789');
insert into works values('Dispatcher', '34567891');
insert into works values('Dispatcher', '45678912');
insert into works values('Dispatcher', '56789012');
insert into works values('Dispatcher', '67891234');
insert into works values('Dispatcher', '78912345');
insert into works values('Parker', '89123456');
insert into works values('Parker', '91234567');


--Queries to fill Shift table
insert into shift values('DISP17MD06001400', 'Monday', '0600', '1400', 'Spring', 'F', '12345678');
insert into shift values('DISP17TU14002200', 'Tuesday', '1400', '2200', 'Spring', 'F', '55667788');
insert into shift values('OPSP17WE06001400', 'Wednesday', '0600', '1400', 'Spring', 'F', '11335577');
insert into shift values('PASP17TH06001400', 'Thursday', '0600', '1400', 'Spring', 'F', '22446688');
insert into shift values('DISP17SU08001200', 'Sunday', '0800', '1200', 'Spring', 'T', NULL);

--Queries to fill Shift Type table
insert into shift_type values('DISP17MD06001400', 'Dispatcher');
insert into shift_type values('DISP17MD06001400', 'Senior Dispatcher');
insert into shift_type values('DISP17MD06001400', 'Head Dispatcher');
insert into shift_type values('DISP17TU14002200', 'Dispatcher');
insert into shift_type values('DISP17TU14002200', 'Senior Dispatcher');
insert into shift_type values('DISP17TU14002200', 'Head Dispatcher');
insert into shift_type values('OPSP17WE06001400', 'Opener');
insert into shift_type values('PASP17TH06001400', 'Parker');
insert into shift_type values('DISP17SU08001200', 'Dispatcher');
insert into shift_type values('DISP17SU08001200', 'Senior Dispatcher');
insert into shift_type values('DISP17SU08001200', 'Head Dispatcher');

--Queries to fill Rotation Assigned table
insert into rotation_assigned values('DISP17SU08001200', '2017-04-07', '34567891');
insert into rotation_assigned values('DISP17SU08001200', '2017-04-02', '45678912');
insert into rotation_assigned values('DISP17SU08001200', '2017-03-19', '56789012');
insert into rotation_assigned values('DISP17SU08001200', '2017-03-05', '67891234');
insert into rotation_assigned values('DISP17SU08001200', '2017-03-26', '78912345');

--Queries to fill Coverage table
insert into coverage values('DISP17MD06001400', '2017-04-03', NULL, 'F');
insert into coverage values('DISP17TU14002200', '2017-04-04', '12345678', 'T');
insert into coverage values('OPSP17WE06001400', '2017-04-05', NULL, 'F');
insert into coverage values('PASP17TH06001400', '2017-04-06', NULL, 'F');
insert into coverage values('DISP17SU08001200', '2017-04-07', NULL, 'F');

--Queries to fill Parker Shift table
insert into parker_shift values('2017-04-03', '0800', '1200', '03');
insert into parker_shift values('2017-04-10', '1200', '1600', '04');
insert into parker_shift values('2017-04-17', '1600', '2000', '10');
insert into parker_shift values('2017-04-24', '0800', '1200', '05');
insert into parker_shift values('2017-03-27', '1200', '1400', '12');

--Queries to fill Parker Assigned table
insert into parker_assigned values('2017-04-03', '0800', '1200', '22446688');
insert into parker_assigned values('2017-04-10', '1200', '1600', '44444444');
insert into parker_assigned values('2017-04-17', '1600', '2000', '22446688');
insert into parker_assigned values('2017-04-24', '0800', '1200', '89123456');
insert into parker_assigned values('2017-03-27', '1200', '1400', '91234567');
