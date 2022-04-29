create or replace FUNCTION TICKETS_SOLVED_BY_EMP (eid NUMBER)
RETURN NUMBER
AS 
cnt NUMBER;
BEGIN
  SELECT COALESCE(count(ticketNO), 0) INTO cnt
  FROM employee
  join customer_support on employee.empID = customer_support.empID
  where customer_support.ticketStatus = 'RESOLVED'
  HAVING employee.empID = eid
  GROUP BY employee.empID;
  RETURN cnt;
  exception when no_data_found then return 0;
END TICKETS_SOLVED_BY_EMP;
