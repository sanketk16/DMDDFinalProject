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
