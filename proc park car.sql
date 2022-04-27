CREATE OR PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER)
	IS
	c_status VARCHAR2 (10);
	count1 NUMBER;
	BEGIN
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
    
	END SP_PARKCAR;