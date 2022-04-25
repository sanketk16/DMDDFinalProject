create or replace procedure sp_InsertNewPassenger
(
    passengerID IN passenger.passengerID%type,
    fname IN passenger.fname%type,
    lname IN passenger.lname%type,
    email IN passenger.email%type,
    drivers_license IN passenger.drivers_license%type,
    date_of_birth IN passenger.date_of_birth%type,
    location IN passenger.location%type
)	
is
begin
	insert into passenger
	values
	 (passengerID, fname, lname, email, drivers_license, date_of_birth, location);
end sp_InsertNewPassenger;

