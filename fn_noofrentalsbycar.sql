CREATE OR REPLACE FUNCTION no_of_rentals_by_car (cid NUMBER) RETURN NUMBER
  IS
  cnt NUMBER;
  BEGIN
    SELECT COALESCE(count(*), 0) INTO cnt
    FROM car
    join reservation on car.carID = reservation.carID
    join tr_transaction on reservation.reservationID = tr_transaction.reservationID
    WHERE tr_transaction.status = 'COMPLETED'
    HAVING car.carID = cid
    GROUP BY car.carID;
    RETURN cnt;
    exception when no_data_found then return 0;
  END no_of_rentals_by_car;