create or replace PROCEDURE SP_NSTARMODEL2
(   
    n IN user_review.car_model_rating_in_stars%type,
    brand IN car.brand%type
)
IS
    cmodel car.car_model%type;
    cursor cur_model is 
       select car_model from car
       join (select carID, car_model_rating_in_stars, dense_rank() over (order by car_model_rating_in_stars) r from user_review) t
       on car.carID = t.carID 
       where r = n
       and car.brand = brand
       fetch first 1 rows only;
        
BEGIN
    open cur_model;
    loop
     fetch cur_model into cmodel;
     exit when cur_model%NOTFOUND;
     dbms_output.put_line(cmodel || ' is the ' || n || '(st/nd/th) rated model of ' ||brand);
     
    end loop;
    close cur_model;
END SP_NSTARMODEL2;