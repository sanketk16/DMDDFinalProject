--VIEWS 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "CARS_BY_CATEGORY"
AS 
select car.car_category as Category,
count(*) as CountOfCars
from car
group by car_category;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "NO_OF_RENTAL_DAYS" 
AS 
select car.car_model as Model,
car.car_category as Category,
sum(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as Total_Rented_Days_By_This_Model
from car
join reservation on car.carID = reservation.carID
group by car.car_model, car.car_category;



CREATE OR REPLACE FORCE EDITIONABLE VIEW "RENTALS_IN_A_LOCATION"
AS 
select location, count(parking_lot.carID)AS cars_rented_count
from parking_lot
join car on parking_lot.carID = car.carID
join reservation on reservation.carID = car.carID
group by location;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "SUV_RENTED_PASSENGERS" 
AS 
SELECT 
passenger.fname, passenger.lname
FROM 
passenger join reservation
on passenger.passengerID = reservation.passengerID
join car on reservation.carID = car.carID
where car.car_category = 'SUV';




CREATE OR REPLACE FORCE EDITIONABLE VIEW "TICKETS_PER_ISSUE_CATEGORY" 
AS 
select issue_category.category_name as IssueCategory,
count(customer_support.ticketNO) as NoOfTickets
from customer_support
join issue_category on issue_category.categoryID = customer_support.categoryID
group by issue_category.category_name;





CREATE OR REPLACE FORCE EDITIONABLE VIEW "TOP_3_EMPLOYEES" 
AS 
select employee.empID, count(ticketNO) as ticketsSolved
from employee
join customer_support on employee.empID = customer_support.empID
where customer_support.ticketStatus = 'RESOLVED'
group by employee.empID
order by ticketsSolved desc
fetch first 3 rows only;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_USED_IN_DAYS"
AS 
select 
passenger.passengerID as PassengerID,
passenger.fname as Name,
(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as ServiceUsedinDays
from passenger
join reservation on passenger.passengerID = reservation.reservationID;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "AVG_RATING_PER_MODEL"
AS
select car.car_model as Model, 
car.car_category as category, 
round(avg(user_review.car_model_rating_in_stars), 2) as AvgRatingByUsers
from car
join user_review on user_review.carID = car.carID
group by car.car_model, car.car_category
order by AvgRatingByUsers desc;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "HIGHEST_RATED_MODEL_ZIPCODE"
AS 
select location AS Area, car_model as Highest_Rated_model, car_category as category
from parking_lot 
join car
on parking_lot.carID = car.carID 
join user_review on user_review.carID = car.carID
where user_review.car_model_rating_in_stars = 5;




CREATE OR REPLACE FORCE EDITIONABLE VIEW "HIGHEST_RATED_MODEL_PER_CATEGORY"
AS 
select car_category as Category,
car_model as Highest_rated_Model,
car_model_rating_in_stars as Rating
from car
join user_review
on car.carID = user_review.carID
WHERE user_review.car_model_rating_in_stars = 5;



CREATE OR REPLACE FORCE EDITIONABLE VIEW "PER_TRIP_DURATION_IN_DAYS"
AS
select reservation.reservationID as TripID,
passenger.passengerID as passengerID,
CONCAT (CONCAT (passenger.fname, ' '), passenger.lname) AS PassengerName,
(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as TripDurationInDays
from passenger
join reservation on passenger.passengerID = reservation.carID;

