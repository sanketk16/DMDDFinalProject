CREATE OR REPLACE FUNCTION fn_calctripamt (rid IN NUMBER) 
   RETURN DECIMAL
   IS
    cid NUMBER;
	c_cat VARCHAR2 (10);
	total_amt DECIMAL;
	n_days NUMBER;
	n_hours NUMBER;

	BEGIN
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
        
        RETURN total_amt;
END FN_CALCTRIPAMT;
