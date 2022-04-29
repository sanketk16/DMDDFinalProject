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
