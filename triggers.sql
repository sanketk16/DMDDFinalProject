-- TRIGGERS

CREATE OR REPLACE TRIGGER TRG_EMP_SALARY 
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE ('Employee ID: ' || :OLD.empID);
 DBMS_OUTPUT.PUT_LINE ('Old salary of employee ' || :OLD.salary);
 DBMS_OUTPUT.PUT_LINE ('New salary of employee ' || :NEW.salary);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;


/


CREATE OR REPLACE TRIGGER TRG_PASS_EMAIL 
BEFORE UPDATE ON passenger
FOR EACH ROW


BEGIN
 DBMS_OUTPUT.PUT_LINE ('Passenger ID: '  || :OLD.passengerID || ' Name: ' || :OLD.fname || :OLD.lname);
 DBMS_OUTPUT.PUT_LINE ('Old email of passenger ' || :OLD.email);
 DBMS_OUTPUT.PUT_LINE ('New email of passenger ' || :NEW.email);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;


/


CREATE OR REPLACE TRIGGER trg_car_license_change 
BEFORE UPDATE ON car
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE ('Car ID: '  || :OLD.carID || ' Model: ' || :OLD.car_model);
 DBMS_OUTPUT.PUT_LINE ('Old license number: ' || :OLD.licNO);
 DBMS_OUTPUT.PUT_LINE ('New license number: ' || :NEW.licNO);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;

/


CREATE OR REPLACE TRIGGER TRG_UPDCARSLOT 
AFTER INSERT ON tr_transaction
FOR EACH ROW
DECLARE cid NUMBER;
sts VARCHAR2 (50);
BEGIN
        
        sts := :NEW.status;
        IF sts = 'COMPLETED'
        THEN
                        SELECT carID INTO cid
                        FROM reservation
                        WHERE reservationID = :NEW.reservationID;
                        
                        UPDATE parking_lot
                        SET current_status = 'VACANT', carid = NULL
                        WHERE carID = cid;
        END IF;
END;