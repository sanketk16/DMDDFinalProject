create or replace PROCEDURE SP_INSNEWCAR 
(
    carID IN car.carID%type,
    brand IN car.brand%type,
    licno IN car.licno%type,
    mfgyear IN car.mfgyear%type,
    color IN car.color%type,
    car_category IN car.car_category%type,
    model IN car.car_model%type
)
IS
BEGIN
  insert into car
  values
  (carID, brand, licno,