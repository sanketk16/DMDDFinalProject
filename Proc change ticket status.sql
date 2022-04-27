CREATE OR PROCEDURE sp_chgticketresolvedstatus  (tktno IN NUMBER) AS
  BEGIN
    UPDATE customer_support
        SET ticketstatus = 'RESOLVED',
        ticket_resolved_ts = SYSDATE
        WHERE ticketno = tktno;

        DBMS_OUTPUT.put_line('Status updated to resolved for ticket number ' || tktno);
  END SP_CHGTICKETRESOLVEDSTATUS;