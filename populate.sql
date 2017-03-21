-- Queries for populating each table
insert into position values("Dispatcher", 50000);
insert into position values("Senior Dispatcher", 50000);
insert into position values("Parking Enforcment Assistant", 50000);
insert into position values("Parking Attendant", 50000);
insert into position values("Opener", 50000);
insert into position values("Closer", 50000);
insert into position values("Head Dispatcher", 50000);

insert into worker values(11223344, "Audrey", "Hepburn");
insert into worker values(55667788, "Sherlock", "Holmes");
insert into worker values(11335577, "Bill", "Cipher");
insert into worker values(22446688, "Jessica", "Jones");
insert into worker values(11111111, "Amy", "Pond");
insert into worker values(22222222, "Sheldon", "Cooper");
insert into worker values(33333333, "Mabel", "Pines");
insert into worker values(44444444, "Gideon", "Flower");
insert into worker values(12345678, "Kitty", "Purr");
insert into worker values(66666666, "River", "Song");
insert into worker values(23456789, "Dextra", "Ulta");
insert into worker values(34567891, "Harold", "Mossimo");
insert into worker values(45678912, "Thorin", "Oakenshield");
insert into worker values(56789012, "Martin", "Freeman");
insert into worker values(67891234, "Bilbo", "Baggins");
insert into worker values(78912345, "Leo", "Tolstoy");
insert into worker values(89123456, "Trixie", "Adipose");
insert into worker values(91234567, "Svetlana", "Livingstone");
insert into worker values(98765432, "Scooby", "Doo");
insert into worker values(87654321, "Donna", "Noble");
insert into worker values(76543219, "Harry", "Potter");
insert into worker values(65432198, "Draco", "Malfoy");
insert into worker values(54321987, "Hermione", "Granger");
insert into worker values(43219876, "Ron", "Weasley");
insert into worker values(32198765, "Donita", "Paul");
insert into worker values(21987654, "Rosie", "Williams");
insert into worker values(19876543, "Tad", "Doctor");
insert into worker values(11112222, "John", "Smith");
insert into worker values(33334444, "Jim", "Gordon");
insert into worker values(55556666, "Bruce", "Wayne");

insert into works values("Dispatcher", 12345678);
insert into works values("Senior Dispatcher", 11223344);
insert into works values("Head Dispatcher", 55667788);
insert into works values("Opener", 11335577);
insert into works values("Parking Attendant", 22446688);
insert into works values("Closer", 11111111);
insert into works values("Opener", 22222222);
insert into works values("Closer", 33333333);
insert into works values("Parking Attendant", 44444444);
insert into works values("Parking Enforcement Assistant", 66666666);
insert into works values("Senior Dispatcher", 23456789);

insert into shift values("DISP17MD06001400", "Monday", "0600", "1400", "Spring", true, 12345678);
insert into shift values("DISP17TU14002200", "Tuesday", "1400", "2200", "Spring", true, 55667788);
insert into shift values("OPSP17WE06001400", "Wednesday", "0600", "1400", "Spring", true, 11335577);
insert into shift values("PASP17TH06001400", "Thursday", "0600", "1400", "Spring", true, 22446688);
insert into shift values("DISP17SU08001200", "Sunday", "0800", "1200", "Spring", false, 11223344);

insert into shift_type values("DISP17MD06001400", "Dispatcher");
insert into shift_type values("DISP17TU14002200", "Dispatcher");
insert into shift_type values("OPSP17WE06001400", "Opener");
insert into shift_type values("PASP17TH06001400", "Parker Attendant");
insert into shift_type values("DISP17SU08001200", "Dispatcher");

insert into rotation_assigned values();
insert into rotation_assigned values();
insert into rotation_assigned values();
insert into rotation_assigned values();
insert into rotation_assigned values();

insert into coverage values("DISP17MD06001400", "2017-04-03", null, false);
insert into coverage values("DISP17TU14002200", "2017-04-04", 12345678, true);
insert into coverage values("OPSP17WE06001400", "2017-04-05", null, true);
insert into coverage values("PASP17TH06001400", "2017-04-06", null, false);
insert into coverage values("DISP17SU08001200", "2017-04-07", null, false);

insert into parker_shift values();
insert into parker_shift values();
insert into parker_shift values();
insert into parker_shift values();
insert into parker_shift values();

insert into parker_assigned values();
insert into parker_assigned values();
insert into parker_assigned values();
insert into parker_assigned values();
insert into parker_assigned values();
