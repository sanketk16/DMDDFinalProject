CREATE OR REPLACE PACKAGE pkg_car
IS
    PROCEDURE sp_insnewcar (
    brand IN car.brand%type,
    licnum IN car.licno%type,
    mfgyear IN car.mfgyear%type,
    color IN car.color%type,
    car_category IN car.car_category%type,
    model IN car.car_model%type);
    
    PROCEDURE sp_changecarlicno (c_id IN car.carID%type, c_newlic IN car.licNO%type);
    FUNCTION no_of_rentals_by_car (cid NUMBER) RETURN NUMBER;
    FUNCTION isReserved (cid NUMBER) RETURN NUMBER;
END pkg_car;

/

CREATE OR REPLACE PACKAGE BODY pkg_car
IS
  PROCEDURE sp_insnewcar 
(
    brand IN car.brand%type,
    licnum IN car.licno%type,
    mfgyear IN car.mfgyear%type,
    color IN car.color%type,
    car_category IN car.car_category%type,
    model IN car.car_model%type
)
IS
    same_count NUMBER;
BEGIN

  SELECT COUNT(*)
  INTO same_count
  FROM car
  WHERE licNO = licnum
  AND rownum = 1;
  
  IF same_count = 0 
  THEN 
    INSERT INTO car
    VALUES
        (car_seq.NEXTVAL, brand, licnum, mfgyear, color, car_category, model);
  ELSE DBMS_OUTPUT.PUT_LINE ('License Number already exists');
  END IF;
END sp_insnewcar;




  PROCEDURE sp_changecarlicno (c_id IN car.carID%type, c_newlic IN car.licNO%type) AS
  BEGIN
    UPDATE car
    SET licNO = c_newlic
    WHERE carID = c_id;

    DBMS_OUTPUT.PUT_LINE ('The license no. of car with ID: ' || c_id || ' has been changed to ' || c_newlic);
  END sp_changecarlicno;

  FUNCTION no_of_rentals_by_car (cid NUMBER) RETURN NUMBER
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
  
  FUNCTION isReserved (cid NUMBER)
  RETURN NUMBER
  IS
    cnt NUMBER;
        BEGIN
            SELECT COUNT (*) INTO cnt
            FROM car c JOIN
             reservation r  ON c.carID = r.carID;
             --WHERE return_date IS NULL;
             --JOIN tr_transaction t ON r.reservationID = t.reservationID
             --WHERE t.status = 'COMPLETED';
             
            IF cnt > 0 THEN
               RETURN 1;
               
            ELSE RETURN 0;
            END IF;
            
    END isReserved;
             

END pkg_car;

/

CREATE OR REPLACE PACKAGE pkg_passenger 
IS
     PROCEDURE sp_insertnewpassenger
                               (
                                   fname         IN passenger.fname%type
                                 , lname         IN passenger.lname%type
                                 , email         IN passenger.email%type
                                 , drivers_lic   IN passenger.drivers_license%type
                                 , date_of_birth IN passenger.date_of_birth%type
                                 , location      IN passenger.location%type
                               );

    PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type);
	PROCEDURE sp_reservecar (n_days IN NUMBER, booking_date IN TIMESTAMP, pid IN NUMBER, cid IN NUMBER, slot_no IN VARCHAR2, rid OUT NUMBER);
	PROCEDURE sp_slotstatusupdate (rid IN NUMBER);
	PROCEDURE sp_makepayment (amount IN DECIMAL, payment_type IN VARCHAR2, rid IN NUMBER);
	--PROCEDURE sp_findvacantslots (curr_loc NUMBER);
	PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER);
	
	FUNCTION fn_findnearbyvacantslot (curr_loc NUMBER) RETURN VARCHAR2;
    FUNCTION firstVacantCar RETURN NUMBER;
END pkg_passenger;

/

