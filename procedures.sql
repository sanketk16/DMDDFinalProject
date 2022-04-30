CREATE OR REPLACE PROCEDURE sp_changecarlicno (c_id IN car.carID%type, c_newlic IN car.licNO%type) AS
  BEGIN
    UPDATE car
    SET licNO = c_newlic
    WHERE carID = c_id;

    DBMS_OUTPUT.PUT_LINE ('The license no. of car with ID: ' || c_id || ' has been changed to ' || c_newlic);
  END sp_changecarlicno;
  
CREATE OR REPLACE PROCEDURE sp_insertnewpassenger
                               (
                                   fname         IN passenger.fname%type
                                 , lname         IN passenger.lname%type
                                 , email         IN passenger.email%type
                                 , drivers_lic   IN passenger.drivers_license%type
                                 , date_of_birth IN passenger.date_of_birth%type
                                 , location      IN passenger.location%type
                               )
IS
    pid        INT;
    same_count NUMBER;
    CURSOR cur IS
        SELECT
               passengerID
        FROM
               passenger
        ;
    
    cnt    NUMBER;
    excep1 EXCEPTION;
	excep2 EXCEPTION;
	excep3 EXCEPTION;
	excep4 EXCEPTION;
    excep5 EXCEPTION;
BEGIN
    --SELECT COUNT(*) INTO cnt
    --FROM passenger
    --WHERE passengerID = passID;
    -- IF cnt = 1 THEN dbms_output.put_line('ID already exists..');
    --ELSE
	IF (fname IS NULL OR lname IS NULL OR email IS NULL OR drivers_lic IS NULL OR date_of_birth IS NULL OR location IS NULL)
	THEN RAISE excep1;
	
	ELSIF email NOT LIKE '%@%.%'
	THEN RAISE excep2;
	
	--ELSIF REGEXP_LIKE (date_of_birth, '[^0-9, -/]')
	ELSIF is_valid_date (date_of_birth, 'YYYY/MM/DD') <> 'Y' 
	--ELSIF (REGEXP_LIKE (date_of_birth, '^[0-9]{4}/[0-9]{2}/[0-9]{2}$')) OR EXTRACT (DAY FROM date_of_birth) > 31 OR EXTRACT (MONTH FROM date_of_birth) > 12
	THEN RAISE excep3;
    
    --ELSIF REGEXP_LIKE (date_of_birth, '^[a-zA-Z]*$')
    --THEN RAISE excep5;
	
	ELSE 
		SELECT
           COUNT(*)
		INTO
           same_count
		FROM
           passenger
		WHERE
           drivers_license = drivers_lic
        AND rownum      = 1
    ;
    
		IF same_count = 0 THEN
			INSERT         INTO passenger
               (passengerID
                    , fname
                    , lname
                    , email
                    , drivers_license
                    , date_of_birth
                    , location
               )
               VALUES
               (pass_seq.NEXTVAL
                    , fname
                    , lname
                    , email
                    , drivers_lic
                    , TO_DATE (date_of_birth, 'YYYY/MM/DD')
                    , location
               )
        ;
    
		ELSE
			RAISE excep4;
			DBMS_OUTPUT.PUT_LINE ('This drivers license already exists chosen another one');
		END IF;
    END IF;
EXCEPTION
	WHEN excep1 THEN
		dbms_output.put_line ('Please enter all fields for the passenger');
	WHEN excep2 THEN
		dbms_output.put_line ('Please enter correct format for Email ID');
	WHEN excep3 THEN
		dbms_output.put_line ('Please enter correct format for birth date: YYYY/MM/DD');
	WHEN excep4 THEN
		dbms_output.put_line ('This drivers license already exists chosen another one');
    WHEN excep5 THEN 
        dbms_output.put_line ('Alphabets found in date!');
	WHEN OTHERS THEN
		dbms_output.put_line(SQLERRM);
		dbms_output.put_line('Duplicate ID');
END sp_insertnewpassenger;


