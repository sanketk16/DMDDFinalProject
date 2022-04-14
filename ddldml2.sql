ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';
ALTER SESSION SET  NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

DROP TABLE passenger CASCADE CONSTRAINTS;
DROP TABLE car CASCADE CONSTRAINTS;
DROP TABLE parking_lot CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE tr_transaction CASCADE CONSTRAINTS;
DROP TABLE emp_department CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE user_review CASCADE CONSTRAINTS;
DROP TABLE issue_category CASCADE CONSTRAINTS;
DROP TABLE customer_support CASCADE CONSTRAINTS;

CREATE TABLE passenger (
	passengerID INT NOT NULL,
	fname VARCHAR(50),
	lname VARCHAR(50),
	email VARCHAR(50),
	drivers_license VARCHAR(50),
	date_of_birth DATE,
	location VARCHAR(50),
    CONSTRAINT psg_pk PRIMARY KEY (passengerID)
);



insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (1, 'Ardeen', 'Dewberry', 'adewberry0@nature.com', 'H1728413752', '2002/09/15', '95425');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (2, 'Tobe', 'Findlater', 'tfindlater1@51.la', 'O1139211966', '1996/04/11', '46492');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (3, 'Smith', 'Bleaden', 'sbleaden2@psu.edu', 'N1941101944', '1998/01/15', '49704');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (4, 'Sadye', 'Hendriks', 'shendriks3@miibeian.gov.cn', 'A1691554702', '2001/02/06', '56137');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (5, 'Bartolomeo', 'Mort', 'bmort4@chicagotribune.com', 'Y1650115709', '2001/11/15', '46058');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (6, 'Hattie', 'Shalliker', 'hshalliker5@globo.com', 'G1876047959', '1997/04/10', '18493');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (7, 'Katrinka', 'Arsmith', 'karsmith6@shutterfly.com', 'W1747674180', '1995/10/21', '39009');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (8, 'Cirilo', 'MacLaig', 'cmaclaig7@tripod.com', 'F1563886738', '1998/04/25', '74931');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (9, 'Geoffry', 'Smaridge', 'gsmaridge8@deliciousdays.com', 'Z1026539307', '2001/08/09', '38800');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (10, 'Marten', 'Edwinson', 'medwinson9@chron.com', 'H1182969311', '1999/02/22', '49982');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (11, 'Catherin', 'Oxterby', 'coxterbya@php.net', 'R1869627950', '2004/11/22', '89258');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (12, 'Antonio', 'Habbergham', 'ahabberghamb@nasa.gov', 'E1395921061', '1991/08/06', '41493');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (13, 'Franky', 'Cowpland', 'fcowplandc@i2i.jp', 'R1774343146', '1998/06/24', '62307');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (14, 'Sadie', 'Guerrieri', 'sguerrierid@china.com.cn', 'M1069316253', '1997/07/20', '22692');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (15, 'Shaun', 'Castaignet', 'scastaignete@vimeo.com', 'P1075577669', '1997/10/07', '22642');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (16, 'Shawna', 'Stephens', 'sstephensf@twitpic.com', 'J1412249729', '1995/06/10', '10604');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (17, 'Reggis', 'Beuscher', 'rbeuscherg@examiner.com', 'G1813944863', '1994/07/15', '74377');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (18, 'Phelia', 'Lared', 'plaredh@sina.com.cn', 'G1630428543', '1992/03/21', '85740');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (19, 'Temple', 'Thurby', 'tthurbyi@merriam-webster.com', 'I1558892930', '1990/07/26', '86121');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (20, 'Alvera', 'Froment', 'afromentj@ycombinator.com', 'U1741880103', '1992/04/03', '85524');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (21, 'Ellary', 'Sandercroft', 'esandercroftk@bloglovin.com', 'E1373033391', '1990/12/24', '03954');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (22, 'Frannie', 'Favey', 'ffaveyl@trellian.com', 'S1153274511', '1996/11/09', '34288');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (23, 'Benson', 'Farenden', 'bfarendenm@state.gov', 'M1143825463', '1995/05/08', '31808');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (24, 'Gleda', 'Sivier', 'gsiviern@tiny.cc', 'C1286157088', '1996/08/02', '25237');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (25, 'Tamiko', 'Rickford', 'trickfordo@blinklist.com', 'S1506591324', '2000/04/20', '42546');