CREATE OR REPLACE PACKAGE BODY pkg_passenger
IS
  PROCEDURE sp_insertnewpassenger
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



  PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type) 
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
        DBMS_OUTPUT.PUT_LINE (is_open);
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
   
   PROCEDURE sp_slotstatusupdate (rid IN NUMBER)
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
   
   PROCEDURE SP_MAKEPAYMENT  (amount IN DECIMAL, payment_type IN VARCHAR2, rid IN NUMBER)
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
	
	
	PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER)
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
	
	FUNCTION fn_findnearbyvacantslot (curr_loc NUMBER)
	RETURN VARCHAR2  
	IS
	lot_name VARCHAR2 (50);
	lcn VARCHAR2 (50);
	min_zip_dist NUMBER;
	BEGIN
        
         SELECT lotname INTO lot_name
         FROM parking_lot
         WHERE current_status = 'VACANT'
         --ORDER BY 1 ASC
         ORDER BY (ABS (curr_loc - location) ) ASC
         FETCH FIRST 1 ROWS ONLY;
         
         SELECT location INTO lcn
         FROM parking_lot
         WHERE current_status = 'VACANT'
         --ORDER BY 1 ASC
         ORDER BY (ABS (curr_loc - location) ) ASC
         FETCH FIRST 1 ROWS ONLY;
         
        DBMS_OUTPUT.PUT_LINE ('The lot ' || lot_name || ' at location ' || lcn || ' is the closest vacant lot from your location');
        RETURN lot_name;
        
	EXCEPTION
        WHEN NO_DATA_FOUND
        THEN RETURN 'No vacant locations available';


	END FN_FINDNEARBYVACANTSLOT;
    
    FUNCTION firstVacantCar
    RETURN NUMBER
    IS
    is_open NUMBER;
    CURSOR cur IS 
        SELECT carID FROM reservation WHERE return_date IS NOT NULL;
    BEGIN
    OPEN cur;
        
        LOOP
        FETCH cur INTO is_open ;
        EXIT WHEN CUR%FOUND;
        END LOOP;
        
        RETURN is_open;
    END firstVacantCar;

END pkg_passenger;

/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgpass FOR admin.pkg_passenger;
GRANT EXECUTE ON syn_pkgpass TO employee;

GRANT EXECUTE ON pkg_passenger TO passenger;

CREATE OR REPLACE PACKAGE pkg_employee AS 
    
    PROCEDURE sp_insertnewemp  
(
    ename IN employee.full_name%type,
    dob IN employee.emp_dob%type,
    sal IN employee.salary%type,
    deptid IN employee.deptid%type
);
    
    PROCEDURE SP_CHGTICKETRESOLVEDSTATUS  (tktno IN NUMBER);
    FUNCTION tickets_solved_by_emp (eid NUMBER) RETURN NUMBER;
END pkg_employee;

/

CREATE OR REPLACE PACKAGE BODY pkg_employee
IS
  PROCEDURE sp_insertnewemp  
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

  PROCEDURE sp_chgticketresolvedstatus  (tktno IN NUMBER) AS
  BEGIN
    UPDATE customer_support
        SET ticketstatus = 'RESOLVED',
        ticket_resolved_ts = SYSDATE
        WHERE ticketno = tktno;

        DBMS_OUTPUT.put_line('Status updated to resolved for ticket number ' || tktno);
  END SP_CHGTICKETRESOLVEDSTATUS;

  FUNCTION tickets_solved_by_emp (eid NUMBER) RETURN NUMBER
  IS
  cnt NUMBER;
  BEGIN
        SELECT COALESCE(count(ticketNO), 0) INTO cnt
        FROM employee
        JOIN customer_support on employee.empID = customer_support.empID
        WHERE customer_support.ticketStatus = 'RESOLVED'
        HAVING employee.empID = eid
        GROUP BY employee.empID;
        RETURN cnt;
   EXCEPTION WHEN no_data_found THEN RETURN 0;
  END tickets_solved_by_emp;

END pkg_employee;

/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgemp FOR admin.pkg_employee;
GRANT EXECUTE ON syn_pkgemp TO employee;
GRANT EXECUTE ON pkg_employee TO employee;



/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgcar FOR admin.pkg_car;
GRANT EXECUTE ON syn_pkgcar TO employee;

GRANT EXECUTE ON pkg_car TO employee;

