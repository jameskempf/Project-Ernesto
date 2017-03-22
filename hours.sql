-- Total shift hours for an employee
select coverage.gid, sum((case
        when end_time > start_time
            then end_time - start_time
        else 2400 - start_time + end_time
    end))/100 as total_hours
    from coverage join shift
        on coverage.sid = shift.sid
    where gid is not null
    group by gid;

-- Total weekly hours of coverages for an employee
select coverage.gid, sum((case
        when end_time > start_time
            then end_time - start_time
        else 2400 - start_time + end_time
    end))/100 as total_hours
    from coverage join shift
        on coverage.sid = shift.sid
    where gid is not null
    group by gid;