create table car (
	carID INT NOT NULL,
	brand VARCHAR(50),
	licNO VARCHAR(50),
	mfgyear VARCHAR(50),
	color VARCHAR(50),
	car_category VARCHAR(9),
	car_model VARCHAR(50),
	CONSTRAINT car_pk PRIMARY KEY(carID)
);

insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (1, 'Isuzu', 'C1635322', 2006, 'Khaki', 'hatchback', 'Ascender');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (2, 'BMW', 'C1739322', 2007, 'Aquamarine', 'SUV', 'M6');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (3, 'GMC', 'C1937372', 1999, 'Red', 'hatchback', 'Jimmy');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (4, 'Chevrolet', 'C1837382', 2003, 'Maroon', 'minivan', 'Silverado');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (5, 'Maybach', 'C1033382', 2011, 'Puce', 'sedan', 'Landaulet');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (6, 'Renault', 'A1734372', 1983, 'Goldenrod', 'hatchback', 'Alliance');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (7, 'Ford', 'A1736382', 1985, 'Yellow', 'SUV', 'F-Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (8, 'Mercedes-Benz', 'C1036342', 2000, 'Crimson', 'SUV', 'CLK-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (9, 'Chevrolet', 'A1334312', 2010, 'Violet', 'hatchback', 'Malibu');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (10, 'Volvo', 'A1639342', 2006, 'Puce', 'sedan', 'S80');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (11, 'Pontiac', 'C1132382', 2006, 'Goldenrod', 'hatchback', 'GTO');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (12, 'Chevrolet', 'C1331312', 2011, 'Crimson', 'SUV', 'Express');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (13, 'Acura', 'C1533382', 1996, 'Goldenrod', 'sedan', 'TL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (14, 'Lincoln', 'A1930312', 2000, 'Crimson', 'sedan', 'Continental');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (15, 'BMW', 'B1834332', 2005, 'Puce', 'minivan', '530');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (16, 'Audi', 'A1738302', 2012, 'Orange', 'hatchback', 'A4');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (17, 'Mazda', 'B1232342', 2006, 'Yellow', 'minivan', 'Tribute');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (18, 'Chevrolet', 'C1539322', 1996, 'Green', 'sedan', 'Impala');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (19, 'Ford', 'B1537312', 2009, 'Green', 'SUV', 'Explorer');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (20, 'Buick', 'C1937352', 1984, 'Aquamarine', 'SUV', 'Skyhawk');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (21, 'Chevrolet', 'B1038352', 2004, 'Mauv', 'minivan', 'Tahoe');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (22, 'Lexus', 'A1035372', 2005, 'Teal', 'sedan', 'ES');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (23, 'Ford', 'B1532362', 2008, 'Teal', 'hatchback', 'F450');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (24, 'Mazda', 'B1436392', 2003, 'Purple', 'SUV', 'MX-5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (25, 'Ford', 'A1436392', 1990, 'Red', 'hatchback', 'Probe');

create table parking_lot (
	lotNO INT NOT NULL,
	location VARCHAR(50),
	lotname VARCHAR(50),
	slotnumber VARCHAR(10),
	carID INT,
	CONSTRAINT lot_pk PRIMARY KEY (lotNO),
    CONSTRAINT car_fk FOREIGN KEY (carID) references car(carID)
);

insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (1, '12339', 'E7302', 'G1', 11);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (2, '20163', 'E7352', 'S8', 10);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (3, '55308', 'E8362', 'Y1', 5);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (4, '83078', 'E4352', 'Z8', 16);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (5, '93714', 'A1392', 'V9', 15);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (6, '00549', 'E1362', 'G8', 7);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (7, '89025', 'E1362', 'T9', 24);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (8, '10450', 'E4322', 'X8', 18);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (9, '91438', 'C1382', 'M1', 21);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (10, '15632', 'E8332', 'X0', 20);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (11, '97346', 'C6372', 'M1', 22);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (12, '57674', 'E9372', 'H8', 9);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (13, '63448', 'C8322', 'X1', 8);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (14, '79814', 'D5302', 'D1', 1);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (15, '01890', 'E9322', 'E8', 19);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (16, '24799', 'A4322', 'E9', 6);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (17, '92605', 'A9322', 'J2', 17);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (18, '33483', 'B7392', 'S2', 4);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (19, '56812', 'E8312', 'E7', 3);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (20, '23681', 'E2342', 'B6', 2);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (21, '26796', 'D7342', 'S9', 25);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (22, '28260', 'E9312', 'Q8', 14);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (23, '26855', 'E2392', 'B3', 23);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (24, '74827', 'E1322', 'C4', 13);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (25, '09459', 'E4382', 'N6', 12);


create table reservation (
	reservationID INT NOT NULL,
	pickup_date TIMESTAMP,
	return_date TIMESTAMP,
	passengerID INT,
	carID INT,
	lotNO INT,
	CONSTRAINT rsv_pk PRIMARY KEY(reservationID),
	CONSTRAINT psg_fk FOREIGN KEY(passengerID) REFERENCES passenger(passengerID),
	CONSTRAINT car2_fk FOREIGN KEY(carID) REFERENCES car(carID),
	CONSTRAINT lot_fk FOREIGN KEY(lotNO) REFERENCES parking_lot(lotNO)
);

insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (1, '2021-12-01 07:19:17', '2021-12-06 09:04:43', 17, 16, 23);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (2, '2021-04-18 09:27:09', '2021-04-22 10:37:20', 12, 20, 21);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (3, '2022-01-13 07:55:39', '2022-01-18 07:20:53', 22, 14, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (4, '2021-11-10 21:18:07', '2021-11-12 06:15:04', 14, 18, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (5, '2021-09-21 06:12:48', '2021-09-24 05:43:03',  11, 15, 20);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (6, '2021-09-11 11:22:20', '2021-09-14 11:06:28', 21, 19, 7);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (7, '2022-01-24 20:54:09', '2022-01-24 12:13:17', 7, 24, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (8, '2021-06-26 13:35:27', '2021-06-26 06:36:03', 25, 1, 2);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (9, '2021-05-11 17:21:59', '2021-05-11 03:51:53', 24, 12, 4);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (10, '2021-08-25 22:17:31', '2021-08-27 08:48:26', 4, 11, 21);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (11, '2021-02-24 13:22:46', '2021-02-26 05:00:28', 19, 4, 18);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (12, '2021-02-12 06:14:15', '2021-02-15 12:49:48', 13, 1, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (13, '2021-11-08 16:12:37', '2021-11-10 03:34:29', 18, 5, 1);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (14, '2021-03-06 05:32:17', '2021-03-10 04:42:39', 23, 9, 5);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (15, '2021-08-25 20:30:58', '2021-08-30 02:26:04', 21, 9, 20);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (16, '2022-06-14 10:57:42', '2022-06-14 01:43:38', 8, 22, 24);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (17, '2022-02-25 23:07:44', '2022-02-28 11:29:48', 16, 17, 16);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (18, '2021-03-17 11:01:08', '2021-03-19 10:45:26', 20, 7, 23);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (19, '2021-04-13 19:13:41', '2021-04-18 07:05:41', 22, 12, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (20, '2021-09-24 08:06:30', '2021-09-30 11:56:22', 9, 19, 22);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (21, '2021-09-24 13:06:16', '2021-09-25 08:32:53', 23, 15, 5);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (22, '2021-02-20 13:13:42', '2021-02-21 02:30:27', 18, 1, 2);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (23, '2021-04-23 19:50:33', '2021-04-26 07:28:30', 15, 9, 17);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (24, '2021-06-28 03:32:50', '2021-06-30 05:50:23', 10, 4, 4);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (25, '2021-05-31 09:51:27', '2021-05-31 04:40:25', 17, 25, 4);

create table tr_transaction (
	transactionID INT NOT NULL,
	trip_amount VARCHAR(3),
	trip_invoice VARCHAR(50),
	transaction_date DATE,
	status VARCHAR(9) CONSTRAINT st CHECK (status in ('COMPLETED', 'FAILED')),
	payment_type VARCHAR(6),
    reservationID INT,
	CONSTRAINT tx_pk PRIMARY KEY(transactionID),
    CONSTRAINT rsv_fk FOREIGN KEY (reservationID) REFERENCES reservation(reservationID)
);

insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (1, 210, 'L57302', '2022-01-24', 'COMPLETED', 'Credit', 1);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (2, 70, 'Q59352', '2021-02-28', 'COMPLETED', 'Debit', 2);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (3, 70, 'E56382', '2021-04-13', 'FAILED', 'Credit', 3);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (4, 175, 'K50362', '2021-06-13', 'COMPLETED', 'Credit', 4);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (5, 110, 'G56392', '2021-03-06', 'COMPLETED', 'Debit', 5);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (6, 50, 'T50382', '2021-05-31', 'FAILED', 'Credit', 6);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (7, 75, 'K55312', '2021-09-11', 'COMPLETED', 'Debit', 7);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (8, 350, 'F57392', '2021-04-19', 'FAILED', 'Credit', 8);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (9, 115, 'Q56352', '2021-06-28', 'COMPLETED', 'Debit', 9);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (10, 125, 'U51382', '2021-06-06', 'COMPLETED', 'Debit', 10);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (11, 335, 'I53342', '2021-09-24', 'COMPLETED', 'Credit', 11);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (12, 175, 'Q51332', '2021-04-13', 'COMPLETED', 'Debit', 12);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (13, 110, 'I52322', '2021-05-11', 'COMPLETED', 'Credit', 13);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (14, 110, 'N59322', '2021-09-11', 'FAILED', 'Credit', 14);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (15, 165, 'Z54362', '2021-08-25', 'COMPLETED', 'Debit', 15);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (16, 165, 'G50302', '2022-03-07', 'COMPLETED', 'Debit', 16);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (17, 70, 'N58372', '2021-04-23', 'COMPLETED', 'Credit', 17);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (18, 125, 'G57362', '2021-08-25', 'COMPLETED', 'Credit', 18);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (19, 210, 'C58302', '2021-05-23', 'COMPLETED', 'Credit', 19);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (20, 125, 'H56322', '2022-02-14', 'COMPLETED', 'Debit', 20);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (21, 115, 'F57352', '2021-06-14', 'COMPLETED', 'Credit', 21);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (22, 110, 'N51302', '2021-06-26', 'FAILED', 'Debit', 22);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (23, 115, 'T56312', '2021-11-08', 'COMPLETED', 'Credit', 23);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (24, 50, 'P57392', '2021-09-24', 'COMPLETED', 'Credit', 24);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (25, 110, 'H57382', '2021-02-20', 'FAILED', 'Credit', 25);



create table emp_department (
	deptID INT NOT NULL,
	dept_name VARCHAR(50),
	CONSTRAINT empdpt_pk PRIMARY KEY(deptID)
);

insert into emp_department (deptID, dept_name) values (1, 'Training');
insert into emp_department (deptID, dept_name) values (2, 'Support');
insert into emp_department (deptID, dept_name) values (3, 'Support');
insert into emp_department (deptID, dept_name) values (4, 'Product Management');
insert into emp_department (deptID, dept_name) values (5, 'Training');
insert into emp_department (deptID, dept_name) values (6, 'Engineering');
insert into emp_department (deptID, dept_name) values (7, 'Sales');
insert into emp_department (deptID, dept_name) values (8, 'Product Management');
insert into emp_department (deptID, dept_name) values (9, 'Services');
insert into emp_department (deptID, dept_name) values (10, 'Marketing');
insert into emp_department (deptID, dept_name) values (11, 'Engineering');
insert into emp_department (deptID, dept_name) values (12, 'Support');
insert into emp_department (deptID, dept_name) values (13, 'Research and Development');
insert into emp_department (deptID, dept_name) values (14, 'Business Development');
insert into emp_department (deptID, dept_name) values (15, 'Business Development');
insert into emp_department (deptID, dept_name) values (16, 'Sales');
insert into emp_department (deptID, dept_name) values (17, 'Business Development');
insert into emp_department (deptID, dept_name) values (18, 'Research and Development');
insert into emp_department (deptID, dept_name) values (19, 'Marketing');
insert into emp_department (deptID, dept_name) values (20, 'Accounting');
insert into emp_department (deptID, dept_name) values (21, 'Accounting');
insert into emp_department (deptID, dept_name) values (22, 'Engineering');
insert into emp_department (deptID, dept_name) values (23, 'Legal');
insert into emp_department (deptID, dept_name) values (24, 'Accounting');
insert into emp_department (deptID, dept_name) values (25, 'Legal');


create table employee (
	empID INT NOT NULL,
	first_name VARCHAR(50),
	emp_dob DATE,
	deptID INT,
	CONSTRAINT emp_pk PRIMARY KEY(empID),
	CONSTRAINT dpt_fk FOREIGN KEY(deptID) REFERENCES emp_department(deptID)
);

insert into employee (empID, first_name, emp_dob, deptID) values (1, 'Lindsey Gotmann', '1980-12-16', 18);
insert into employee (empID, first_name, emp_dob, deptID) values (2, 'Jesse Harteley', '1986-05-10', 6);
insert into employee (empID, first_name, emp_dob, deptID) values (3, 'Gabey Raraty', '1999-09-08', 1);
insert into employee (empID, first_name, emp_dob, deptID) values (4, 'Lothario Roston', '2013-03-14', 8);
insert into employee (empID, first_name, emp_dob, deptID) values (5, 'Noelle Endean', '1987-08-08', 11);
insert into employee (empID, first_name, emp_dob, deptID) values (6, 'Luise Paoli', '1984-02-07', 22);
insert into employee (empID, first_name, emp_dob, deptID) values (7, 'Twyla Follis', '1987-04-11', 7);
insert into employee (empID, first_name, emp_dob, deptID) values (8, 'Opalina Jeannot', '1980-05-30', 12);
insert into employee (empID, first_name, emp_dob, deptID) values (9, 'Garreth Readitt', '1982-08-03', 19);
insert into employee (empID, first_name, emp_dob, deptID) values (10, 'Bengt Windley', '2014-07-05', 4);
insert into employee (empID, first_name, emp_dob, deptID) values (11, 'Emylee Ramelet', '1987-04-14', 9);
insert into employee (empID, first_name, emp_dob, deptID) values (12, 'Pat Kelinge', '2009-01-15', 24);
insert into employee (empID, first_name, emp_dob, deptID) values (13, 'Barbara Plumtree', '2010-11-29', 17);
insert into employee (empID, first_name, emp_dob, deptID) values (14, 'Gilli Bracegirdle', '1986-03-31', 14);
insert into employee (empID, first_name, emp_dob, deptID) values (15, 'Saree Masi', '2004-05-28', 5);
insert into employee (empID, first_name, emp_dob, deptID) values (16, 'Dorian Tolland', '2010-10-01', 20);
insert into employee (empID, first_name, emp_dob, deptID) values (17, 'Marybeth Kaesmakers', '2009-10-10', 2);
insert into employee (empID, first_name, emp_dob, deptID) values (18, 'Tades Beernt', '1987-04-28', 21);
insert into employee (empID, first_name, emp_dob, deptID) values (19, 'Teddy Pepler', '1999-07-15', 15);
insert into employee (empID, first_name, emp_dob, deptID) values (20, 'Diane-marie Melvin', '1986-09-10', 23);
insert into employee (empID, first_name, emp_dob, deptID) values (21, 'Brena Hayesman', '1993-10-03', 3);
insert into employee (empID, first_name, emp_dob, deptID) values (22, 'Gray Maggiore', '2009-07-13', 13);
insert into employee (empID, first_name, emp_dob, deptID) values (23, 'Fabian Molines', '2006-07-03', 16);
insert into employee (empID, first_name, emp_dob, deptID) values (24, 'Tyson Arrighi', '1998-04-09', 10);
insert into employee (empID, first_name, emp_dob, deptID) values (25, 'Terrance Shillito', '1986-05-09', 25);



create table user_review (
	reviewID INT NOT NULL,
	rating_in_stars INT CONSTRAINT t_rating CHECK (rating_in_stars IN (1, 2, 3, 4, 5)),
	car_model_rating_in_stars INT CONSTRAINT c_rating CHECK (car_model_rating_in_stars IN (1, 2, 3, 4, 5)),
	reservationID INT,
	carID INT,
    CONSTRAINT rvw_pk PRIMARY KEY (reviewID),
    CONSTRAINT car3_fk FOREIGN KEY (carID) references car(carID)
);



insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (1, 4, 3, 1, 16);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (2, 1, 3, 2, 20);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (3, 5, 1, 3, 14);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (4, 2, 5, 4, 18);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (5, 2, 4, 5, 15);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (6, 4, 3, 6, 19);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (7, 4, 1, 7, 24);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (8, 3, 2, 8, 1);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (9, 4, 4, 9, 12);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (10, 5, 5, 10, 11);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (11, 2, 3, 11, 4);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (12, 5, 2, 12, 1);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (13, 5, 1, 13, 5);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (14, 5, 5, 14, 9);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (15, 5, 1, 15, 9);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (16, 1, 4, 16, 22);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (17, 3, 1, 17, 17);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (18, 5, 5, 18, 7);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (19, 4, 5, 19, 12);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (20, 2, 4, 20, 19);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (21, 4, 3, 21, 15);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (22, 1, 3, 22, 1);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (23, 3, 4, 23, 9);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (24, 1, 4, 24, 4);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (25, 1, 3, 25, 25);

create table issue_category (
	categoryID INT NOT NULL,
	category_name VARCHAR(20),
    CONSTRAINT ic_pk PRIMARY KEY (categoryID)
);

insert into issue_category (categoryID, category_name) values (1, 'payment');
insert into issue_category (categoryID, category_name) values (2, 'booking');
insert into issue_category (categoryID, category_name) values (3, 'bug');
insert into issue_category (categoryID, category_name) values (4, 'cancellation');

create table customer_support (
	ticketNO INT NOT NULL,
	tkt_toc TIMESTAMP,
	ticketStatus VARCHAR(8) CONSTRAINT tk_chk CHECK (ticketStatus IN ('RESOLVED', 'PENDING')),
	empID INT,
	passengerID INT,
    categoryID INT,
	CONSTRAINT cs_pk PRIMARY KEY (ticketNO),
	CONSTRAINT emp2_fk FOREIGN KEY (empID) REFERENCES employee(empID),
	CONSTRAINT psg2_fk FOREIGN KEY (passengerID) REFERENCES passenger(passengerID),
    CONSTRAINT ctg_fk FOREIGN KEY (categoryID) REFERENCES issue_category(categoryID)
);

insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (122, '2022-03-02 07:12:41', 'RESOLVED', 5, 1, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (114, '2022-01-06 17:51:30', 'RESOLVED', 12, 2, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (115, '2021-05-30 03:15:33', 'PENDING', 8, 3, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (136, '2021-08-04 01:49:50', 'PENDING', 4, 4, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (170, '2021-08-20 10:22:53', 'PENDING', 13, 5, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (105, '2021-04-18 23:28:52', 'RESOLVED', 24, 6, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (141, '2021-08-14 02:01:16', 'RESOLVED', 13, 7, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (127, '2021-10-13 14:47:35', 'PENDING', 18, 8, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (103, '2021-02-20 19:24:10', 'RESOLVED', 6, 9, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (123, '2022-03-08 03:46:57', 'RESOLVED', 14, 10, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (104, '2021-10-24 03:58:45', 'PENDING', 14, 11, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (107, '2021-02-22 20:52:45', 'PENDING', 14, 12, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (102, '2021-11-09 18:48:30', 'RESOLVED', 13, 13, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (111, '2021-03-02 09:10:01', 'RESOLVED', 22, 14, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (160, '2021-10-27 11:41:00', 'RESOLVED', 23, 15, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (129, '2021-12-14 05:18:08', 'RESOLVED', 1, 16, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (100, '2021-07-15 04:16:26', 'PENDING', 16, 17, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (121, '2021-04-07 22:14:49', 'PENDING', 5, 18, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (189, '2021-11-24 16:45:02', 'PENDING', 15, 19, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (113, '2022-02-09 21:23:49', 'RESOLVED', 4, 20, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (119, '2021-02-05 06:06:55', 'RESOLVED', 22, 21, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (148, '2022-01-05 12:22:00', 'PENDING', 19, 22, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (124, '2021-06-17 22:58:35', 'PENDING', 21, 23, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (108, '2021-09-10 19:54:43', 'PENDING', 2, 24, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (155, '2021-10-06 19:06:17', 'PENDING', 22, 25, 4);



--VIEWS 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "CARS_BY_CATEGORY"
AS 
select car.car_category as Category,
count(*) as CountOfCars
from car
group by car_category;

SELECT * FROM CARS_BY_CATEGORY;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "NO_OF_RENTAL_DAYS" 
AS 
select car.car_model as Model,
car.car_category as Category,
sum(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as TotalRentedDaysByThisModel
from car
join reservation on car.carID = reservation.carID
group by car.car_model, car.car_category;

SELECT * FROM NO_OF_RENTAL_DAYS;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "RENTALS_IN_A_LOCATION"
AS 
select location, count(parking_lot.carID)AS cars_rented_count
from parking_lot
join car on parking_lot.carID = car.carID
join reservation on reservation.carID = car.carID
group by location;

SELECT * FROM RENTALS_IN_A_LOCATION;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "SUV_RENTED_PASSENGERS" 
AS 
SELECT 
passenger.fname, passenger.lname
FROM 
passenger join reservation
on passenger.passengerID = reservation.passengerID
join car on reservation.carID = car.carID
where car.car_category = 'SUV';

SELECT * FROM SUV_RENTED_PASSENGERS;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "TICKETS_PER_ISSUE_CATEGORY" 
AS 
select issue_category.category_name as IssueCategory,
count(customer_support.ticketNO) as NoOfTickets
from customer_support
join issue_category on issue_category.categoryID = customer_support.categoryID
group by issue_category.category_name;

SELECT * FROM TICKETS_PER_ISSUE_CATEGORY;



CREATE OR REPLACE FORCE EDITIONABLE VIEW "TOP_3_EMPLOYEES" 
AS 
select employee.empID, count(ticketNO) as ticketsSolved
from employee
join customer_support on employee.empID = customer_support.empID
where customer_support.ticketStatus = 'RESOLVED'
group by employee.empID
order by ticketsSolved desc
fetch first 3 rows only;

SELECT * FROM TOP_3_EMPLOYEES;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "TRIP_DURATION_FOR_A_MODEL" 
AS 
select reservation.reservationID as ReservationID,
car.brand as Company,
car.car_model as Model,
(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as TripDurationInDays
from car
join reservation on car.carID = reservation.carID;

SELECT * FROM TRIP_DURATION_FOR_A_MODEL;
