CREATE OR REPLACE PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%TYPE, p_newemail IN passenger.email%TYPE)
IS 
same_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO same_count
  FROM passenger
  WHERE email = p_newemail
  AND rownum = 1;

  IF same_count = 0 
  THEN 
    UPDATE passenger
    SET email = p_newemail
    WHERE passengerID = p_id;
  ELSE DBMS_OUTPUT.PUT_LINE ('This Email ID is already in use');
  END IF;
END sp_changepassemail;