CREATE OR REPLACE PACKAGE pkg_reservation 
IS
    FUNCTION total_bookings_by_a_passenger (pid NUMBER) RETURN NUMBER;
	FUNCTION fn_calctripamt (rid IN NUMBER) RETURN DECIMAL;
    FUNCTION FN_CHKPAYMENT  (rid NUMBER) RETURN NUMBER;
    PROCEDURE sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_rating_for_trip  ( tripID IN INT);
    PROCEDURE sp_tripsbw2dates ( p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_generatereceipts   (start_month IN NUMBER, end_month IN NUMBER, yr IN VARCHAR2);
END pkg_reservation;

/

create or replace PACKAGE BODY pkg_reservation
IS
    -- Function Implementation
    FUNCTION total_bookings_by_a_passenger (pid NUMBER)  
	RETURN NUMBER
    IS 
    cnt NUMBER;
    BEGIN

        SELECT COALESCE(count(*), 0) INTO cnt
        FROM passenger
        join reservation on passenger.passengerID = reservation.reservationID
        join tr_transaction on reservation.reservationID = tr_transaction.reservationID
        WHERE tr_transaction.status = 'COMPLETED'
        AND passenger.passengerID = pid
        GROUP BY passenger.passengerID;

        RETURN cnt;
    EXCEPTION when no_data_found then return 0;
   END total_bookings_by_a_passenger;
   
   FUNCTION fn_calctripamt (rid IN NUMBER) 
   RETURN DECIMAL
   IS
    cid NUMBER;
	c_cat VARCHAR2 (10);
	total_amt DECIMAL;
	n_days NUMBER;
	n_hours NUMBER;
    l_count NUMBER;

	BEGIN
    
        SELECT COUNT (*) INTO l_count
        FROM reservation
        WHERE reservationID = rid;
        
        IF l_count = 0 
         THEN DBMS_OUTPUT.PUT_LINE ('Invalid payment  for reservation ID');
         
        ELSE
        SELECT carID INTO cid
        FROM reservation
        WHERE reservationid = rid;
        
        SELECT car_category INTO c_cat
        FROM car
        WHERE carID = cid;
        
        SELECT (CAST (return_date AS DATE) - CAST (pickup_date AS DATE)) INTO n_days
        FROM reservation
        WHERE reservationID = rid;
        
        SELECT ABS(24*extract(day from diff)+extract(hour from diff)) hrs INTO n_hours FROM 
             (
				SELECT
				reservationID,
				TO_TIMESTAMP(  return_date, 'YYYY-MM-DD HH24:MI:SS') -
				TO_TIMESTAMP(   pickup_date, 'YYYY-MM-DD HH24:MI:SS') diff
				FROM reservation
				WHERE reservationID = rid
            );
        
        CASE
            WHEN c_cat = 'sedan'
            --THEN total_amt := (n_days) * 40;
            THEN total_amt := n_hours *12;
            
            WHEN c_cat = 'SUV'
            --THEN total_amt := (n_days) * 50;
            THEN total_amt := n_hours * 15;
            
            WHEN c_cat = 'hatchback'
            --THEN total_amt := (n_days) * 30;
            THEN total_amt := n_hours * 8;
            
            WHEN c_cat = 'minivan'
            --THEN total_amt := (n_days) * 35;
            THEN total_amt := n_hours * 10;
        END CASE;
        
        END IF;
        
        RETURN total_amt;
    END FN_CALCTRIPAMT;
    
    FUNCTION FN_CHKPAYMENT  (rid NUMBER)
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
	
   -- Procedure Implementation
   
   PROCEDURE sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    tripid INT;
    begin
    select reservationID into tripid from reservation
    where pickup_date between p_firstdate and p_seconddate
    fetch first 1 rows only;
    dbms_output.put_line (tripid || ' is the tripid of the 1st trip b/w given dates');
    end sp_1sttripbetweentwodates;

    PROCEDURE sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    trip_count INT;
    begin
    select count(reservationID) into trip_count from reservation
    where pickup_date between p_firstdate and p_seconddate;
    dbms_output.put_line ('There were ' || trip_count || ' trips b/w the given dates');
    end sp_nooftripsbetweentwodates;

    PROCEDURE sp_rating_for_trip (tripID IN INT )
    is
    star_rating NUMBER;
    begin
    select  user_review.rating_in_stars INTO star_rating
    from reservation join user_review
    on reservation.reservationID = user_review.reservationID
    where reservation.reservationID = tripid;

    DBMS_OUTPUT.put_line('Rating for tripid ' || tripID || ' was ' || star_rating);
    end sp_rating_for_trip;

    PROCEDURE sp_tripsbw2dates ( p_firstdate IN reservation.pickup_date%type,  p_seconddate IN reservation.pickup_date%type)
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

    PROCEDURE SP_GENERATERECEIPTS   (start_month IN NUMBER, end_month IN NUMBER, yr IN VARCHAR2)

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

END pkg_reservation;

/