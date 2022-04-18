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
