-- Queries for populating each table
into into position values("Dispatcher", 50000);
into into position values("Senior Dispatcher", 50000);
into into position values("Head Dispatcher", 50000);
into into position values("Parking Enforcment Assistant", 50000);
into into position values("Parking Attendant", 50000);
into into position values("Opener", 50000);
into into position values("Closer", 50000);

into into worker values(12345678, "Anthony", "Aardvard");
into into worker values(11223344, "Boris", "Baffulo");
into into worker values(55667788, "Charlene", "Cat");
into into worker values(11335577, "Donna", "Dog");
into into worker values(22446688, "Ethel", "Elephant");

into into works values("Dispatcher", 12345678);
into into works values("Senior Dispatcher", 11223344);
into into works values("Head Dispatcher", 55667788);
into into works values("Opener", 11335577);
into into works values("Parking Attendant", 22446688);

into into shift values("Mon06001400Spr", "Monday", "0600", "1400", "Spring", true, 12345678);
into into shift values("Tue06001400Fal", "Tuesday", "1400", "2200", "Fall", true, 55667788);
into into shift values("Wed06001400Spr", "Wednesday", "0600", "1400", "Spring", true, 11335577);
into into shift values("Thr06001400Spr", "Thursday", "0600", "1400", "Spring", true, 22446688);
into into shift values("Sun06001400Spr", "Sunday", "0600", "1400", "Spring", false, 11223344);

into into shift_type values("Mon06001400Spr", "Dispatcher");
into into shift_type values("Tue06001400Fal", "Dispatcher");
into into shift_type values("Wed06001400Spr", "Opener");
into into shift_type values("Thr06001400Spr", "Parker_Attendant");
into into shift_type values("Sun06001400Spr", "Dispatcher");

into into rotation_assigned values();
into into rotation_assigned values();
into into rotation_assigned values();
into into rotation_assigned values();
into into rotation_assigned values();

into into coverage values("Mon06001400Spr", "2017-04-03", null, false);
into into coverage values("Tue06001400Fal", "2017-04-04", 12345678, true);
into into coverage values("Wed06001400Spr", "2017-04-05", null, true);
into into coverage values("Thr06001400Spr", "2017-04-06", null, false);
into into coverage values("Sun06001400Spr", "2017-04-07", null, false);

into into parker_shift values();
into into parker_shift values();
into into parker_shift values();
into into parker_shift values();
into into parker_shift values();

into into parker_assigned values();
into into parker_assigned values();
into into parker_assigned values();
into into parker_assigned values();
into into parker_assigned values();
