create or replace PROCEDURE SP_CHANGECARLICNO (c_id IN car.carID%type, c_newlic IN car.licNO%type)
IS
BEGIN
  UPDATE car
  SET licNO = c_newlic
  WHERE carID = c_id;
END SP_CHANGECARLICNO;