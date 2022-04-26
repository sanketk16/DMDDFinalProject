CREATE OR REPLACE PROCEDURE sp_insertnewpassenger
(
    fname IN passenger.fname%type,
    lname IN passenger.lname%type,
    email IN passenger.email%type,
    drivers_lic IN passenger.drivers_license%type,
    date_of_birth IN passenger.date_of_birth%type,
    location IN passenger.location%type   
)	
IS
    pid INT;
    same_count NUMBER;
    CURSOR cur IS
     SELECT passengerID FROM passenger;
    cnt NUMBER;
     excep1 EXCEPTION;
BEGIN

    --SELECT COUNT(*) INTO cnt
    --FROM passenger
    --WHERE passengerID = passID;

   -- IF cnt = 1 THEN dbms_output.put_line('ID already exists..');
    --ELSE 
    
        SELECT COUNT(*)
        INTO same_count
        FROM passenger
        WHERE drivers_license = drivers_lic
        AND rownum = 1;
        
        IF same_count = 0 
        THEN 
         INSERT 
         INTO passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location)
           VALUES
                (pass_seq.NEXTVAL, fname, lname, email, drivers_lic, date_of_birth, location);
         ELSE DBMS_OUTPUT.PUT_LINE ('This drivers license already exists chosen another one');
        END IF;

    --END IF;

EXCEPTION
   WHEN excep1 THEN
    dbms_output.put_line('ID already exists..');

    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line('Duplicate ID');
END sp_insertnewpassenger;