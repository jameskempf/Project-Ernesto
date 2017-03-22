-- More requirements
-- (Both files just a subset of the very large list of requirements)

--Dispatchers can request a shift off
insert into coverage values ('DISP17SU08001200', '04/15/2017', NULL, 'F');
    -- Result: The SQL command completed successfully.


--Supervisors need to be able to assign dispatch Sunday rotation shifts.
insert into rotation_assigned values ('DISP17MD00000100', '03/27/2017', '55667788');
    --Result:  The SQL command completed successfully.

--Supervisors need to be able to maintain a list of students assigned to each
--  rotation date.
create view rotation_list as
    select a_date, first, last, sid
    from rotation_assigned join worker
    on rotation_assigned.gid = worker.gid;
grant select on rotation_list to user james;
grant select on rotation_list to user anna;
grant select on rotation_list to user bjork;

-- Result as follows:

db2 => create view rotation_list as
    select a_date, first, last, sid
    from rotation_assigned join worker
    on rotation_assigned.gid = worker.gid;db2 (cont.) => db2 (cont.) => db2 (cont.) =>
DB20000I  The SQL command completed successfully.
db2 => select * from rotation_list;

A_DATE     FIRST                LAST                 SID
---------- -------------------- -------------------- ----------------
04/07/2017 test                 person               DISP17MD00000100

  1 record(s) selected.


--Supervisors need to be able to list dates and times for which parkers are
--      required along with a number of parkers required.
select * from parker_shift;

--Result from above as follows:
db2 => select * from parker_shift;

P_DATE     START_TIME  END_TIME    NUM_REQ
---------- ----------- ----------- -----------
04/03/2017         800        1200           3
04/10/2017        1200        1600           4
04/17/2017        1600        2000          10
04/24/2017         800        1200           5
03/27/2017        1200        1400          12

  5 record(s) selected.

--Supervisors need to be able to maintain a list of shifts requested off
--      example for one position:   can be modified for each position
create view dispatch_coverage_requests as
    select coverage.c_date, shift.sid, shift.day, shift.start_time,
        shift.end_time, shift.term, coverage.mandatory
        from shift join shift_type on shift.sid = shift_type.sid
        join coverage on shift.sid = coverage.sid
        where shift_type.pos_name = 'Dispatcher' ;
grant select on dispatch_coverage_requests to user james;
grant select on dispatch_coverage_requests to user anna;
grant select on dispatch_coverage_requests to user bjork;

-- Result is as follows:
DB20000I  The SQL command completed successfully.
db2 => select * from dispatch_coverage_requests;

  C_DATE     SID              DAY        START_TIME  END_TIME    TERM            MANDATORY
  ---------- ---------------- ---------- ----------- ----------- --------------- ---------
  04/03/2017 DISP17MD06001400 Monday             600        1400 Spring          F
  04/04/2017 DISP17TU14002200 Tuesday           1400        2200 Spring          T
  04/07/2017 DISP17SU08001200 Sunday             800        1200 Spring          F

    3 record(s) selected.

--Supervisors need to beable to maintain a list of un-filled shifts requested
--      coverage that are approved as mandatory.   can be modified for each pos.
create view mandatory_unfilled_dispatch_coverage as
    select coverage.c_date, shift.sid, shift.day, shift.start_time,
                        shift.end_time, shift.term
        from shift join shift_type on shift.sid = shift_type.sid
        join coverage on shift.sid = coverage.sid
        where shift_type.pos_name = 'Dispatcher'
        and coverage.mandatory = 'T' and shift.gid is not null;
grant select on mandatory_unfilled_dispatch_coverage to user james;
grant select on mandatory_unfilled_dispatch_coverage to user anna;
grant select on mandatory_unfilled_dispatch_coverage to user bjork;

-- Result is as follows:
DB20000I  The SQL command completed successfully.
db2 =>
db2 => select * from mandatory_unfilled_dispatch_coverage;

C_DATE     SID              DAY        START_TIME  END_TIME    TERM
---------- ---------------- ---------- ----------- ----------- ---------------
04/04/2017 DISP17TU14002200 Tuesday           1400        2200 Spring

     1 record(s) selected.

--------Requirements started but still in development appear below-------------


--Supervisors need to be able to see what parker shifts are filled or open.
--                      *Not currently working correctly.
create view parker_shift_status as
    select parker_shift.p_date, parker_shift.start_time, parker_shift.end_time,
        parker_shift.num_req, count(parker_assigned.gid) as num_filled
        from parker_shift, parker_assigned
        where parker_shift.p_date = parker_assigned.p_date
            and parker_shift.start_time = parker_assigned.start_time
            and parker_shift.end_time = parker_assigned.end_time
        group by parker_shift.p_date and parker_shift.start_time
            and parker_shift.end_time;
