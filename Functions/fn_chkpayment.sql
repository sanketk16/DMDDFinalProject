CREATE OR REPLACE FUNCTION FN_CHKPAYMENT  (rid NUMBER)
    RETURN NUMBER 
    AS 
    a NUMBER;
    st VARCHAR2 (50);
    l_count NUMBER;
    BEGIN
     a := 0;
  --SELECT status INTO st FROM tr_transaction
  --WHERE reservationid = rid;
  
    SELECT COUNT(*) INTO l_count
    FROM tr_transaction JOIN reservation
    ON tr_transaction.reservationID = reservation.reservationID
    WHERE tr_transaction.status = 'COMPLETED' AND reservation.reservationID = rid;
    
 -- IF st = 'COMPLETED'
    IF l_count > 0
    THEN
        RETURN 1;
    ELSE RETURN 0;
    END IF;
END FN_CHKPAYMENT;
