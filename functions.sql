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