--More requirements

--all jobs can request a shift off
insert into coverage values ('DISP17SU08001200', '04/15/2017', NULL, 'F');
    -- Result: The SQL command completed successfully.

--Supervisors need to be able to maintain a list of shifts requested off
--      example for one position:   *this is not currently working.
create view dispatch_coverage_requests as
    select coverage.c_date, shift.sid, shift.day, shift.start_time,
            shift.end_time, shift.term, coverage.mandatory
    from (select * from shift join shift_type on shift.sid = shift_type.sid
            where shift_type.pos_name = 'Dispatcher') join coverage
            on shift.sid = coverage.sid
    order by coverage.c_date, shift.start_time;
grant select on dispatch_coverage_requests to user james;
grant select on dispatch_coverage_requests to user anna;
grant select on dispatch_coverage_requests to user bjork;

--Supervisors need to beable to maintain a list of un-filled shifts requested
--      coverage that are approved as mandatory.   *this is not currently working.


create view mandatory_unfilled_dispatch_coverage as
    select C_Date, sid, day, start_time, end_time, term
    from dispatch_coverage_requests join shift on sid
    where mandatory = 'T' and shift.gid not null;
grant select on mandatory_unfilled_dispatch_coverage to user james;
grant select on mandatory_unfilled_dispatch_coverage to user anna;
grant select on mandatory_unfilled_dispatch_coverage to user bjork;


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

--Supervisors need to be able to list dates and times for which parkers are
--      required along with a number of parkers required.
select * from parker_shift;

--Supervisors need to be able to see what parker shifts are filled or open.
--                      *Not currently working correctly.
create view parker_shift_status as
    select parker_shift.p_date, parker_shift.start_time, parker_shift.end_time,
    parker_shift.num_req, count(parker_assigned.gid)
    from parker_shift join parker_assigned
    on parker_shift.p_date = parker_assigned.p_date and
        parker_shift.start_time = parker_assigned.start_time and
        parker_shift.end_time = parker_assigned.end_time
    group by parker_shift.p_date and parker_shift.start_time
    and parker_shift.end_time;



--- Created View results (at one point in time in testing) below:


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
