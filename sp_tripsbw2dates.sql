create or replace procedure sp_tripsbw2dates
(
    p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type
)
is
    tripid INT;
    pid INT;
    t_date TIMESTAMP;
    car_model VARCHAR(20);
    cursor cur_trip is
        select reservationID, passengerID, pickup_date from reservation
        where pickup_date between p_firstdate and p_seconddate;
    --cursor cur_carm is
        --select car_model from car
        --join reservation
        --on reservation.carID = car.carID
        --where reservation.reservationID IN (select reservationID from reservation
        --where pickup_date between p_firstdate and p_seconddate);
begin
    dbms_output.put_line ('Trips b/w ' || p_firstdate || ' and ' || p_seconddate || ':');
    open cur_trip;
    --open cur_carm;
    loop
        fetch cur_trip into tripid, pid, t_date;
        exit when cur_trip%NOTFOUND;
        dbms_output.put_line ('Date: ' || t_date || ',' || ' Trip ID: '  || tripid || ', Passenger ID: ' || pid);  
    end loop;
    --loop
        --fetch cur_carm into car_model; 
        --exit when cur_carm%NOTFOUND;
        --dbms_output.put_line ('Car Model: ' || car_model);
    --end loop;       
    --close cur_carm; 
    close cur_trip;
      
end sp_tripsbw2dates;