CREATE OR REPLACE PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type) 
  AS
  BEGIN

    UPDATE passenger
    SET email = p_newemail
    WHERE passengerID = p_id;

  END sp_changepassemail;
  
  PROCEDURE sp_reservecar (n_days IN NUMBER, booking_date IN TIMESTAMP, pid IN NUMBER, cid IN NUMBER, slot_no IN VARCHAR2, rid OUT NUMBER)
  AS 
	lt_no NUMBER;
    car_already_booked_exception EXCEPTION;
    is_open NUMBER;
    CURSOR cur IS 
        SELECT carID FROM reservation WHERE return_date IS NULL;
	BEGIN
    
        OPEN cur;
        
        LOOP
        FETCH cur INTO is_open ;
        --DBMS_OUTPUT.PUT_LINE (is_open);
        EXIT WHEN CUR%FOUND;
        END LOOP;
        
        IF cid = is_open
        THEN DBMS_OUTPUT.PUT_LINE ('This car is already booked');
        
        ELSE
		SELECT lotNO INTO lt_no
		FROM parking_lot
		WHERE slotnumber = slot_no;
    
		INSERT INTO reservation
		VALUES (resr_seq.NEXTVAL, booking_date, booking_date + numtodsinterval (n_days, 'DAY'), pid, cid, lt_no);
		
		SELECT resr_seq.CURRVAL INTO rid  FROM dual;
        
        END IF;
    
    EXCEPTION
        WHEN car_already_booked_exception THEN
            DBMS_OUTPUT.PUT_LINE ('This car is already booked');
    
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
  inv_payment EXCEPTION;
  BEGIN
        
        IF rid <> resr_seq.CURRVAL 
        THEN RAISE inv_payment;
        
        ELSE
        IF fn_chkpayment (rid) = 1
                THEN DBMS_OUTPUT.PUT_LINE ('Payment already done');
        
        ELSE 
                    t_inv := CONCAT ( CONCAT ('#', rid), tr_seq.NEXTVAL);
                    INSERT INTO tr_transaction
                    VALUES (tr_seq.NEXTVAL, amount, t_inv, SYSDATE, 'COMPLETED', payment_type, rid);
                    DBMS_OUTPUT.PUT_LINE ('Payment Completed for Trip ID: ' || rid);
        END IF;
    END IF;
        
    EXCEPTION
     WHEN inv_payment THEN DBMS_OUTPUT.PUT_LINE ('Payment Failed');
        
        
