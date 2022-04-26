create or replace procedure sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type,
p_seconddate IN reservation.pickup_date%type)
is
tripid INT;
begin
select reservationID into tripid from reservation
where pickup_date between p_firstdate and p_seconddate
fetch first 1 rows only;
dbms_output.put_line (tripid || ' is the tripid of the 1st trip b/w given dates');
end sp_1sttripbetweentwodates;