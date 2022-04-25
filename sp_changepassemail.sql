create or replace PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type)
IS 
BEGIN
  UPDATE passenger
  SET email = p_newemail
  WHERE passengerID = p_id;
END sp_changepassemail;