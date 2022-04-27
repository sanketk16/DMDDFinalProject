CREATE OR PROCEDURE sp_reservecar (n_days IN NUMBER, p_date IN DATE, pid IN NUMBER, cid IN NUMBER, slot_no IN VARCHAR2, rid OUT NUMBER)
  AS 
	lt_no NUMBER;
	BEGIN
		SELECT lotNO INTO lt_no
		FROM parking_lot
		WHERE slotnumber = slot_no;
    
		INSERT INTO reservation
		VALUES (resr_seq.NEXTVAL, p_date, p_date + numtodsinterval (n_days, 'DAY'), pid, cid, lt_no);
		
		SELECT resr_seq.CURRVAL INTO rid  FROM dual;
    
   END sp_reservecar;
   
CREATE OR REPLACE PROCEDURE sp_slotstatusupdate (rid IN NUMBER)
   IS
   cid NUMBER;
   BEGIN
    
        SELECT carID INTO cid
        FROM reservation
        WHERE reservationID = rid;
        
        UPDATE parking_lot
        SET current_status = 'VACANT', carid = NULL
        WHERE carID = cid;
        
   END sp_slotstatusupdate;
   
 CREATE OR REPLACE PROCEDURE SP_MAKEPAYMENT  (amount IN DECIMAL, payment_type IN VARCHAR2, rid IN NUMBER)
  IS
  t_inv VARCHAR2 (75);
  count1 NUMBER;
  sts VARCHAR2 (50);
  BEGIN
        
        IF fn_chkpayment (rid) = 1
                THEN DBMS_OUTPUT.PUT_LINE ('Payment already done');
        
        ELSE 
                    t_inv := CONCAT ( CONCAT ('#', rid), tr_seq.NEXTVAL);
                    INSERT INTO tr_transaction
                    VALUES (tr_seq.NEXTVAL, amount, t_inv, SYSDATE, 'COMPLETED', payment_type, rid);
                    SP_SLOTSTATUSUPDATE (rid);
                    DBMS_OUTPUT.PUT_LINE ('Payment Completed for Trip ID: ' || rid);
        END IF;
        
        
END SP_MAKEPAYMENT;