-- SEQUENCES

DROP SEQUENCE pass_seq;
DROP SEQUENCE car_seq;
DROP SEQUENCE emp_seq;
DROP SEQUENCE resr_seq;
DROP SEQUENCE tr_seq;

BEGIN
            DECLARE
            maxId NUMBER;
              BEGIN
              SELECT MAX(passengerID)+1
              INTO maxId
              FROM passenger;          
              execute immediate('CREATE SEQUENCE pass_seq MINVALUE '||maxId||' START WITH '||maxId||' INCREMENT BY 1 NOCACHE NOCYCLE');
              END;
END;

/

BEGIN
            DECLARE
            maxId NUMBER;
              BEGIN
              SELECT MAX(carID)+1
              INTO maxId
              FROM car;          
              execute immediate('CREATE SEQUENCE car_seq MINVALUE '||maxId||' START WITH '||maxId||' INCREMENT BY 1 NOCACHE NOCYCLE');
              END;
END;

/

BEGIN
            DECLARE
            maxId NUMBER;
              BEGIN
              SELECT MAX(empID)+1
              INTO maxId
              FROM employee;          
              execute immediate('CREATE SEQUENCE emp_seq MINVALUE '||maxId||' START WITH '||maxId||' INCREMENT BY 1 NOCACHE NOCYCLE');
              END;
END;

/

BEGIN
    DECLARE
        maxId NUMBER;
    BEGIN
        SELECT
               MAX(reservationID)+1
        INTO
               maxId
        FROM
               reservation
        ;
        
        execute immediate('CREATE SEQUENCE resr_seq MINVALUE '
        ||maxId
        ||' START WITH '
        ||maxId
        ||' INCREMENT BY 1 NOCACHE NOCYCLE');
    END;
END;

/

BEGIN
    DECLARE
        maxId NUMBER;
    BEGIN
        SELECT
               MAX(transactionID)+1
        INTO
               maxId
        FROM
               tr_transaction
        ;
        
        execute immediate('CREATE SEQUENCE tr_seq MINVALUE '
        ||maxId
        ||' START WITH '
        ||maxId
        ||' INCREMENT BY 1 NOCACHE NOCYCLE');
    END;
END;

/



-- INDEXES


DROP INDEX idx_carmodel;
DROP INDEX idx_carcategory;
DROP INDEX idx_parkloc;
DROP INDEX idx_modelstarrating;
DROP INDEX idx_fk_res_carid;


CREATE INDEX idx_carmodel ON car (car_model);

CREATE INDEX idx_carcategory ON car (car_category);

CREATE INDEX idx_parkloc ON parking_lot (location);

CREATE INDEX idx_modelstarrating ON user_review (car_model_rating_in_stars);

CREATE INDEX idx_fk_res_carid ON reservation (carID);