END SP_MAKEPAYMENT;
	
	
CREATE OR REPLACE PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER)
	IS
	c_status VARCHAR2 (10);
	count1 NUMBER;
    no_slot EXCEPTION;
	BEGIN
    
        IF l_name = 'No vacant locations available'
        THEN RAISE no_slot;
        
        
        ELSE
        SELECT current_status INTO c_status
        FROM parking_lot
        WHERE lotname = l_name;
        
        SELECT COUNT(*) INTO count1
        FROM parking_lot
        WHERE carID = cid;
        
        IF count1 = 0
        THEN 
            IF (c_status = 'VACANT')
            THEN
                UPDATE parking_lot
                SET current_status = 'OCCUPIED', carID = cid
                WHERE lotname = l_name;
                 DBMS_OUTPUT.PUT_LINE ('Your car has been parked at lot ' || l_name);
             END IF;
        ELSE DBMS_OUTPUT.PUT_LINE ('This car is already parked at some location!');
        END IF;
    END IF;
    EXCEPTION
            WHEN no_slot
            THEN DBMS_OUTPUT.PUT_LINE ('No slot currently available for parking');
    
	END SP_PARKCAR;
	
	
	CREATE OR REPLACE PROCEDURE sp_insertnewemp  
  (
    ename IN employee.full_name%type,
    dob IN employee.emp_dob%type,
    sal IN employee.salary%type,
    deptid IN employee.deptid%type
  ) 
  IS
  BEGIN
        insert into employee
        values
         (emp_seq.NEXTVAL, ename, dob, sal, deptid);
  END sp_insertnewemp;

  CREATE OR REPLACE PROCEDURE sp_chgticketresolvedstatus  (tktno IN NUMBER) AS
  BEGIN
    UPDATE customer_support
        SET ticketstatus = 'RESOLVED',
        ticket_resolved_ts = SYSDATE
        WHERE ticketno = tktno;

        DBMS_OUTPUT.put_line('Status updated to resolved for ticket number ' || tktno);
  END SP_CHGTICKETRESOLVEDSTATUS;
  
  
  CREATE OR REPLACE PROCEDURE sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    tripid INT;
    begin
    select reservationID into tripid from reservation
    where pickup_date between p_firstdate and p_seconddate
    fetch first 1 rows only;
    dbms_output.put_line (tripid || ' is the tripid of the 1st trip b/w given dates');
    end sp_1sttripbetweentwodates;

    CREATE OR REPLACE PROCEDURE sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    trip_count INT;
    begin
    select count(reservationID) into trip_count from reservation
    where pickup_date between p_firstdate and p_seconddate;
    dbms_output.put_line ('There were ' || trip_count || ' trips b/w the given dates');
    end sp_nooftripsbetweentwodates;

    CREATE OR REPLACE PROCEDURE sp_rating_for_trip (tripID IN INT )
    is
    star_rating NUMBER;
    begin
    select  user_review.rating_in_stars INTO star_rating
    from reservation join user_review
    on reservation.reservationID = user_review.reservationID
    where reservation.reservationID = tripid;

    DBMS_OUTPUT.put_line('Rating for tripid ' || tripID || ' was ' || star_rating);
    end sp_rating_for_trip;

    CREATE OR REPLACE PROCEDURE sp_tripsbw2dates ( p_firstdate IN reservation.pickup_date%type,  p_seconddate IN reservation.pickup_date%type)
    is    
        tripid INT;
        pid INT;
         t_date TIMESTAMP;
         car_model VARCHAR(20);
    cursor cur_trip is
        select reservationID, passengerID, pickup_date from reservation
        where pickup_date between p_firstdate and p_seconddate;
    begin
         dbms_output.put_line ('Trips b/w ' || p_firstdate || ' and ' || p_seconddate || ':');
     open cur_trip;
     loop
        fetch cur_trip into tripid, pid, t_date;
        exit when cur_trip%NOTFOUND;
        dbms_output.put_line ('Date: ' || t_date || ',' || ' Trip ID: '  || tripid || ', Passenger ID: ' || pid);  
    end loop;
    close cur_trip;

    end sp_tripsbw2dates;

    CREATE OR REPLACE PROCEDURE SP_GENERATERECEIPTS   (start_month IN NUMBER, end_month IN NUMBER, yr IN VARCHAR2)

    IS
    trp_amt FLOAT;
    trp_inv VARCHAR2 (50);
    trp_date TIMESTAMP;
    trp_day VARCHAR2(10);
    trp_month VARCHAR2(10);
    trp_payment_type VARCHAR2 (20);
    CURSOR cur IS
        --SELECT trip_invoice, trip_amount, transaction_date, payment_type
        SELECT trip_invoice, trip_amount, EXTRACT (MONTH FROM transaction_date), EXTRACT (DAY FROM transaction_date), payment_type
        FROM tr_transaction
        WHERE(EXTRACT (month FROM transaction_date) BETWEEN start_month AND end_month) AND (EXTRACT (year FROM transaction_date) = yr AND status = 'COMPLETED');

    BEGIN

            dbms_output.put_line ('Receipt List is as folllows...  ');
            dbms_output.put_line ('                                           ');
            OPEN cur;

            LOOP

                FETCH cur INTO trp_inv, trp_amt, trp_month, trp_day, trp_payment_type;
                EXIT WHEN cur%NOTFOUND;

                 dbms_output.put_line('Trip invoice#   ' || 'Total trip cost   ' || 'Date   ' || 'Payment Mode   ');
                 dbms_output.put_line (trp_inv || '   ' || trp_amt || '   ' || '(' || trp_month || '/' || trp_day || ')' || '   ' || trp_payment_type);

            END LOOP;

            CLOSE cur;

    END SP_GENERATERECEIPTS;