create or replace procedure sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type,
p_seconddate IN reservation.pickup_date%type)
is
trip_count INT;
begin
select count(reservationID) into trip_count from reservation
where pickup_date between p_firstdate and p_seconddate;
dbms_output.put_line ('There were ' || trip_count || ' trips b/w the given dates');
end sp_nooftripsbetweentwodates;