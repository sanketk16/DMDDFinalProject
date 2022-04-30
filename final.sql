ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';
ALTER SESSION SET  NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- Creating passenger user
DROP USER passenger;
CREATE USER passenger IDENTIFIED BY crRENTALPWD1;

-- Creating employee user
DROP USER employee;
CREATE USER employee IDENTIFIED BY crRENTALemp1;


begin execute immediate 'drop table passenger CASCADE CONSTRAINTS';
exception when others then null;
end;
/

begin execute immediate 'drop table car CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table parking_lot CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table reservation CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table tr_transaction CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table emp_department CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table employee CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table user_review CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table issue_category CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

begin execute immediate 'drop table customer_support CASCADE CONSTRAINTS';
exception when others then null; 
end;
/

CREATE TABLE passenger (
	passengerID INT NOT NULL,
	fname VARCHAR2(50),
	lname VARCHAR2(50),
	email VARCHAR2(50) CONSTRAINT em CHECK (email LIKE '%@%.%'),
	drivers_license VARCHAR2(50),
	date_of_birth DATE CONSTRAINT chk_date_of_birth CHECK (date_of_birth > TO_DATE ('1950/01/01', 'YYYY/MM/DD')),
	location VARCHAR2(50) CONSTRAINT chk_location CHECK (LENGTH (location) = 5),
    PRIMARY KEY (passengerID)
);

insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (1, 'Annemarie', 'Basden', 'abasden0@de.vu', 'V1468049405', '1990/04/01', '73711');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (2, 'Pier', 'Duffield', 'pduffield1@bluehost.com', 'B1447195726', '2002/06/10', '72991');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (3, 'Anthea', 'Cockings', 'acockings2@cnn.com', 'Q1982872911', '1993/12/15', '41706');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (4, 'Iris', 'Toombs', 'itoombs3@privacy.gov.au', 'B1155550941', '1997/06/23', '08058');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (5, 'Lenka', 'Patty', 'lpatty4@bbb.org', 'O1867190739', '1993/01/09', '10708');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (6, 'Modesta', 'Emberton', 'memberton5@toplist.cz', 'M1883072730', '1999/04/18', '75719');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (7, 'Mariel', 'Kock', 'mkock6@kickstarter.com', 'M1725954841', '1998/11/24', '70045');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (8, 'Mick', 'Gligorijevic', 'mgligorijevic7@tripod.com', 'T1895323753', '1992/06/26', '91009');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (9, 'Frants', 'Eliesco', 'feliesco8@ox.ac.uk', 'V1402964552', '2003/10/29', '52080');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (10, 'Vernon', 'Shakeshaft', 'vshakeshaft9@rambler.ru', 'V1079628785', '1993/10/08', '18764');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (11, 'Cece', 'Strasse', 'cstrassea@mashable.com', 'J1902748958', '1990/01/02', '72138');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (12, 'Ginnifer', 'Jaqueme', 'gjaquemeb@mozilla.com', 'I1312685006', '2000/06/26', '88368');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (13, 'Shaine', 'Geddes', 'sgeddesc@mozilla.org', 'Q1580413049', '2004/11/09', '60200');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (14, 'Siobhan', 'MacGuffog', 'smacguffogd@toplist.cz', 'Y1379589098', '1990/04/29', '25355');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (15, 'Elene', 'Moggan', 'emoggane@ebay.com', 'Y1217034998', '2002/11/20', '18301');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (16, 'Karena', 'Willows', 'kwillowsf@ca.gov', 'G1998616727', '1995/04/09', '88214');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (17, 'Basilio', 'Silverman', 'bsilvermang@npr.org', 'B1031102520', '1997/06/09', '36321');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (18, 'Jobi', 'Portriss', 'jportrissh@woothemes.com', 'O1160666172', '1992/01/16', '18409');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (19, 'Kiel', 'Crackett', 'kcracketti@facebook.com', 'V1931144365', '2001/10/21', '36370');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (20, 'Bess', 'Bruster', 'bbrusterj@google.com', 'P1310290958', '2002/12/17', '73542');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (21, 'Marian', 'Essex', 'messexk@trellian.com', 'B1778475078', '2000/03/26', '58095');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (22, 'Caril', 'Walcot', 'cwalcotl@tumblr.com', 'L1986543243', '2001/02/19', '74759');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (23, 'Roseanna', 'Alcide', 'ralcidem@slideshare.net', 'E1690812786', '1999/10/21', '39953');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (24, 'Alphonse', 'Jayme', 'ajaymen@webeden.co.uk', 'A1998113676', '1999/08/21', '68636');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (25, 'Brenn', 'Potier', 'bpotiero@multiply.com', 'V1387435635', '1998/11/20', '97433');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (26, 'Gaynor', 'Daunter', 'gdaunterp@tmall.com', 'P1639098100', '1996/03/17', '82859');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (27, 'Hans', 'Deschelle', 'hdeschelleq@arstechnica.com', 'D1224019212', '1997/04/05', '85878');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (28, 'Kain', 'Clowton', 'kclowtonr@sun.com', 'I1016258892', '1990/05/24', '02985');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (29, 'Noby', 'Wellesley', 'nwellesleys@ebay.com', 'K1851062989', '2001/04/30', '25222');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (30, 'Igor', 'Yarrall', 'iyarrallt@zdnet.com', 'O1527298072', '1990/01/07', '62256');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (31, 'Peirce', 'Gregoriou', 'pgregoriouu@oaic.gov.au', 'M1854200820', '1997/02/24', '11424');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (32, 'Emilie', 'Diegan', 'edieganv@cpanel.net', 'X1336245780', '1992/10/27', '25032');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (33, 'Corina', 'Scholl', 'cschollw@elpais.com', 'P1559616732', '1997/03/23', '94076');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (34, 'Dionisio', 'Boldry', 'dboldryx@mayoclinic.com', 'N1678573216', '2004/05/29', '11384');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (35, 'Carlynne', 'Doble', 'cdobley@joomla.org', 'E1373378658', '1998/06/10', '88390');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (36, 'Les', 'McHugh', 'lmchughz@studiopress.com', 'C1775876273', '2001/07/22', '95920');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (37, 'Heath', 'Kemsley', 'hkemsley10@theguardian.com', 'S1067294838', '2004/03/10', '74873');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (38, 'Cornelle', 'Fowkes', 'cfowkes11@nps.gov', 'H1998418907', '1996/08/20', '35835');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (39, 'Kylie', 'Sowte', 'ksowte12@issuu.com', 'I1892330163', '2001/12/11', '82876');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (40, 'Kerk', 'Yitzhok', 'kyitzhok13@studiopress.com', 'V1808928822', '2001/11/05', '85756');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (41, 'Lazare', 'Smithin', 'lsmithin14@businesswire.com', 'N1107047223', '1998/12/17', '45685');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (42, 'Marty', 'Ambroz', 'mambroz15@360.cn', 'C1222607832', '2002/08/03', '84139');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (43, 'Selina', 'Marquese', 'smarquese16@sphinn.com', 'B1169560120', '2000/07/02', '67981');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (44, 'Marcelo', 'Shovlin', 'mshovlin17@deviantart.com', 'Q1380683706', '1993/05/10', '48020');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (45, 'Mariana', 'Crollman', 'mcrollman18@ehow.com', 'O1305661122', '1999/10/22', '23772');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (46, 'Allene', 'Huckerby', 'ahuckerby19@sogou.com', 'E1612126055', '1993/12/25', '03551');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (47, 'Colver', 'Hyndman', 'chyndman1a@exblog.jp', 'R1371629248', '2002/06/26', '12368');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (48, 'Roxy', 'Mebes', 'rmebes1b@shareasale.com', 'Q1102338993', '1991/12/10', '08006');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (49, 'Kamilah', 'Riach', 'kriach1c@myspace.com', 'Q1068536072', '1998/12/16', '17280');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (50, 'Pierrette', 'Voelker', 'pvoelker1d@theatlantic.com', 'Z1454436658', '2003/04/07', '46536');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (51, 'Tiertza', 'Dyster', 'tdyster1e@i2i.jp', 'B1133920406', '2000/10/16', '24866');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (52, 'Kelila', 'Bramsom', 'kbramsom1f@ning.com', 'V1460490234', '1999/01/27', '10076');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (53, 'Kevin', 'Poundford', 'kpoundford1g@intel.com', 'I1191008986', '1994/11/30', '37422');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (54, 'Lucine', 'Booi', 'lbooi1h@zdnet.com', 'K1951956242', '2001/10/29', '80635');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (55, 'Waiter', 'Swindley', 'wswindley1i@harvard.edu', 'U1405051862', '2004/01/11', '50490');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (56, 'Inness', 'Thackham', 'ithackham1j@google.de', 'Q1179380027', '1993/04/10', '77338');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (57, 'Gearalt', 'Warn', 'gwarn1k@macromedia.com', 'N1864752478', '1998/03/28', '19848');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (58, 'Shari', 'Chiles', 'schiles1l@hibu.com', 'S1300226573', '1994/04/09', '13849');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (59, 'Phil', 'Bowhay', 'pbowhay1m@imgur.com', 'N1204381364', '2004/04/05', '45491');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (60, 'Theda', 'Son', 'tson1n@sbwire.com', 'H1548820079', '1990/06/06', '99468');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (61, 'Horace', 'Ruslinge', 'hruslinge1o@psu.edu', 'A1452500107', '1997/09/21', '46920');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (62, 'Valle', 'Collingworth', 'vcollingworth1p@nhs.uk', 'K1242614707', '1996/01/04', '12466');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (63, 'Chicky', 'Towler', 'ctowler1q@is.gd', 'V1538228799', '1997/06/04', '49892');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (64, 'Tootsie', 'Husselbee', 'thusselbee1r@indiegogo.com', 'M1296821199', '1994/12/12', '23511');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (65, 'Valerie', 'Bradbury', 'vbradbury1s@i2i.jp', 'N1272823331', '2003/05/18', '62458');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (66, 'Rabbi', 'Chilvers', 'rchilvers1t@addtoany.com', 'Z1382165789', '1991/07/01', '54492');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (67, 'Sigfried', 'MacManus', 'smacmanus1u@sun.com', 'F1766038078', '1993/01/31', '01783');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (68, 'Guy', 'Watsham', 'gwatsham1v@tumblr.com', 'J1251662330', '1998/11/07', '19156');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (69, 'Clarence', 'Orth', 'corth1w@prweb.com', 'J1470020098', '1995/10/23', '74614');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (70, 'Kele', 'Peoples', 'kpeoples1x@simplemachines.org', 'F1963265542', '1994/07/07', '45959');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (71, 'Dorthy', 'Leivesley', 'dleivesley1y@icq.com', 'W1506467512', '2001/10/10', '67399');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (72, 'Nobe', 'Gurden', 'ngurden1z@sfgate.com', 'U1211385592', '1992/04/29', '62948');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (73, 'Lothaire', 'Scoates', 'lscoates20@mlb.com', 'S1851252339', '1997/01/03', '03460');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (74, 'Goran', 'Prati', 'gprati21@illinois.edu', 'F1281943934', '2003/01/25', '92702');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (75, 'Curt', 'Trusty', 'ctrusty22@sohu.com', 'I1281134713', '2000/12/30', '63324');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (76, 'Ches', 'Sussems', 'csussems23@addtoany.com', 'V1436949380', '1991/04/13', '50206');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (77, 'Jorry', 'Wearden', 'jwearden24@aol.com', 'J1200946923', '1992/03/19', '31161');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (78, 'Arny', 'Ahren', 'aahren25@icio.us', 'M1468982325', '2001/11/19', '59283');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (79, 'Rockie', 'Samwell', 'rsamwell26@cnn.com', 'I1634472286', '1991/01/03', '41902');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (80, 'Michaella', 'Strutt', 'mstrutt27@cam.ac.uk', 'W1483624686', '1999/05/16', '59096');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (81, 'Archibaldo', 'Arminger', 'aarminger28@ibm.com', 'I1433208767', '1992/03/20', '37114');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (82, 'Gino', 'Plitz', 'gplitz29@alexa.com', 'K1550827538', '1990/02/13', '72916');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (83, 'Sidnee', 'Cabral', 'scabral2a@wufoo.com', 'P1020217206', '1996/06/22', '85258');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (84, 'Kirbie', 'Cannan', 'kcannan2b@businessinsider.com', 'Q1292327191', '2003/02/10', '71091');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (85, 'Haskel', 'Purveys', 'hpurveys2c@csmonitor.com', 'B1104680259', '1992/03/17', '63127');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (86, 'Tate', 'Cockett', 'tcockett2d@loc.gov', 'Z1774996173', '1996/01/29', '39167');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (87, 'Patience', 'Sarjent', 'psarjent2e@imgur.com', 'H1742441034', '1996/02/17', '55240');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (88, 'Mellie', 'Phillips', 'mphillips2f@dell.com', 'B1970364828', '1997/06/03', '29155');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (89, 'Butch', 'Yearnes', 'byearnes2g@mail.ru', 'G1070499294', '1993/06/12', '86815');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (90, 'Alejandro', 'Colbert', 'acolbert2h@state.tx.us', 'D1416828942', '1994/07/06', '00793');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (91, 'Britt', 'Joannic', 'bjoannic2i@alibaba.com', 'Y1765014076', '2004/11/10', '70225');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (92, 'Caprice', 'Belsham', 'cbelsham2j@facebook.com', 'M1568242526', '1997/03/13', '80304');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (93, 'Izak', 'Dahl', 'idahl2k@wunderground.com', 'D1850707028', '1999/04/28', '87796');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (94, 'Sarina', 'Bennen', 'sbennen2l@rambler.ru', 'J1570305309', '2000/03/11', '48017');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (95, 'Pet', 'Parchment', 'pparchment2m@prnewswire.com', 'F1057253614', '1996/11/11', '58721');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (96, 'Austin', 'Jannaway', 'ajannaway2n@paypal.com', 'R1948628798', '1996/09/24', '30433');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (97, 'Sharleen', 'Rablin', 'srablin2o@google.fr', 'W1679404035', '2003/03/25', '73137');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (98, 'Beulah', 'Winridge', 'bwinridge2p@zdnet.com', 'G1912564587', '1994/11/26', '43943');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (99, 'Hynda', 'Lewnden', 'hlewnden2q@4shared.com', 'E1755733793', '1994/11/17', '09444');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (100, 'Del', 'Bottinelli', 'dbottinelli2r@icq.com', 'J1012403505', '2001/02/17', '17847');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (101, 'Rochette', 'Chate', 'rchate2s@google.com', 'K1201854837', '2003/10/10', '43044');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (102, 'Tailor', 'Bosdet', 'tbosdet2t@photobucket.com', 'P1034081713', '2002/06/25', '36026');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (103, 'Donica', 'Addekin', 'daddekin2u@mayoclinic.com', 'N1460011954', '2000/01/10', '09024');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (104, 'Marris', 'Largen', 'mlargen2v@slashdot.org', 'B1557848771', '1998/06/04', '87223');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (105, 'Raymund', 'Baudry', 'rbaudry2w@dropbox.com', 'O1176662921', '2000/06/09', '72830');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (106, 'Feodor', 'Kears', 'fkears2x@csmonitor.com', 'X1337393284', '2004/02/01', '91710');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (107, 'Delano', 'Tankus', 'dtankus2y@ameblo.jp', 'A1621089333', '1992/09/16', '04873');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (108, 'Thekla', 'Closs', 'tcloss2z@biblegateway.com', 'V1870557442', '1996/07/08', '03203');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (109, 'Rosanne', 'Argue', 'rargue30@paginegialle.it', 'F1085041063', '2000/05/15', '74018');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (110, 'Kim', 'Ivashechkin', 'kivashechkin31@msn.com', 'S1942725199', '2000/01/31', '51420');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (111, 'Saudra', 'Howie', 'showie32@wsj.com', 'X1785291644', '1992/05/05', '29828');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (112, 'Skipper', 'Braunlein', 'sbraunlein33@mtv.com', 'R1825729640', '1997/08/16', '11890');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (113, 'Alaric', 'Nangle', 'anangle34@barnesandnoble.com', 'H1621637862', '1992/05/21', '65943');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (114, 'Jaclyn', 'Brassill', 'jbrassill35@examiner.com', 'K1655921554', '2001/08/09', '34081');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (115, 'Early', 'Radenhurst', 'eradenhurst36@drupal.org', 'Y1608828650', '2004/03/15', '26567');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (116, 'Clerc', 'Tirone', 'ctirone37@msn.com', 'L1698340025', '1996/08/17', '68364');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (117, 'Slade', 'Doblin', 'sdoblin38@hc360.com', 'E1999895290', '2002/01/03', '82341');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (118, 'Dora', 'Wyman', 'dwyman39@sciencedirect.com', 'M1850073746', '2001/09/28', '54299');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (119, 'Lilah', 'Beincken', 'lbeincken3a@cargocollective.com', 'A1971353881', '1990/03/25', '03481');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (120, 'Olga', 'Beatens', 'obeatens3b@ebay.com', 'N1326223152', '2000/01/16', '71524');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (121, 'Findlay', 'Raven', 'fraven3c@webs.com', 'T1496213985', '1997/07/23', '78338');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (122, 'Frazier', 'Konneke', 'fkonneke3d@nationalgeographic.com', 'D1435720244', '2000/08/15', '32142');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (123, 'Dorotea', 'Crannach', 'dcrannach3e@state.gov', 'S1596226872', '1994/09/06', '54464');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (124, 'Skye', 'Dilley', 'sdilley3f@scribd.com', 'H1865979987', '1995/11/13', '93705');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (125, 'Ilaire', 'Rogge', 'irogge3g@seesaa.net', 'I1748442814', '1998/02/23', '28246');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (126, 'Jessie', 'Hoston', 'jhoston3h@symantec.com', 'K1115507321', '1996/05/22', '58104');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (127, 'Rubie', 'Twist', 'rtwist3i@state.gov', 'U1927822700', '1999/09/22', '36368');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (128, 'Alica', 'Garred', 'agarred3j@craigslist.org', 'P1796816193', '1990/09/04', '48108');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (129, 'Bernardine', 'Nerval', 'bnerval3k@fotki.com', 'O1153972919', '2002/01/11', '09311');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (130, 'Etty', 'Drewery', 'edrewery3l@mapquest.com', 'W1734531729', '1998/06/25', '23291');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (131, 'Laryssa', 'MacParlan', 'lmacparlan3m@goo.gl', 'K1011430337', '2001/04/16', '77328');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (132, 'Burl', 'Duckhouse', 'bduckhouse3n@hexun.com', 'C1958452751', '2001/01/01', '50923');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (133, 'Osbourne', 'Chadwyck', 'ochadwyck3o@bravesites.com', 'Y1266631064', '1993/08/29', '42256');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (134, 'Hobart', 'Yurchenko', 'hyurchenko3p@reuters.com', 'W1466550657', '1994/10/19', '34806');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (135, 'Nonnah', 'Nickolls', 'nnickolls3q@mozilla.com', 'H1057402866', '1991/12/22', '05066');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (136, 'Romona', 'Alpes', 'ralpes3r@macromedia.com', 'J1952892241', '1994/08/27', '21512');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (137, 'Fulvia', 'Winyard', 'fwinyard3s@zimbio.com', 'Y1889533645', '1995/04/02', '25108');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (138, 'Trude', 'Deniso', 'tdeniso3t@wp.com', 'I1156277108', '1990/10/09', '25228');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (139, 'Angelina', 'Pipes', 'apipes3u@cam.ac.uk', 'S1967524005', '2000/07/04', '97692');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (140, 'Mervin', 'Brunnen', 'mbrunnen3v@oracle.com', 'F1950829936', '1997/10/12', '54558');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (141, 'Mirna', 'Martindale', 'mmartindale3w@telegraph.co.uk', 'G1584438840', '2003/06/02', '47133');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (142, 'Alvie', 'Hanselmann', 'ahanselmann3x@qq.com', 'B1004974333', '2003/10/11', '41539');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (143, 'Lise', 'Bailiss', 'lbailiss3y@webeden.co.uk', 'K1228399906', '2004/09/25', '84668');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (144, 'Darcy', 'Tibbetts', 'dtibbetts3z@cyberchimps.com', 'S1290156733', '2003/08/04', '58339');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (145, 'Lyndsie', 'Leal', 'lleal40@va.gov', 'O1044108046', '1992/12/10', '81187');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (146, 'Gib', 'Budgett', 'gbudgett41@i2i.jp', 'K1397918088', '1998/09/08', '29135');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (147, 'Mallissa', 'Sprott', 'msprott42@tuttocitta.it', 'Z1550916636', '2003/12/09', '39036');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (148, 'Meridel', 'Halbord', 'mhalbord43@google.com', 'M1121814633', '1993/01/09', '08612');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (149, 'Egbert', 'Loalday', 'eloalday44@wikispaces.com', 'E1043095537', '2000/03/09', '84290');
insert into passenger (passengerID, fname, lname, email, drivers_license, date_of_birth, location) values (150, 'Rockwell', 'Dei', 'rdei45@ft.com', 'K1505275167', '1991/04/01', '85173');


create table car (
	carID INT NOT NULL,
	brand VARCHAR2(50),
	licNO VARCHAR2(50),
	mfgyear VARCHAR2(25) CONSTRAINT chk_mfgyear CHECK (LENGTH (mfgyear) = 4),
	color VARCHAR2(50),
    car_category VARCHAR2(9) CONSTRAINT chk_category CHECK (car_category IN ('sedan', 'hatchback', 'SUV', 'minivan')),
    car_model VARCHAR2(50),
	PRIMARY KEY(carID)
);

insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (1, 'Chevrolet', 'T1542232', 1993, 'Turquoise', 'hatchback', 'S10 Blazer');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (2, 'Buick', 'R1649202', 2005, 'Goldenrod', 'SUV', 'Century');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (3, 'Mercury', 'A1848292', 2002, 'Violet', 'sedan', 'Cougar');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (4, 'Mercedes-Benz', 'P1343282', 2010, 'Green', 'SUV', 'Sprinter');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (5, 'Ford', 'A1044262', 2008, 'Pink', 'hatchback', 'Focus');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (6, 'Toyota', 'G1540282', 1997, 'Crimson', 'hatchback', 'Tercel');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (7, 'Mercedes-Benz', 'X1140222', 2008, 'Green', 'hatchback', 'CLS-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (8, 'Volkswagen', 'T1447262', 1984, 'Teal', 'SUV', 'Vanagon');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (9, 'Pontiac', 'S1044292', 1967, 'Purple', 'sedan', 'Bonneville');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (10, 'GMC', 'A1549252', 1992, 'Turquoise', 'minivan', 'Yukon');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (11, 'Mercedes-Benz', 'C1349222', 1992, 'Teal', 'sedan', '300CE');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (12, 'Mercedes-Benz', 'H1748292', 2009, 'Blue', 'hatchback', 'GL-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (13, 'Nissan', 'O1144222', 2012, 'Teal', 'sedan', 'Frontier');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (14, 'Subaru', 'P1841242', 2001, 'Mauv', 'minivan', 'Legacy');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (15, 'Kia', 'W1044292', 2012, 'Maroon', 'SUV', 'Rio');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (16, 'Land Rover', 'D1343232', 2011, 'Orange', 'SUV', 'Freelander');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (17, 'Audi', 'L1840202', 1994, 'Indigo', 'hatchback', '100');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (18, 'Jaguar', 'F1646282', 2004, 'Aquamarine', 'minivan', 'XK Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (19, 'Infiniti', 'E1947202', 2003, 'Green', 'sedan', 'G35');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (20, 'Rolls-Royce', 'R1247252', 2011, 'Fuscia', 'hatchback', 'Ghost');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (21, 'Chevrolet', 'G1645242', 2004, 'Green', 'SUV', 'Tracker');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (22, 'Lincoln', 'C1746222', 1999, 'Maroon', 'hatchback', 'Continental');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (23, 'GMC', 'E1343252', 2012, 'Orange', 'sedan', 'Savana 3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (24, 'Chevrolet', 'I1848242', 2003, 'Red', 'minivan', 'Malibu');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (25, 'Mitsubishi', 'D1445292', 2005, 'Green', 'sedan', 'Montero');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (26, 'Mitsubishi', 'I1540222', 1987, 'Red', 'SUV', 'Excel');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (27, 'Buick', 'V1848212', 1992, 'Violet', 'hatchback', 'Skylark');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (28, 'Nissan', 'C1044292', 1996, 'Blue', 'hatchback', 'Altima');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (29, 'Cadillac', 'E1740262', 2009, 'Yellow', 'sedan', 'STS');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (30, 'Chrysler', 'F1148292', 1999, 'Teal', 'hatchback', 'Cirrus');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (31, 'Mazda', 'T1242242', 2009, 'Aquamarine', 'SUV', 'CX-9');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (32, 'Ford', 'B1047202', 1987, 'Puce', 'minivan', 'Mustang');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (33, 'Chevrolet', 'I1849202', 2008, 'Goldenrod', 'sedan', 'Express 2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (34, 'Audi', 'G1741282', 2004, 'Maroon', 'sedan', 'Allroad');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (35, 'Chevrolet', 'J1243282', 1976, 'Khaki', 'sedan', 'Camaro');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (36, 'Honda', 'B1743222', 2011, 'Purple', 'hatchback', 'Element');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (37, 'Nissan', 'E1840222', 2004, 'Yellow', 'sedan', 'Frontier');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (38, 'Ford', 'N1849202', 1999, 'Red', 'SUV', 'F250');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (39, 'BMW', 'A1244202', 2003, 'Indigo', 'hatchback', 'M3');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (40, 'Chevrolet', 'C1740242', 1985, 'Pink', 'hatchback', 'Corvette');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (41, 'BMW', 'G1042212', 1958, 'Puce', 'sedan', '600');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (42, 'Pontiac', 'D1741292', 1977, 'Mauv', 'SUV', 'Grand Prix');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (43, 'Lincoln', 'F1047202', 2009, 'Puce', 'minivan', 'Navigator');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (44, 'BMW', 'Y1543282', 1999, 'Maroon', 'sedan', '5 Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (45, 'Pontiac', 'F1842272', 2005, 'Yellow', 'hatchback', 'Montana SV6');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (46, 'Daihatsu', 'C1948232', 1992, 'Turquoise', 'SUV', 'Rocky');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (47, 'Suzuki', 'M1246232', 1994, 'Khaki', 'sedan', 'SJ');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (48, 'Mazda', 'O1341232', 1998, 'Goldenrod', 'minivan', 'MPV');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (49, 'Geo', 'O1245202', 1992, 'Violet', 'minivan', 'Metro');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (50, 'Audi', 'Z1743272', 1998, 'Purple', 'minivan', 'A6');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (51, 'Subaru', 'D1546292', 1996, 'Pink', 'hatchback', 'Alcyone SVX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (52, 'Acura', 'M1748252', 2002, 'Purple', 'minivan', 'MDX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (53, 'Bentley', 'S1747252', 2007, 'Red', 'hatchback', 'Continental GTC');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (54, 'Mercedes-Benz', 'Y1449222', 1988, 'Indigo', 'sedan', 'SL-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (55, 'Infiniti', 'C1048252', 2004, 'Fuscia', 'SUV', 'G35');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (56, 'BMW', 'R1443222', 2012, 'Yellow', 'hatchback', '6 Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (57, 'BMW', 'B1740262', 2000, 'Puce', 'minivan', 'M');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (58, 'Mazda', 'B1742202', 2007, 'Khaki', 'sedan', 'Miata MX-5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (59, 'Chevrolet', 'B1543242', 2004, 'Aquamarine', 'hatchback', 'Colorado');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (60, 'GMC', 'F1649282', 2011, 'Fuscia', 'sedan', 'Sierra 3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (61, 'Volkswagen', 'L1545212', 2009, 'Goldenrod', 'minivan', 'Rabbit');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (62, 'Ford', 'R1248292', 2011, 'Puce', 'sedan', 'Flex');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (63, 'Toyota', 'K1742272', 2003, 'Blue', 'SUV', 'MR2');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (64, 'Aptera', 'Z1648232', 2009, 'Maroon', 'SUV', 'Typ-1');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (65, 'Nissan', 'Q1646212', 2010, 'Aquamarine', 'sedan', 'Armada');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (66, 'Ford', 'H1449202', 2005, 'Turquoise', 'sedan', 'Freestar');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (67, 'Chrysler', 'Z1745272', 1999, 'Turquoise', 'hatchback', 'TownCountry');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (68, 'GMC', 'S1945212', 2008, 'Violet', 'hatchback', 'Savana 2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (69, 'Mazda', 'O1142252', 2008, 'Blue', 'sedan', 'RX-8');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (70, 'Mercury', 'U1842202', 2008, 'Indigo', 'hatchback', 'Grand Marquis');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (71, 'Audi', 'W1643242', 1991, 'Aquamarine', 'minivan', '100');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (72, 'Kia', 'J1049222', 2010, 'Fuscia', 'hatchback', 'Sportage');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (73, 'BMW', 'I1746292', 1996, 'Fuscia', 'hatchback', '7 Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (74, 'Aston Martin', 'R1046242', 2006, 'Green', 'hatchback', 'DB9');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (75, 'Toyota', 'L1145262', 2004, 'Turquoise', 'SUV', 'Echo');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (76, 'Buick', 'P1542292', 2000, 'Purple', 'minivan', 'LeSabre');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (77, 'Honda', 'M1345242', 2011, 'Fuscia', 'minivan', 'CR-V');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (78, 'Ford', 'S1549282', 1993, 'Turquoise', 'hatchback', 'F350');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (79, 'Mazda', 'L1248232', 2000, 'Teal', 'sedan', 'B-Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (80, 'Chevrolet', 'D1148242', 1992, 'Mauv', 'sedan', 'Suburban 2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (81, 'GMC', 'O1442232', 2002, 'Red', 'sedan', 'Envoy XL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (82, 'Lexus', 'I1749222', 2007, 'Teal', 'sedan', 'IS');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (83, 'Mitsubishi', 'I1747222', 1985, 'Turquoise', 'minivan', 'Mirage');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (84, 'Dodge', 'E1043272', 2004, 'Crimson', 'hatchback', 'Ram 3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (85, 'Jeep', 'N1446212', 2010, 'Maroon', 'SUV', 'Patriot');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (86, 'Hummer', 'C1640212', 2002, 'Blue', 'minivan', 'H1');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (87, 'Kia', 'F1443212', 2003, 'Puce', 'hatchback', 'Optima');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (88, 'Toyota', 'M1646282', 2009, 'Indigo', 'SUV', 'FJ Cruiser');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (89, 'GMC', 'M1145232', 1998, 'Green', 'sedan', 'Sonoma');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (90, 'GMC', 'Z1047272', 1998, 'Yellow', 'minivan', '1500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (91, 'Suzuki', 'N1849272', 2006, 'Goldenrod', 'minivan', 'Aerio');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (92, 'GMC', 'E1647242', 1995, 'Fuscia', 'hatchback', 'Vandura G2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (93, 'Chevrolet', 'A1041262', 1993, 'Green', 'sedan', 'G-Series G30');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (94, 'Nissan', 'X1140272', 2003, 'Yellow', 'sedan', 'Sentra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (95, 'Volkswagen', 'O1341212', 1983, 'Maroon', 'SUV', 'Golf');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (96, 'Hyundai', 'G1645262', 1995, 'Indigo', 'sedan', 'Elantra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (97, 'BMW', 'B1047242', 1996, 'Maroon', 'sedan', 'Z3');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (98, 'Ford', 'D1045232', 1986, 'Orange', 'hatchback', 'Laser');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (99, 'Audi', 'U1946282', 2008, 'Indigo', 'sedan', 'Q7');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (100, 'Chevrolet', 'L1447282', 2010, 'Blue', 'sedan', 'Avalanche');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (101, 'Infiniti', 'F1740292', 2009, 'Aquamarine', 'minivan', 'EX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (102, 'Porsche', 'X1749232', 2002, 'Fuscia', 'SUV', 'Boxster');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (103, 'Mitsubishi', 'V1044222', 1987, 'Red', 'sedan', 'Cordia');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (104, 'Toyota', 'X1041242', 2003, 'Blue', 'sedan', 'Land Cruiser');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (105, 'Audi', 'D1745232', 2010, 'Goldenrod', 'minivan', 'S5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (106, 'Subaru', 'E1446282', 2010, 'Khaki', 'sedan', 'Impreza');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (107, 'Toyota', 'R1848212', 1998, 'Orange', 'minivan', 'Corolla');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (108, 'Ford', 'A1642292', 2009, 'Teal', 'sedan', 'F350');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (109, 'Subaru', 'F1441222', 2002, 'Maroon', 'SUV', 'Outback Sport');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (110, 'Chevrolet', 'J1842292', 1968, 'Red', 'hatchback', 'Camaro');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (111, 'Dodge', 'B1948262', 1993, 'Red', 'sedan', 'D150');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (112, 'Hyundai', 'B1041212', 2006, 'Crimson', 'minivan', 'Elantra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (113, 'Lexus', 'L1643282', 2009, 'Goldenrod', 'minivan', 'GX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (114, 'Kia', 'M1040212', 2007, 'Green', 'sedan', 'Sedona');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (115, 'Mitsubishi', 'D1343222', 1996, 'Green', 'minivan', 'Eclipse');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (116, 'Audi', 'J1149272', 2000, 'Pink', 'sedan', 'A4');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (117, 'Volvo', 'W1846282', 2007, 'Turquoise', 'minivan', 'S40');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (118, 'Lincoln', 'L1346242', 1984, 'Blue', 'SUV', 'Mark VII');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (119, 'Nissan', 'E1049232', 1996, 'Goldenrod', 'SUV', 'Altima');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (120, 'Mitsubishi', 'F1746292', 2003, 'Goldenrod', 'hatchback', 'Lancer Evolution');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (121, 'Chevrolet', 'W1545262', 1998, 'Purple', 'SUV', '3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (122, 'Oldsmobile', 'W1248262', 1999, 'Pink', 'SUV', 'Silhouette');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (123, 'Volvo', 'Z1748212', 2003, 'Fuscia', 'hatchback', 'C70');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (124, 'Mercedes-Benz', 'B1347242', 1990, 'Khaki', 'hatchback', 'S-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (125, 'Volvo', 'T1845282', 2005, 'Khaki', 'hatchback', 'S40');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (126, 'Hyundai', 'F1749232', 2004, 'Aquamarine', 'minivan', 'Santa Fe');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (127, 'Dodge', 'Z1441272', 1992, 'Maroon', 'sedan', 'Stealth');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (128, 'Chevrolet', 'C1941202', 2013, 'Yellow', 'hatchback', 'Malibu');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (129, 'Acura', 'K1748212', 2003, 'Orange', 'sedan', 'RL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (130, 'Honda', 'V1348232', 2004, 'Indigo', 'minivan', 'S2000');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (131, 'Toyota', 'Z1146282', 2008, 'Khaki', 'sedan', 'TundraMax');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (132, 'Toyota', 'H1043292', 1996, 'Violet', 'hatchback', 'Supra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (133, 'Pontiac', 'T1848222', 2010, 'Yellow', 'SUV', 'G3');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (134, 'Lincoln', 'E1045292', 2002, 'Goldenrod', 'SUV', 'Town Car');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (135, 'Land Rover', 'E1740282', 1996, 'Goldenrod', 'hatchback', 'Discovery');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (136, 'Lotus', 'V1147282', 1987, 'Maroon', 'SUV', 'Esprit');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (137, 'Nissan', 'S1440202', 1993, 'Indigo', 'sedan', 'Quest');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (138, 'Mitsubishi', 'A1446222', 2002, 'Goldenrod', 'sedan', 'Challenger');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (139, 'Maybach', 'I1445242', 2007, 'Blue', 'sedan', '57');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (140, 'Volkswagen', 'N1641262', 2009, 'Turquoise', 'minivan', 'Eos');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (141, 'Maybach', 'T1245272', 2009, 'Fuscia', 'minivan', '57');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (142, 'Aston Martin', 'E1344292', 2008, 'Green', 'SUV', 'Vantage');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (143, 'Scion', 'X1047232', 2011, 'Crimson', 'sedan', 'tC');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (144, 'Eagle', 'V1049272', 1993, 'Orange', 'sedan', 'Vision');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (145, 'Pontiac', 'U1043292', 1984, 'Yellow', 'sedan', 'Parisienne');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (146, 'Mercury', 'A1541232', 2008, 'Indigo', 'sedan', 'Mariner');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (147, 'Mitsubishi', 'N1445272', 1999, 'Pink', 'sedan', 'Diamante');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (148, 'Chevrolet', 'I1341292', 1964, 'Red', 'sedan', 'Corvette');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (149, 'Honda', 'V1749232', 1998, 'Khaki', 'hatchback', 'Prelude');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (150, 'Oldsmobile', 'D1748212', 1995, 'Fuscia', 'minivan', 'Ciera');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (151, 'Mitsubishi', 'X1042272', 1988, 'Turquoise', 'sedan', 'Chariot');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (152, 'Mazda', 'A1041232', 2009, 'Teal', 'minivan', 'Miata MX-5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (153, 'BMW', 'A1349222', 2013, 'Goldenrod', 'minivan', 'X6 M');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (154, 'Ram', 'Y1047212', 2012, 'Orange', 'minivan', '3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (155, 'Plymouth', 'M1542202', 1993, 'Teal', 'sedan', 'Voyager');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (156, 'Chrysler', 'P1942202', 2008, 'Turquoise', 'hatchback', 'Crossfire');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (157, 'Ford', 'R1049272', 2005, 'Crimson', 'hatchback', 'Escape');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (158, 'Saab', 'A1040212', 2003, 'Purple', 'hatchback', '9-5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (159, 'Mazda', 'W1240262', 1986, 'Violet', 'hatchback', '626');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (160, 'Audi', 'R1642282', 2004, 'Teal', 'minivan', 'A8');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (161, 'Aston Martin', 'X1446272', 2009, 'Fuscia', 'minivan', 'DB9');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (162, 'Land Rover', 'H1546232', 2009, 'Fuscia', 'SUV', 'LR3');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (163, 'Cadillac', 'F1744222', 2010, 'Indigo', 'hatchback', 'Escalade ESV');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (164, 'Volvo', 'A1845282', 2002, 'Indigo', 'hatchback', 'V70');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (165, 'Hyundai', 'T1540272', 2013, 'Violet', 'minivan', 'Accent');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (166, 'Dodge', 'U1449232', 2006, 'Purple', 'SUV', 'Ram 2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (167, 'Nissan', 'G1249202', 2008, 'Maroon', 'hatchback', 'Pathfinder');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (168, 'Volkswagen', 'B1043262', 2004, 'Fuscia', 'sedan', 'GTI');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (169, 'Mazda', 'M1745222', 2009, 'Turquoise', 'minivan', 'Mazda5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (170, 'Dodge', 'R1141252', 1995, 'Indigo', 'SUV', 'Dakota');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (171, 'Lamborghini', 'Z1841202', 1995, 'Red', 'hatchback', 'Diablo');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (172, 'GMC', 'T1547262', 2000, 'Fuscia', 'sedan', 'Savana 2500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (173, 'Lexus', 'H1140222', 2013, 'Green', 'minivan', 'LX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (174, 'Acura', 'V1448262', 2008, 'Crimson', 'SUV', 'RL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (175, 'Mitsubishi', 'G1441232', 2009, 'Indigo', 'minivan', 'Galant');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (176, 'Volkswagen', 'E1149212', 1988, 'Violet', 'sedan', 'Scirocco');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (177, 'Acura', 'P1740212', 2010, 'Pink', 'hatchback', 'ZDX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (178, 'Jeep', 'U1048212', 2002, 'Turquoise', 'SUV', 'Liberty');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (179, 'Mitsubishi', 'F1141202', 1984, 'Aquamarine', 'sedan', 'Mirage');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (180, 'Infiniti', 'V1943202', 2000, 'Red', 'sedan', 'G');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (181, 'GMC', 'E1445232', 2005, 'Green', 'minivan', 'Envoy XL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (182, 'BMW', 'H1346222', 2001, 'Red', 'minivan', '5 Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (183, 'Jeep', 'O1640212', 2008, 'Goldenrod', 'minivan', 'Grand Cherokee');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (184, 'Mercedes-Benz', 'C1946252', 1998, 'Puce', 'minivan', 'CL-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (185, 'Hyundai', 'J1240252', 2009, 'Crimson', 'sedan', 'Veracruz');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (186, 'Acura', 'W1248292', 1995, 'Purple', 'hatchback', 'Integra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (187, 'Volvo', 'R1549222', 2002, 'Violet', 'minivan', 'S40');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (188, 'Volvo', 'T1849262', 2002, 'Yellow', 'hatchback', 'S60');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (189, 'Volvo', 'T1145232', 2004, 'Indigo', 'SUV', 'S80');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (190, 'Pontiac', 'Q1246202', 2005, 'Orange', 'minivan', 'Monterey');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (191, 'Cadillac', 'X1448222', 2008, 'Mauv', 'hatchback', 'XLR');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (192, 'Dodge', 'H1449252', 1996, 'Goldenrod', 'sedan', 'Ram Van 3500');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (193, 'Volkswagen', 'D1249242', 1992, 'Blue', 'minivan', 'Fox');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (194, 'GMC', 'Y1641212', 2012, 'Red', 'hatchback', 'Savana');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (195, 'Plymouth', 'M1643222', 1994, 'Mauv', 'sedan', 'Laser');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (196, 'Volkswagen', 'F1449262', 2004, 'Teal', 'hatchback', 'New Beetle');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (197, 'Nissan', 'L1940202', 1996, 'Indigo', 'minivan', '300ZX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (198, 'Ford', 'L1747242', 2005, 'Violet', 'SUV', 'E250');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (199, 'Audi', 'Y1545252', 1988, 'Blue', 'hatchback', '80/90');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (200, 'Mercedes-Benz', 'K1845202', 2003, 'Pink', 'sedan', 'SL-Class');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (201, 'Ford', 'F1144222', 2008, 'Red', 'sedan', 'F450');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (202, 'Pontiac', 'C1742232', 1990, 'Puce', 'sedan', 'Firefly');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (203, 'Ford', 'J1344272', 2006, 'Violet', 'minivan', 'Expedition');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (204, 'Acura', 'I1340242', 1997, 'Teal', 'SUV', 'CL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (205, 'Mitsubishi', 'E1447212', 1987, 'Purple', 'minivan', 'Galant');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (206, 'Pontiac', 'G1345212', 2004, 'Goldenrod', 'minivan', 'Grand Prix');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (207, 'Bentley', 'B1549222', 2010, 'Yellow', 'SUV', 'Continental Super');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (208, 'Chevrolet', 'T1947282', 1996, 'Khaki', 'hatchback', 'Corsica');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (209, 'Chevrolet', 'I1041272', 1999, 'Green', 'hatchback', 'Prizm');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (210, 'Land Rover', 'C1047242', 2008, 'Blue', 'sedan', 'Range Rover Sport');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (211, 'Nissan', 'Q1344272', 2010, 'Goldenrod', 'SUV', 'Sentra');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (212, 'Toyota', 'B1443242', 2009, 'Violet', 'minivan', 'Avalon');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (213, 'Ford', 'M1044292', 1997, 'Blue', 'sedan', 'Explorer');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (214, 'Volvo', 'Y1743262', 2011, 'Fuscia', 'sedan', 'S60');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (215, 'Pontiac', 'J1141282', 1987, 'Blue', 'hatchback', 'Chevette');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (216, 'BMW', 'Y1543242', 2009, 'Yellow', 'sedan', '5 Series');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (217, 'Volvo', 'X1849262', 2010, 'Blue', 'hatchback', 'S60');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (218, 'Volvo', 'C1746252', 1995, 'Khaki', 'minivan', '850');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (219, 'Jeep', 'L1348232', 1998, 'Maroon', 'minivan', 'Grand Cherokee');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (220, 'Plymouth', 'W1841242', 1994, 'Green', 'sedan', 'Colt Vista');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (221, 'Chevrolet', 'S1846282', 2009, 'Purple', 'minivan', 'Silverado');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (222, 'Mitsubishi', 'K1745282', 1988, 'Yellow', 'hatchback', 'Tredia');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (223, 'Nissan', 'R1649232', 2003, 'Mauv', 'minivan', 'Maxima');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (224, 'Pontiac', 'L1947222', 1992, 'Mauv', 'SUV', 'Bonneville');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (225, 'Ford', 'W1346222', 2012, 'Maroon', 'minivan', 'E150');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (226, 'Pontiac', 'R1549242', 1991, 'Indigo', 'minivan', 'Sunbird');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (227, 'Acura', 'R1941202', 2012, 'Fuscia', 'sedan', 'RDX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (228, 'Mazda', 'L1041202', 2006, 'Orange', 'sedan', 'MX-5');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (229, 'Pontiac', 'O1747272', 2007, 'Goldenrod', 'minivan', 'G6');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (230, 'Volvo', 'B1541262', 2007, 'Green', 'sedan', 'V70');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (231, 'Chevrolet', 'O1242212', 2003, 'Puce', 'sedan', 'Venture');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (232, 'Ford', 'S1648202', 2007, 'Mauv', 'minivan', 'Freestar');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (233, 'Honda', 'B1042292', 2008, 'Orange', 'minivan', 'Civic');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (234, 'Audi', 'M1147292', 1986, 'Mauv', 'SUV', '5000S');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (235, 'Nissan', 'C1746212', 1992, 'Violet', 'minivan', 'NX');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (236, 'Lamborghini', 'B1647252', 2010, 'Blue', 'hatchback', 'Gallardo');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (237, 'Volvo', 'D1342262', 2004, 'Purple', 'hatchback', 'XC70');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (238, 'Acura', 'O1846282', 1999, 'Yellow', 'SUV', 'TL');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (239, 'Toyota', 'L1341212', 1994, 'Violet', 'sedan', '4Runner');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (240, 'Mazda', 'U1544262', 1988, 'Puce', 'hatchback', 'Familia');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (241, 'Geo', 'D1742272', 1997, 'Blue', 'hatchback', 'Prizm');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (242, 'Chevrolet', 'O1545272', 2001, 'Pink', 'sedan', 'Cavalier');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (243, 'Volvo', 'D1248212', 2009, 'Red', 'hatchback', 'S40');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (244, 'Toyota', 'P1743212', 1995, 'Blue', 'minivan', '4Runner');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (245, 'Mitsubishi', 'K1441212', 1999, 'Goldenrod', 'sedan', 'Montero Sport');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (246, 'Nissan', 'S1344222', 1998, 'Blue', 'minivan', 'Pathfinder');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (247, 'BMW', 'Z1743202', 2001, 'Orange', 'hatchback', '530');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (248, 'Volkswagen', 'L1843202', 2008, 'Khaki', 'SUV', 'New Beetle');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (249, 'Honda', 'B1442202', 1992, 'Orange', 'minivan', 'Accord');
insert into car (carID, brand, licNO, mfgyear, color, car_category, car_model) values (250, 'Cadillac', 'K1141292', 2009, 'Mauv', 'sedan', 'STS-V');


create table parking_lot (
	lotNO INT NOT NULL,
    location NUMBER,
    lotname VARCHAR2(50),
	slotnumber VARCHAR2(10),
	carID INT,
	current_status VARCHAR2 (20),
	PRIMARY KEY (lotNO),
    FOREIGN KEY (carID) references car(carID)
);  

insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (1, 12339, 'E7302', 'G1', 11);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (2, 20163, 'E7352', 'S8', 10);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (3, 55308, 'E8362', 'Y1', 5);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (4, 83078, 'E4352', 'Z8', 16);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (5, 93714, 'A1392', 'V9', 15);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (6, 00549, 'E1362', 'G8', 7);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (7, 89025, 'E1362', 'T9', 24);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (8, 10450, 'E4322', 'X8', 18);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (9, 91438, 'C1382', 'M1', 21);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (10, 15632, 'E8332', 'X0', 20);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (11, 97346, 'C6372', 'M1', 22);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (12, 57674, 'E9372', 'H8', 9);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (13, 63448, 'C8322', 'X1', 8);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (14, 79814, 'D5302', 'D1', 1);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (15, 01890, 'E9322', 'E8', 19);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (16, 24799, 'A4322', 'E9', 6);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (17, 92605, 'A9322', 'J2', 17);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (18, 33483, 'B7392', 'S2', 4);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (19, 56812, 'E8312', 'E7', 3);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (20, 23681, 'E2342', 'B6', 2);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (21, 26796, 'D7342', 'S9', 25);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (22, 28260, 'E9312', 'Q8', 14);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (23, 26855, 'E2392', 'B3', 23);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (24, 74827, 'E1322', 'C4', 13);
insert into parking_lot (lotNO, location, lotname, slotnumber, carID) values (25, 09459, 'E4382', 'N6', 12);


create table reservation (
	reservationID INT NOT NULL,
	pickup_date TIMESTAMP CONSTRAINT chk_pd CHECK (pickup_date > TO_DATE ('1950/01/01', 'YYYY/MM/DD')),
	return_date TIMESTAMP,
	passengerID INT,
	carID INT,
	lotNO INT,
	PRIMARY KEY(reservationID),
	FOREIGN KEY(passengerID) REFERENCES passenger(passengerID),
	FOREIGN KEY(carID) REFERENCES car(carID),
	FOREIGN KEY(lotNO) REFERENCES parking_lot(lotNO),
    CONSTRAINT chk_rd CHECK (return_date >= pickup_date)
);

insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (1, '2021-12-01 07:19:17', 39, 115, 7);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (2, '2021-04-18 09:27:09', 90, 180, 11);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (3, '2022-01-13 07:55:39', 118, 95, 6);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (4, '2021-11-10 21:18:07', '2021-11-12 06:15:04', 69, 134, 4);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (5, '2021-09-21 06:12:48', '2021-09-24 05:43:03', 130, 38, 1);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (6, '2021-09-11 11:22:20', '2021-09-14 11:06:28', 57, 44, 24);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (7, '2022-01-24 12:13:17', '2022-01-24 20:54:09', 146, 18, 20);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (8, '2021-06-26 06:36:03', '2021-06-26 13:35:27', 3, 145, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (9, '2021-05-11 03:51:53', '2021-05-11 17:21:59', 14, 102, 19);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (10, '2021-08-25 22:17:31', '2021-08-27 08:48:26', 135, 225, 8);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (11, '2021-02-24 13:22:46', '2021-02-26 05:00:28', 99, 135, 19);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (12, '2021-02-12 06:14:15', '2021-02-15 12:49:48', 112, 149, 8);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (13, '2021-11-08 16:12:37', '2021-11-10 03:34:29', 23, 113, 9);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (14, '2021-03-06 05:32:17', '2021-03-10 04:42:39', 86, 112, 8);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (15, '2021-08-25 20:30:58', 149, 238, 15);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (16, '2022-06-14 01:43:38', '2022-06-14 10:57:42', 127, 111, 12);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (17, '2022-02-25 23:07:44', 26, 12, 21);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (18, '2021-03-17 11:01:08', '2021-03-19 10:45:26', 144, 229, 11);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (19, '2021-04-13 19:13:41', '2021-04-18 07:05:41', 5, 151, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (20, '2021-09-24 08:06:30', '2021-09-30 11:56:22', 85, 87, 4);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (21, '2021-09-24 13:06:16', '2021-09-25 08:32:53', 82, 170, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (22, '2021-02-20 13:13:42', '2021-02-21 02:30:27', 123, 139, 13);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (23, '2021-04-23 19:50:33', '2021-04-26 07:28:30', 121, 225, 25);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (24, '2021-06-28 03:32:50', '2021-06-30 05:50:23', 136, 32, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (25, '2021-05-31 04:40:25', '2021-05-31 09:51:27', 42, 67, 16);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (26, '2021-08-19 16:17:57', '2021-08-19 20:44:13', 5, 235, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (27, '2021-06-02 01:30:07', '2021-06-03 09:54:41', 141, 2, 4);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (28, '2022-04-30 13:12:52', '2022-04-30 18:46:31', 126, 244, 9);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (29, '2022-12-23 04:09:34', '2022-12-24 05:04:35', 116, 16, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (30, '2021-04-13 20:03:19', '2021-04-14 20:52:50', 55, 179, 5);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (31, '2021-09-26 11:15:51', '2021-09-28 08:18:37', 10, 170, 23);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (32, '2021-11-22 05:15:52', '2021-11-25 03:10:00', 18, 77, 22);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (33, '2021-06-17 15:14:04', '2021-06-17 19:43:40', 121, 19, 1);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (34, '2021-07-03 05:48:03', '2021-07-03 17:41:54', 76, 140, 3);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (35, '2022-04-03 20:44:11', '2022-04-03 23:28:10', 69, 67, 25);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (36, '2021-07-31 01:47:14', '2021-08-02 00:38:04', 17, 238, 2);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (37, '2021-10-14 20:30:44', '2021-10-16 21:20:14', 23, 114, 11);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (38, '2021-01-27 17:13:06', '2021-01-27 19:12:42', 53, 42, 10);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (39, '2021-08-14 13:43:17', '2021-08-18 03:00:18', 38, 24, 13);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (40, '2021-05-12 14:56:05', '2021-09-16 21:46:42', 96, 174, 22);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (41, '2021-10-28 02:17:48', '2021-10-29 07:51:05', 99, 127, 8);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (42, '2022-07-12 16:48:26', '2022-07-12 20:24:19', 82, 210, 10);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (43, '2022-04-10 13:42:15', '2022-04-10 16:23:38', 99, 84, 5);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (44, '2021-09-02 12:17:36', '2021-09-04 16:52:36', 76, 204, 15);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (45, '2021-11-25 13:59:04', '2021-11-26 15:41:24', 50, 2, 14);
insert into reservation (reservationID, pickup_date, return_date, passengerID, carID, lotNO) values (46, '2021-06-14 12:01:07', '2021-06-16 12:15:41', 50, 147, 16);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (47, '2021-06-07 06:22:57', 59, 163, 2);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (48, '2021-08-13 10:41:47', 1, 29, 14);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (49, '2022-04-13 17:35:44', 74, 17, 14);
insert into reservation (reservationID, pickup_date, passengerID, carID, lotNO) values (50, '2021-07-17 11:11:45', 120, 75, 2);


create table tr_transaction (
	transactionID INT NOT NULL,
	trip_amount INT,
	trip_invoice VARCHAR2(50),
	transaction_date DATE,
	status VARCHAR2(9) CONSTRAINT st CHECK (status in ('COMPLETED', 'FAILED')),
	payment_type VARCHAR2(6),
    reservationID INT,
	PRIMARY KEY(transactionID),
    FOREIGN KEY (reservationID) REFERENCES reservation(reservationID)
);

insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (1, 380, '#521261', '2021-12-01', 'COMPLETED', 'CREDIT', 1);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (2, 260, '#520211', '2021-04-18', 'COMPLETED', 'CREDIT', 2);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (3, 315, '#423241', '2022-01-13', 'COMPLETED', 'CREDIT', 3);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (4, 315, '#122201', '2021-11-10', 'COMPLETED', 'CREDIT', 4);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (5, 330, '#321201', '2021-09-21', 'COMPLETED', 'CREDIT', 5);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (6, 380, '#323231', '2021-09-11', 'FAILED', 'CREDIT', 6);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (7, 210, '#622241', '2022-01-24', 'COMPLETED', 'CREDIT', 7);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (8, 220, '#427281', '2021-06-26', 'COMPLETED', 'DEBIT', 8);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (9, 240, '#525201', '2021-05-11', 'COMPLETED', 'CREDIT', 9);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (10, 270, '#626271', '2021-08-25', 'COMPLETED', 'DEBIT', 10);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (11, 235, '#526241', '2021-02-24', 'COMPLETED', 'CREDIT', 11);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (12, 390, '#124271', '2021-02-12', 'FAILED', 'DEBIT', 12);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (13, 230, '#923261', '2021-11-08', 'COMPLETED', 'DEBIT', 13);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (14, 240, '#227261', '2021-03-06', 'FAILED', 'CREDIT', 14);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (15, 395, '#020291', '2021-08-25', 'COMPLETED', 'CREDIT', 15);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (16, 300, '#929261', '2022-06-14', 'FAILED', 'CREDIT', 16);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (17, 340, '#822221', '2022-02-25', 'COMPLETED', 'DEBIT', 17);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (18, 325, '#922231', '2021-03-17', 'COMPLETED', 'CREDIT', 18);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (19, 375, '#323251', '2021-04-13', 'FAILED', 'CREDIT', 19);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (20, 240, '#627251', '2021-09-24', 'COMPLETED', 'CREDIT', 20);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (21, 360, '#227231', '2021-09-24', 'COMPLETED', 'DEBIT', 21);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (22, 310, '#124271', '2021-02-20', 'COMPLETED', 'DEBIT', 22);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (23, 240, '#626271', '2021-04-23', 'COMPLETED', 'DEBIT', 23);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (24, 380, '#523221', '2021-05-31', 'FAILED', 'DEBIT', 24);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (25, 385, '#925211', '2021-08-19', 'COMPLETED', 'CREDIT', 25);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (26, 225, '#327251', '2021-06-02', 'FAILED', 'DEBIT', 26);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (27, 250, '#428271', '2022-04-30', 'COMPLETED', 'DEBIT', 27);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (28, 380, '#123231', '2022-12-23', 'FAILED', 'DEBIT', 28);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (29, 365, '#428241', '2021-04-13', 'COMPLETED', 'CREDIT', 29);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (30, 270, '#025201', '2021-09-26', 'FAILED', 'CREDIT', 30);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (31, 335, '#625261', '2021-11-22', 'FAILED', 'CREDIT', 31);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (32, 265, '#429231', '2021-06-17', 'FAILED', 'CREDIT', 32);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (33, 400, '#021271', '2021-07-03', 'COMPLETED', 'DEBIT', 33);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (34, 245, '#325211', '2022-04-03', 'COMPLETED', 'CREDIT', 34);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (35, 365, '#921261', '2021-07-31', 'COMPLETED', 'CREDIT', 35);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (36, 355, '#428221', '2021-10-14', 'COMPLETED', 'CREDIT', 36);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (37, 345, '#929221', '2022-01-27', 'COMPLETED', 'DEBIT', 37);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (38, 250, '#520221', '2021-08-14', 'COMPLETED', 'DEBIT', 38);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (39, 200, '#720201', '2021-05-12', 'FAILED', 'DEBIT', 39);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (40, 310, '#225281', '2021-10-28', 'COMPLETED', 'CREDIT', 40);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (41, 290, '#524261', '2022-07-12', 'COMPLETED', 'CREDIT', 41);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (42, 395, '#427201', '2022-04-10', 'COMPLETED', 'DEBIT', 42);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (43, 350, '#720271', '2021-09-02', 'COMPLETED', 'CREDIT', 43);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (44, 325, '#428221', '2021-11-25', 'COMPLETED', 'DEBIT', 44);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (45, 280, '#225211', '2021-06-14', 'FAILED', 'DEBIT', 45);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (46, 225, '#723241', '2021-06-14', 'COMPLETED', 'DEBIT', 46);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (47, 305, '#729221', '2021-06-07', 'COMPLETED', 'DEBIT', 47);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (48, 300, '#520221', '2021-08-13', 'COMPLETED', 'DEBIT', 48);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (49, 375, '#921201', '2022-04-13', 'COMPLETED', 'CREDIT', 49);
insert into tr_transaction (transactionID, trip_amount, trip_invoice, transaction_date, status, payment_type, reservationID) values (50, 230, '#628271', '2021-07-17', 'FAILED', 'DEBIT', 50);


create table emp_department (
	deptID INT NOT NULL,
	dept_name VARCHAR2(50),
	PRIMARY KEY(deptID)
);

insert into emp_department (deptID, dept_name) values (1, 'Training');
insert into emp_department (deptID, dept_name) values (2, 'Support');
insert into emp_department (deptID, dept_name) values (3, 'Product Management');
insert into emp_department (deptID, dept_name) values (4, 'Engineering');
insert into emp_department (deptID, dept_name) values (5, 'Sales');
insert into emp_department (deptID, dept_name) values (6, 'Services');


create table employee (
	empID INT NOT NULL,
	full_name VARCHAR2(50),
	emp_dob DATE CONSTRAINT chk_empdob CHECK (emp_dob > TO_DATE ('1950/01/01', 'YYYY/MM/DD')),
	salary INT,
	deptID INT,
	PRIMARY KEY(empID),
	FOREIGN KEY(deptID) REFERENCES emp_department(deptID)
);

insert into employee (empID, full_name, emp_dob, salary, deptID) values (1, 'Lindsey Gotmann', '1980-12-16', 3000, 6);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (2, 'Jesse Harteley', '1986-05-10', 4000, 6);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (3, 'Gabey Raraty', '1999-09-08', 5000, 1);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (4, 'Lothario Roston', '2013-03-14', 3500, 2);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (5, 'Noelle Endean', '1987-08-08', 4500, 2);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (6, 'Luise Paoli', '1984-02-07', 4700, 3);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (7, 'Twyla Follis', '1987-04-11', 3100, 3);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (8, 'Opalina Jeannot', '1980-05-30', 4400, 3);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (9, 'Garreth Readitt', '1982-08-03', 8870, 3);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (10, 'Bengt Windley', '2014-07-05', 5400, 4);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (11, 'Emylee Ramelet', '1987-04-14', 5900, 5);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (12, 'Pat Kelinge', '2009-01-15', 3750, 5);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (13, 'Barbara Plumtree', '2010-11-29', 4360, 5);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (14, 'Gilli Bracegirdle', '1986-03-31', 8900, 5);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (15, 'Saree Masi', '2004-05-28', 6525, 5);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (16, 'Dorian Tolland', '2010-10-01', 7100, 1);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (17, 'Marybeth Kaesmakers', '2009-10-10', 4450, 2);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (18, 'Tades Beernt', '1987-04-28', 3200, 1);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (19, 'Teddy Pepler', '1999-07-15', 4000, 1);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (20, 'Diane-marie Melvin', '1986-09-10', 3350, 1);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (21, 'Brena Hayesman', '1993-10-03', 7600, 3);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (22, 'Gray Maggiore', '2009-07-13', 5400, 4);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (23, 'Fabian Molines', '2006-07-03', 5450, 4);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (24, 'Tyson Arrighi', '1998-04-09', 6300, 4);
insert into employee (empID, full_name, emp_dob, salary, deptID) values (25, 'Terrance Shillito', '1986-05-09', 5500, 3);


create table user_review (
	reviewID INT NOT NULL,
	rating_in_stars INT CONSTRAINT t_rating CHECK (rating_in_stars IN (1, 2, 3, 4, 5)),
	car_model_rating_in_stars INT CONSTRAINT c_rating CHECK (car_model_rating_in_stars IN (1, 2, 3, 4, 5)),
	reservationID INT,
	carID INT,
    PRIMARY KEY (reviewID),
	FOREIGN KEY (reservationID) REFERENCES reservation (reservationID),
    FOREIGN KEY (carID) REFERENCES car (carID)
);

insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (1, 5, 5, 1, 115);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (2, 5, 5, 2, 180);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (3, 4, 4, 3, 95);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (4, 3, 3, 4, 134);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (5, 5, 5, 5, 38);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (6, 5, 2, 6, 44);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (7, 5, 5, 7, 18);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (8, 2, 2, 8, 145);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (9, 4, 3, 9, 102);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (10, 3, 1, 10, 225);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (11, 2, 1, 11, 135);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (12, 1, 5, 12, 149);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (13, 4, 4, 13, 113);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (14, 1, 1, 14, 112);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (15, 4, 3, 15, 238);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (16, 5, 1, 16, 111);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (17, 4, 3, 17, 12);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (18, 3, 4, 18, 229);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (19, 5, 2, 19, 151);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (20, 3, 1, 20, 87);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (21, 2, 2, 21, 170);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (22, 2, 2, 22, 139);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (23, 1, 5, 23, 225);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (24, 3, 5, 24, 32);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (25, 4, 3, 25, 67);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (26, 4, 2, 26, 235);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (27, 3, 5, 27, 2);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (28, 1, 5, 28, 244);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (29, 1, 4, 29, 16);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (30, 4, 5, 30, 179);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (31, 1, 3, 31, 170);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (32, 4, 2, 32, 77);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (33, 2, 2, 33, 19);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (34, 1, 4, 34, 140);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (35, 2, 4, 35, 67);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (36, 1, 2, 36, 238);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (37, 2, 1, 37, 114);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (38, 3, 5, 38, 42);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (39, 1, 3, 39, 24);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (40, 4, 1, 40, 174);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (41, 4, 1, 41, 127);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (42, 4, 4, 42, 210);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (43, 2, 5, 43, 84);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (44, 4, 3, 44, 204);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (45, 5, 4, 45, 2);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (46, 3, 1, 46, 147);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (47, 4, 5, 47, 163);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (48, 3, 1, 48, 29);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (49, 3, 4, 49, 17);
insert into user_review (reviewID, rating_in_stars, car_model_rating_in_stars, reservationID, carID) values (50, 4, 4, 50, 75);


create table issue_category (
	categoryID INT PRIMARY KEY NOT NULL,
	category_name VARCHAR2(20)
);

insert into issue_category (categoryID, category_name) values (1, 'payment');
insert into issue_category (categoryID, category_name) values (2, 'booking');
insert into issue_category (categoryID, category_name) values (3, 'bug');
insert into issue_category (categoryID, category_name) values (4, 'cancellation');


create table customer_support (
	ticketNO INT NOT NULL,
	tkt_toc TIMESTAMP,
	ticketStatus VARCHAR2(8) CONSTRAINT tk_chk CHECK (ticketStatus IN ('RESOLVED', 'PENDING')),
	empID INT,
	passengerID INT,
    categoryID INT,
    ticket_resolved_ts TIMESTAMP,
	PRIMARY KEY (ticketNO),
	FOREIGN KEY (empID) REFERENCES employee(empID),
	FOREIGN KEY (passengerID) REFERENCES passenger(passengerID),
    FOREIGN KEY (categoryID) REFERENCES issue_category(categoryID)
);

insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (100, '2021-08-09 05:06:45', 'RESOLVED', 20, 1, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (101, '2022-01-07 16:55:16', 'RESOLVED', 7, 2, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (102, '2022-01-30 12:34:33', 'PENDING', 19, 3, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (103, '2021-02-04 04:19:02', 'RESOLVED', 22, 4, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (104, '2021-04-29 16:06:53', 'RESOLVED', 19, 5, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (105, '2021-09-02 11:04:45', 'RESOLVED', 14, 6, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (106, '2021-03-04 03:20:34', 'RESOLVED', 5, 7, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (107, '2021-11-29 05:30:29', 'RESOLVED', 18, 8, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (108, '2021-02-06 12:40:47', 'RESOLVED', 19, 9, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (109, '2021-08-29 10:00:35', 'PENDING', 5, 10, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (110, '2021-02-02 09:08:49', 'RESOLVED', 16, 11, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (111, '2022-02-27 14:08:35', 'RESOLVED', 6, 12, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (112, '2022-03-01 16:01:00', 'RESOLVED', 16, 13, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (113, '2021-10-29 05:09:18', 'PENDING', 15, 14, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (114, '2021-03-03 18:11:58', 'PENDING', 8, 15, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (115, '2021-05-20 01:38:48', 'RESOLVED', 19, 16, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (116, '2021-07-13 08:01:52', 'RESOLVED', 3, 17, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (117, '2021-07-22 21:04:59', 'PENDING', 23, 18, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (118, '2021-03-12 00:31:44', 'RESOLVED', 5, 19, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (119, '2021-11-02 05:40:30', 'PENDING', 25, 20, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (120, '2021-12-10 06:26:10', 'RESOLVED', 11, 21, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (121, '2022-03-09 19:44:37', 'PENDING', 1, 22, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (122, '2022-02-23 15:02:20', 'RESOLVED', 24, 23, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (123, '2021-02-10 07:27:48', 'RESOLVED', 21, 24, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (124, '2021-04-12 07:51:55', 'RESOLVED', 20, 25, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (125, '2021-02-02 11:22:56', 'RESOLVED', 12, 26, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (126, '2021-03-10 07:57:35', 'PENDING', 8, 27, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (127, '2022-03-08 19:04:57', 'RESOLVED', 13, 28, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (128, '2021-10-15 16:15:28', 'RESOLVED', 15, 29, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (129, '2021-09-14 14:07:09', 'PENDING', 22, 30, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (130, '2021-09-20 02:29:55', 'PENDING', 21, 31, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (131, '2021-03-09 00:53:58', 'PENDING', 19, 32, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (132, '2022-02-07 20:19:20', 'RESOLVED', 25, 33, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (133, '2022-02-25 17:56:31', 'PENDING', 12, 34, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (134, '2021-12-02 19:45:30', 'RESOLVED', 1, 35, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (135, '2021-06-21 08:06:34', 'RESOLVED', 24, 36, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (136, '2021-06-27 10:55:33', 'PENDING', 1, 37, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (137, '2021-05-15 08:44:02', 'PENDING', 21, 38, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (138, '2021-05-28 15:17:47', 'PENDING', 3, 39, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (139, '2021-12-28 17:25:19', 'PENDING', 1, 40, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (140, '2021-06-26 01:04:27', 'PENDING', 18, 41, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (141, '2021-03-03 01:14:38', 'PENDING', 21, 42, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (142, '2022-02-02 10:19:52', 'RESOLVED', 19, 43, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (143, '2021-02-15 17:51:46', 'RESOLVED', 21, 44, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (144, '2021-05-03 20:24:19', 'PENDING', 16, 45, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (145, '2021-09-16 15:24:49', 'RESOLVED', 2, 46, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (146, '2021-08-03 13:55:48', 'PENDING', 11, 47, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (147, '2021-10-14 23:31:58', 'RESOLVED', 13, 48, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (148, '2022-03-08 12:14:22', 'RESOLVED', 17, 49, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (149, '2021-05-21 16:13:58', 'RESOLVED', 6, 50, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (150, '2021-11-26 01:50:24', 'PENDING', 6, 51, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (151, '2021-12-08 14:40:07', 'RESOLVED', 7, 52, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (152, '2021-08-04 19:35:40', 'PENDING', 4, 53, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (153, '2022-01-06 05:01:36', 'RESOLVED', 21, 54, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (154, '2021-06-25 23:44:16', 'RESOLVED', 4, 55, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (155, '2021-06-16 14:15:36', 'RESOLVED', 25, 56, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (156, '2022-01-04 13:16:08', 'RESOLVED', 1, 57, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (157, '2021-08-29 17:29:46', 'PENDING', 17, 58, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (158, '2021-07-23 19:27:26', 'PENDING', 5, 59, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (159, '2021-03-16 13:11:10', 'RESOLVED', 1, 60, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (160, '2021-05-07 15:46:49', 'PENDING', 13, 61, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (161, '2022-01-19 08:40:44', 'RESOLVED', 6, 62, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (162, '2021-05-01 08:49:30', 'RESOLVED', 20, 63, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (163, '2021-02-18 16:48:29', 'RESOLVED', 24, 64, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (164, '2021-12-07 10:39:27', 'RESOLVED', 19, 65, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (165, '2021-10-25 01:16:17', 'RESOLVED', 14, 66, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (166, '2021-12-21 07:57:05', 'PENDING', 15, 67, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (167, '2021-02-08 14:41:24', 'RESOLVED', 11, 68, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (168, '2021-08-19 18:33:43', 'RESOLVED', 15, 69, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (169, '2021-07-31 05:57:21', 'PENDING', 5, 70, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (170, '2021-04-02 01:23:50', 'RESOLVED', 13, 71, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (171, '2021-09-20 11:39:45', 'PENDING', 20, 72, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (172, '2021-05-05 19:42:06', 'PENDING', 24, 73, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (173, '2021-12-24 05:47:16', 'PENDING', 25, 74, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (174, '2021-12-16 05:12:39', 'RESOLVED', 7, 75, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (175, '2021-06-01 13:19:26', 'RESOLVED', 20, 76, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (176, '2022-01-14 14:46:15', 'PENDING', 6, 77, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (177, '2021-09-07 17:13:21', 'RESOLVED', 10, 78, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (178, '2021-10-08 19:12:24', 'RESOLVED', 1, 79, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (179, '2021-05-03 07:34:27', 'PENDING', 20, 80, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (180, '2021-02-24 11:03:28', 'RESOLVED', 7, 81, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (181, '2021-09-16 19:34:51', 'RESOLVED', 11, 82, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (182, '2021-11-19 22:23:24', 'PENDING', 6, 83, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (183, '2021-07-11 03:18:25', 'RESOLVED', 21, 84, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (184, '2021-06-03 07:21:14', 'RESOLVED', 23, 85, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (185, '2021-09-03 02:43:08', 'RESOLVED', 4, 86, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (186, '2021-07-06 02:05:05', 'RESOLVED', 3, 87, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (187, '2021-10-16 03:24:22', 'RESOLVED', 4, 88, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (188, '2021-07-31 09:25:23', 'PENDING', 9, 89, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (189, '2021-03-23 12:26:36', 'RESOLVED', 24, 90, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (190, '2022-01-15 05:43:13', 'PENDING', 20, 91, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (191, '2022-02-24 13:01:11', 'RESOLVED', 19, 92, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (192, '2021-09-21 08:06:33', 'RESOLVED', 13, 93, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (193, '2021-02-03 15:55:58', 'RESOLVED', 12, 94, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (194, '2021-05-08 20:53:56', 'PENDING', 21, 95, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (195, '2021-03-14 06:55:51', 'PENDING', 9, 96, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (196, '2022-02-05 11:33:51', 'PENDING', 13, 97, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (197, '2021-07-07 15:52:45', 'PENDING', 22, 98, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (198, '2021-03-28 11:56:09', 'RESOLVED', 18, 99, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (199, '2021-11-21 12:59:17', 'RESOLVED', 4, 100, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (200, '2021-09-25 10:28:09', 'PENDING', 16, 101, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (201, '2021-02-03 10:05:42', 'RESOLVED', 2, 102, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (202, '2021-02-11 13:03:21', 'RESOLVED', 14, 103, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (203, '2021-04-07 18:05:44', 'RESOLVED', 24, 104, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (204, '2021-11-10 12:02:54', 'RESOLVED', 13, 105, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (205, '2021-05-25 21:46:30', 'PENDING', 25, 106, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (206, '2021-04-18 18:12:43', 'PENDING', 3, 107, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (207, '2021-06-25 15:34:03', 'RESOLVED', 7, 108, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (208, '2021-07-27 04:26:58', 'RESOLVED', 9, 109, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (209, '2021-09-06 18:44:36', 'PENDING', 8, 110, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (210, '2021-04-15 14:58:02', 'PENDING', 23, 111, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (211, '2021-12-16 21:40:52', 'RESOLVED', 19, 112, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (212, '2021-03-27 04:10:37', 'RESOLVED', 5, 113, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (213, '2021-04-09 20:37:42', 'RESOLVED', 22, 114, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (214, '2021-10-20 20:59:59', 'PENDING', 8, 115, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (215, '2021-10-18 13:10:36', 'RESOLVED', 1, 116, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (216, '2021-07-16 10:32:03', 'PENDING', 9, 117, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (217, '2021-03-10 22:03:19', 'RESOLVED', 12, 118, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (218, '2022-01-10 04:11:24', 'PENDING', 19, 119, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (219, '2021-02-06 18:59:16', 'PENDING', 2, 120, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (220, '2021-09-12 14:58:10', 'PENDING', 5, 121, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (221, '2021-07-20 02:47:00', 'PENDING', 5, 122, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (222, '2021-10-27 05:54:58', 'RESOLVED', 12, 123, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (223, '2021-04-12 08:55:35', 'PENDING', 19, 124, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (224, '2021-11-02 19:27:39', 'RESOLVED', 16, 125, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (225, '2021-10-01 04:04:43', 'RESOLVED', 17, 126, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (226, '2021-08-02 09:38:35', 'RESOLVED', 2, 127, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (227, '2021-04-24 15:07:21', 'PENDING', 5, 128, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (228, '2021-05-17 10:09:49', 'RESOLVED', 14, 129, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (229, '2021-03-03 15:00:06', 'RESOLVED', 20, 130, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (230, '2021-04-16 18:50:12', 'PENDING', 23, 131, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (231, '2021-11-11 23:35:42', 'RESOLVED', 12, 132, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (232, '2021-12-15 02:46:31', 'RESOLVED', 1, 133, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (233, '2021-08-07 19:21:11', 'PENDING', 20, 134, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (234, '2021-09-04 23:17:07', 'PENDING', 3, 135, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (235, '2021-08-20 17:42:02', 'RESOLVED', 17, 136, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (236, '2021-08-27 02:00:17', 'PENDING', 5, 137, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (237, '2021-03-06 12:41:03', 'PENDING', 13, 138, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (238, '2021-08-05 18:08:09', 'PENDING', 8, 139, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (239, '2022-02-02 04:38:40', 'PENDING', 23, 140, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (240, '2021-05-18 23:01:47', 'PENDING', 17, 141, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (241, '2021-04-01 06:42:50', 'PENDING', 4, 142, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (242, '2021-09-28 04:17:44', 'PENDING', 2, 143, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (243, '2021-10-19 16:42:13', 'RESOLVED', 1, 144, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (244, '2021-07-28 11:17:55', 'PENDING', 1, 145, 2);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (245, '2021-12-30 13:13:08', 'RESOLVED', 5, 146, 1);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (246, '2021-03-23 11:01:37', 'PENDING', 22, 147, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (247, '2021-10-05 18:12:32', 'PENDING', 7, 148, 4);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (248, '2021-10-16 08:00:33', 'PENDING', 24, 149, 3);
insert into customer_support (ticketNO, tkt_toc, ticketStatus, empID, passengerID, categoryID) values (249, '2021-12-13 18:14:21', 'RESOLVED', 19, 150, 3);


-- CREATION OF SYNONYMS

CREATE OR REPLACE PUBLIC SYNONYM syn_passenger FOR admin.passenger;
CREATE OR REPLACE PUBLIC SYNONYM syn_car FOR admin.car;
CREATE OR REPLACE PUBLIC SYNONYM syn_reservation FOR admin.reservation;
CREATE OR REPLACE PUBLIC SYNONYM syn_transaction FOR admin.tr_transaction;
CREATE OR REPLACE PUBLIC SYNONYM syn_emp FOR admin.employee;
CREATE OR REPLACE PUBLIC SYNONYM syn_empdept FOR admin.emp_department;
CREATE OR REPLACE PUBLIC SYNONYM syn_csupport FOR admin.customer_support;
CREATE OR REPLACE PUBLIC SYNONYM syn_ureview FOR admin.user_review;
CREATE OR REPLACE PUBLIC SYNONYM syn_plot FOR admin.parking_lot;
CREATE OR REPLACE PUBLIC SYNONYM syn_isscategory FOR admin.issue_category;




-- Granting user access to passenger user

GRANT CONNECT TO passenger;
GRANT CREATE SESSION TO passenger;

GRANT SELECT ON car TO passenger;
GRANT SELECT ON parking_lot TO passenger;
GRANT SELECT ON tr_transaction TO passenger;
GRANT SELECT, INSERT, UPDATE, DELETE ON passenger TO passenger;
GRANT SELECT, INSERT, UPDATE ON reservation TO passenger;
GRANT SELECT, INSERT, UPDATE, DELETE ON user_review TO passenger;
GRANT SELECT, INSERT, UPDATE, DELETE ON customer_support TO passenger;


-- Creating employee user
-- Granting user access to employee user

GRANT CONNECT TO employee;
GRANT CREATE SESSION TO employee;

GRANT CREATE TABLE TO employee;

GRANT SELECT, INSERT, UPDATE, DELETE ON car TO employee;
GRANT SELECT ON reservation TO employee;
GRANT SELECT ON tr_transaction TO employee;
GRANT SELECT, INSERT, UPDATE ON parking_lot TO employee;
GRANT SELECT ON user_review TO employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON emp_department TO employee;
GRANT SELECT, UPDATE ON customer_support TO employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON employee TO employee;

--VIEWS 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "CARS_BY_CATEGORY"
AS 
select car.car_category as Category,
count(*) as CountOfCars
from car
group by car_category;

GRANT SELECT ON CARS_BY_CATEGORY TO passenger, employee;

SELECT * FROM CARS_BY_CATEGORY;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "NO_OF_RENTAL_DAYS" 
AS 
select car.car_model as Model,
car.car_category as Category,
sum(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as Total_Rented_Days_By_This_Model
from car
join reservation on car.carID = reservation.carID
group by car.car_model, car.car_category;

GRANT SELECT ON NO_OF_RENTAL_DAYS TO employee;

SELECT * FROM NO_OF_RENTAL_DAYS;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "RENTALS_IN_A_LOCATION"
AS 
select location, count(parking_lot.carID)AS cars_rented_count
from parking_lot
join car on parking_lot.carID = car.carID
join reservation on reservation.carID = car.carID
group by location;

GRANT SELECT ON RENTALS_IN_A_LOCATION TO employee;

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

GRANT SELECT ON SUV_RENTED_PASSENGERS TO employee;

SELECT * FROM SUV_RENTED_PASSENGERS;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "TICKETS_PER_ISSUE_CATEGORY" 
AS 
select issue_category.category_name as IssueCategory,
count(customer_support.ticketNO) as NoOfTickets
from customer_support
join issue_category on issue_category.categoryID = customer_support.categoryID
group by issue_category.category_name;

GRANT SELECT ON TICKETS_PER_ISSUE_CATEGORY TO employee;

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

GRANT SELECT ON TOP_3_EMPLOYEES TO employee;

SELECT * FROM TOP_3_EMPLOYEES;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_USED_IN_DAYS"
AS 
select 
passenger.passengerID as PassengerID,
passenger.fname as Name,
(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as ServiceUsedinDays
from passenger
join reservation on passenger.passengerID = reservation.reservationID;

GRANT SELECT ON SERVICE_USED_IN_DAYS TO employee, passenger;

SELECT * FROM SERVICE_USED_IN_DAYS;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "AVG_RATING_PER_MODEL"
AS
select car.car_model as Model, 
car.car_category as category, 
round(avg(user_review.car_model_rating_in_stars), 2) as AvgRatingByUsers
from car
join user_review on user_review.carID = car.carID
group by car.car_model, car.car_category
order by AvgRatingByUsers desc;

GRANT SELECT ON AVG_RATING_PER_MODEL TO employee, passenger;

SELECT * FROM AVG_RATING_PER_MODEL;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "HIGHEST_RATED_MODEL_ZIPCODE"
AS 
select location AS Area, car_model as Highest_Rated_model, car_category as category
from parking_lot 
join car
on parking_lot.carID = car.carID 
join user_review on user_review.carID = car.carID
where user_review.car_model_rating_in_stars = 5;

GRANT SELECT ON HIGHEST_RATED_MODEL_ZIPCODE TO employee, passenger;

SELECT * FROM HIGHEST_RATED_MODEL_ZIPCODE;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "HIGHEST_RATED_MODEL_PER_CATEGORY"
AS 
select car_category as Category,
car_model as Highest_rated_Model,
car_model_rating_in_stars as Rating
from car
join user_review
on car.carID = user_review.carID
WHERE user_review.car_model_rating_in_stars = 5;

GRANT SELECT ON HIGHEST_RATED_MODEL_PER_CATEGORY TO employee, passenger;

SELECT * FROM HIGHEST_RATED_MODEL_PER_CATEGORY;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PER_TRIP_DURATION_IN_DAYS"
AS
select reservation.reservationID as TripID,
passenger.passengerID as passengerID,
CONCAT (CONCAT (passenger.fname, ' '), passenger.lname) AS PassengerName,
(trunc(reservation.return_date) - trunc(reservation.pickup_date)) as TripDurationInDays
from passenger
join reservation on passenger.passengerID = reservation.carID;

SELECT * FROM PER_TRIP_DURATION_IN_DAYS;

GRANT SELECT ON PER_TRIP_DURATION_IN_DAYS TO employee, passenger;


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

CREATE INDEX idx_carmodel ON car (car_model);

CREATE INDEX idx_carcategory ON car (car_category);

CREATE INDEX idx_parkloc ON parking_lot (location);

CREATE INDEX idx_modelstarrating ON user_review (car_model_rating_in_stars);

CREATE INDEX idx_fk_res_carid ON reservation (carID);


-- Creation of Triggers

CREATE OR REPLACE TRIGGER TRG_EMP_SALARY 
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE ('Employee ID: ' || :OLD.empID);
 DBMS_OUTPUT.PUT_LINE ('Old salary of employee ' || :OLD.salary);
 DBMS_OUTPUT.PUT_LINE ('New salary of employee ' || :NEW.salary);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;


/


CREATE OR REPLACE TRIGGER TRG_PASS_EMAIL 
BEFORE UPDATE ON passenger
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE ('Passenger ID: '  || :OLD.passengerID || ' Name: ' || :OLD.fname || :OLD.lname);
 DBMS_OUTPUT.PUT_LINE ('Old email of passenger ' || :OLD.email);
 DBMS_OUTPUT.PUT_LINE ('New email of passenger ' || :NEW.email);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;


/


CREATE OR REPLACE TRIGGER trg_car_license_change 
BEFORE UPDATE ON car
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE ('Car ID: '  || :OLD.carID || ' Model: ' || :OLD.car_model);
 DBMS_OUTPUT.PUT_LINE ('Old license number: ' || :OLD.licNO);
 DBMS_OUTPUT.PUT_LINE ('New license number: ' || :NEW.licNO);
 DBMS_OUTPUT.PUT_LINE ('                                                          ');
END;

/


CREATE OR REPLACE TRIGGER TRG_UPDCARSLOT 
AFTER INSERT ON tr_transaction
FOR EACH ROW
DECLARE cid NUMBER;
sts VARCHAR2 (50);
l_count NUMBER;
BEGIN
        
        sts := :NEW.status;
        IF sts = 'COMPLETED'
        THEN
                        SELECT COUNT (*) INTO l_count
                        FROM reservation
                        WHERE reservationID = :NEW.reservationID;
                        
                        IF l_count = 0
                        THEN DBMS_OUTPUT.PUT_LINE ('Invalid transaction entry for this reservation id');
                        
                        ELSE
                        SELECT carID INTO cid
                        FROM reservation
                        WHERE reservationID = :NEW.reservationID;
                        
                        UPDATE parking_lot
                        SET current_status = 'VACANT', carid = NULL
                        WHERE carID = cid;
                        
                        END IF;
        END IF;
END;


/


CREATE OR REPLACE PACKAGE pkg_car
IS
    PROCEDURE sp_insnewcar (
    brand IN car.brand%type,
    licnum IN car.licno%type,
    mfgyear IN car.mfgyear%type,
    color IN car.color%type,
    car_category IN car.car_category%type,
    model IN car.car_model%type);
    
    PROCEDURE sp_changecarlicno (c_id IN car.carID%type, c_newlic IN car.licNO%type);
    FUNCTION no_of_rentals_by_car (cid NUMBER) RETURN NUMBER;
    FUNCTION isReserved (cid NUMBER) RETURN NUMBER;
END pkg_car;

/

CREATE OR REPLACE PACKAGE BODY pkg_car
IS
  PROCEDURE sp_insnewcar 
(
    brand IN car.brand%type,
    licnum IN car.licno%type,
    mfgyear IN car.mfgyear%type,
    color IN car.color%type,
    car_category IN car.car_category%type,
    model IN car.car_model%type
)
IS
    same_count NUMBER;
BEGIN

  SELECT COUNT(*)
  INTO same_count
  FROM car
  WHERE licNO = licnum
  AND rownum = 1;
  
  IF same_count = 0 
  THEN 
    INSERT INTO car
    VALUES
        (car_seq.NEXTVAL, brand, licnum, mfgyear, color, car_category, model);
  ELSE DBMS_OUTPUT.PUT_LINE ('License Number already exists');
  END IF;
END sp_insnewcar;




  PROCEDURE sp_changecarlicno (c_id IN car.carID%type, c_newlic IN car.licNO%type) AS
  BEGIN
    UPDATE car
    SET licNO = c_newlic
    WHERE carID = c_id;

    DBMS_OUTPUT.PUT_LINE ('The license no. of car with ID: ' || c_id || ' has been changed to ' || c_newlic);
  END sp_changecarlicno;

  FUNCTION no_of_rentals_by_car (cid NUMBER) RETURN NUMBER
  IS
  cnt NUMBER;
  BEGIN
    SELECT COALESCE(count(*), 0) INTO cnt
    FROM car
    join reservation on car.carID = reservation.carID
    join tr_transaction on reservation.reservationID = tr_transaction.reservationID
    WHERE tr_transaction.status = 'COMPLETED'
    HAVING car.carID = cid
    GROUP BY car.carID;
    RETURN cnt;
    exception when no_data_found then return 0;
  END no_of_rentals_by_car;
  
  FUNCTION isReserved (cid NUMBER)
  RETURN NUMBER
  IS
    cnt NUMBER;
        BEGIN
            SELECT COUNT (*) INTO cnt
            FROM car c JOIN
             reservation r  ON c.carID = r.carID;
             --WHERE return_date IS NULL;
             --JOIN tr_transaction t ON r.reservationID = t.reservationID
             --WHERE t.status = 'COMPLETED';
             
            IF cnt > 0 THEN
               RETURN 1;
               
            ELSE RETURN 0;
            END IF;
            
    END isReserved;
             

END pkg_car;

/

CREATE OR REPLACE PACKAGE pkg_passenger 
IS
     PROCEDURE sp_insertnewpassenger
                               (
                                   fname         IN passenger.fname%type
                                 , lname         IN passenger.lname%type
                                 , email         IN passenger.email%type
                                 , drivers_lic   IN passenger.drivers_license%type
                                 , date_of_birth IN passenger.date_of_birth%type
                                 , location      IN passenger.location%type
                               );

    PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type);
	PROCEDURE sp_reservecar (n_days IN NUMBER, booking_date IN TIMESTAMP, pid IN NUMBER, cid IN NUMBER, slot_no IN VARCHAR2, rid OUT NUMBER);
	PROCEDURE sp_slotstatusupdate (rid IN NUMBER);
	PROCEDURE sp_makepayment (amount IN DECIMAL, payment_type IN VARCHAR2, rid IN NUMBER);
	--PROCEDURE sp_findvacantslots (curr_loc NUMBER);
	PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER);
	
	FUNCTION fn_findnearbyvacantslot (curr_loc NUMBER) RETURN VARCHAR2;
    FUNCTION firstVacantCar RETURN NUMBER;
END pkg_passenger;

/

CREATE OR REPLACE PACKAGE BODY pkg_passenger
IS
  PROCEDURE sp_insertnewpassenger
                               (
                                   fname         IN passenger.fname%type
                                 , lname         IN passenger.lname%type
                                 , email         IN passenger.email%type
                                 , drivers_lic   IN passenger.drivers_license%type
                                 , date_of_birth IN passenger.date_of_birth%type
                                 , location      IN passenger.location%type
                               )
IS
    pid        INT;
    same_count NUMBER;
    CURSOR cur IS
        SELECT
               passengerID
        FROM
               passenger
        ;
    
    cnt    NUMBER;
    excep1 EXCEPTION;
	excep2 EXCEPTION;
	excep3 EXCEPTION;
	excep4 EXCEPTION;
    excep5 EXCEPTION;
BEGIN
    --SELECT COUNT(*) INTO cnt
    --FROM passenger
    --WHERE passengerID = passID;
    -- IF cnt = 1 THEN dbms_output.put_line('ID already exists..');
    --ELSE
	IF (fname IS NULL OR lname IS NULL OR email IS NULL OR drivers_lic IS NULL OR date_of_birth IS NULL OR location IS NULL)
	THEN RAISE excep1;
	
	ELSIF email NOT LIKE '%@%.%'
	THEN RAISE excep2;
	
	--ELSIF REGEXP_LIKE (date_of_birth, '[^0-9, -/]')
	ELSIF is_valid_date (date_of_birth, 'YYYY/MM/DD') <> 'Y' 
	--ELSIF (REGEXP_LIKE (date_of_birth, '^[0-9]{4}/[0-9]{2}/[0-9]{2}$')) OR EXTRACT (DAY FROM date_of_birth) > 31 OR EXTRACT (MONTH FROM date_of_birth) > 12
	THEN RAISE excep3;
    
    --ELSIF REGEXP_LIKE (date_of_birth, '^[a-zA-Z]*$')
    --THEN RAISE excep5;
	
	ELSE 
		SELECT
           COUNT(*)
		INTO
           same_count
		FROM
           passenger
		WHERE
           drivers_license = drivers_lic
        AND rownum      = 1
    ;
    
		IF same_count = 0 THEN
			INSERT         INTO passenger
               (passengerID
                    , fname
                    , lname
                    , email
                    , drivers_license
                    , date_of_birth
                    , location
               )
               VALUES
               (pass_seq.NEXTVAL
                    , fname
                    , lname
                    , email
                    , drivers_lic
                    , TO_DATE (date_of_birth, 'YYYY/MM/DD')
                    , location
               )
        ;
    
		ELSE
			RAISE excep4;
			DBMS_OUTPUT.PUT_LINE ('This drivers license already exists chosen another one');
		END IF;
    END IF;
EXCEPTION
	WHEN excep1 THEN
		dbms_output.put_line ('Please enter all fields for the passenger');
	WHEN excep2 THEN
		dbms_output.put_line ('Please enter correct format for Email ID');
	WHEN excep3 THEN
		dbms_output.put_line ('Please enter correct format for birth date: YYYY/MM/DD');
	WHEN excep4 THEN
		dbms_output.put_line ('This drivers license already exists chosen another one');
    WHEN excep5 THEN 
        dbms_output.put_line ('Alphabets found in date!');
	WHEN OTHERS THEN
		dbms_output.put_line(SQLERRM);
		dbms_output.put_line('Duplicate ID');
END sp_insertnewpassenger;



  PROCEDURE sp_changepassemail (p_id IN passenger.passengerid%type, p_newemail IN passenger.email%type) 
  AS
  BEGIN

    UPDATE passenger
    SET email = p_newemail
    WHERE passengerID = p_id;

  END sp_changepassemail;
  
  PROCEDURE sp_reservecar (n_days IN NUMBER, booking_date IN TIMESTAMP, pid IN NUMBER, cid IN NUMBER, slot_no IN VARCHAR2, rid OUT NUMBER)
  AS 
	lt_no NUMBER;
    car_already_booked_exception EXCEPTION;
    is_open NUMBER;
    CURSOR cur IS 
        SELECT carID FROM reservation WHERE return_date IS NULL;
	BEGIN
    
        OPEN cur;
        
        LOOP
        FETCH cur INTO is_open ;
        --DBMS_OUTPUT.PUT_LINE (is_open);
        EXIT WHEN CUR%FOUND;
        END LOOP;
        
        IF cid = is_open
        THEN DBMS_OUTPUT.PUT_LINE ('This car is already booked');
        
        ELSE
		SELECT lotNO INTO lt_no
		FROM parking_lot
		WHERE slotnumber = slot_no;
    
		INSERT INTO reservation
		VALUES (resr_seq.NEXTVAL, booking_date, booking_date + numtodsinterval (n_days, 'DAY'), pid, cid, lt_no);
		
		SELECT resr_seq.CURRVAL INTO rid  FROM dual;
        
        END IF;
    
    EXCEPTION
        WHEN car_already_booked_exception THEN
            DBMS_OUTPUT.PUT_LINE ('This car is already booked');
    
   END sp_reservecar;
   
   PROCEDURE sp_slotstatusupdate (rid IN NUMBER)
   IS
   cid NUMBER;
   BEGIN
    
        SELECT carID INTO cid
        FROM reservation
        WHERE reservationID = rid;
        
        UPDATE parking_lot
        SET current_status = 'VACANT', carid = NULL
        WHERE carID = cid;
        
   END sp_slotstatusupdate;
   
   PROCEDURE SP_MAKEPAYMENT  (amount IN DECIMAL, payment_type IN VARCHAR2, rid IN NUMBER)
  IS
  t_inv VARCHAR2 (75);
  count1 NUMBER;
  sts VARCHAR2 (50);
  inv_payment EXCEPTION;
  BEGIN
        
        IF rid <> resr_seq.CURRVAL 
        THEN RAISE inv_payment;
        
        ELSE
        IF fn_chkpayment (rid) = 1
                THEN DBMS_OUTPUT.PUT_LINE ('Payment already done');
        
        ELSE 
                    t_inv := CONCAT ( CONCAT ('#', rid), tr_seq.NEXTVAL);
                    INSERT INTO tr_transaction
                    VALUES (tr_seq.NEXTVAL, amount, t_inv, SYSDATE, 'COMPLETED', payment_type, rid);
                    DBMS_OUTPUT.PUT_LINE ('Payment Completed for Trip ID: ' || rid);
        END IF;
    END IF;
        
    EXCEPTION
     WHEN inv_payment THEN DBMS_OUTPUT.PUT_LINE ('Payment Failed');
        
        
END SP_MAKEPAYMENT;
	
	
	PROCEDURE sp_parkcar (l_name VARCHAR2, cid NUMBER)
	IS
	c_status VARCHAR2 (10);
	count1 NUMBER;
    no_slot EXCEPTION;
	BEGIN
    
        IF l_name = 'No vacant locations available'
        THEN RAISE no_slot;
        
        
        ELSE
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
    END IF;
    EXCEPTION
            WHEN no_slot
            THEN DBMS_OUTPUT.PUT_LINE ('No slot currently available for parking');
    
	END SP_PARKCAR;
	
	FUNCTION fn_findnearbyvacantslot (curr_loc NUMBER)
	RETURN VARCHAR2  
	IS
	lot_name VARCHAR2 (50);
	lcn VARCHAR2 (50);
	min_zip_dist NUMBER;
	BEGIN
        
         SELECT lotname INTO lot_name
         FROM parking_lot
         WHERE current_status = 'VACANT'
         --ORDER BY 1 ASC
         ORDER BY (ABS (curr_loc - location) ) ASC
         FETCH FIRST 1 ROWS ONLY;
         
         SELECT location INTO lcn
         FROM parking_lot
         WHERE current_status = 'VACANT'
         --ORDER BY 1 ASC
         ORDER BY (ABS (curr_loc - location) ) ASC
         FETCH FIRST 1 ROWS ONLY;
         
        DBMS_OUTPUT.PUT_LINE ('The lot ' || lot_name || ' at location ' || lcn || ' is the closest vacant lot from your location');
        RETURN lot_name;
        
	EXCEPTION
        WHEN NO_DATA_FOUND
        THEN RETURN 'No vacant locations available';


	END FN_FINDNEARBYVACANTSLOT;
    
    FUNCTION firstVacantCar
    RETURN NUMBER
    IS
    is_open NUMBER;
    CURSOR cur IS 
        SELECT carID FROM reservation WHERE return_date IS NOT NULL;
    BEGIN
    OPEN cur;
        
        LOOP
        FETCH cur INTO is_open ;
        EXIT WHEN CUR%FOUND;
        END LOOP;
        
        RETURN is_open;
    END firstVacantCar;

END pkg_passenger;

/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgpass FOR admin.pkg_passenger;
GRANT EXECUTE ON syn_pkgpass TO employee;

GRANT EXECUTE ON pkg_passenger TO passenger;

CREATE OR REPLACE PACKAGE pkg_employee AS 
    
    PROCEDURE sp_insertnewemp  
(
    ename IN employee.full_name%type,
    dob IN employee.emp_dob%type,
    sal IN employee.salary%type,
    deptid IN employee.deptid%type
);
    
    PROCEDURE SP_CHGTICKETRESOLVEDSTATUS  (tktno IN NUMBER);
    FUNCTION tickets_solved_by_emp (eid NUMBER) RETURN NUMBER;
END pkg_employee;

/

CREATE OR REPLACE PACKAGE BODY pkg_employee
IS
  PROCEDURE sp_insertnewemp  
  (
    ename IN employee.full_name%type,
    dob IN employee.emp_dob%type,
    sal IN employee.salary%type,
    deptid IN employee.deptid%type
  ) 
  IS
  BEGIN
        insert into employee
        values
         (emp_seq.NEXTVAL, ename, dob, sal, deptid);
  END sp_insertnewemp;

  PROCEDURE sp_chgticketresolvedstatus  (tktno IN NUMBER) AS
  BEGIN
    UPDATE customer_support
        SET ticketstatus = 'RESOLVED',
        ticket_resolved_ts = SYSDATE
        WHERE ticketno = tktno;

        DBMS_OUTPUT.put_line('Status updated to resolved for ticket number ' || tktno);
  END SP_CHGTICKETRESOLVEDSTATUS;

  FUNCTION tickets_solved_by_emp (eid NUMBER) RETURN NUMBER
  IS
  cnt NUMBER;
  BEGIN
        SELECT COALESCE(count(ticketNO), 0) INTO cnt
        FROM employee
        JOIN customer_support on employee.empID = customer_support.empID
        WHERE customer_support.ticketStatus = 'RESOLVED'
        HAVING employee.empID = eid
        GROUP BY employee.empID;
        RETURN cnt;
   EXCEPTION WHEN no_data_found THEN RETURN 0;
  END tickets_solved_by_emp;

END pkg_employee;

/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgemp FOR admin.pkg_employee;
GRANT EXECUTE ON syn_pkgemp TO employee;
GRANT EXECUTE ON pkg_employee TO employee;



/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgcar FOR admin.pkg_car;
GRANT EXECUTE ON syn_pkgcar TO employee;

GRANT EXECUTE ON pkg_car TO employee;

CREATE OR REPLACE PACKAGE pkg_reservation 
IS
    FUNCTION total_bookings_by_a_passenger (pid NUMBER) RETURN NUMBER;
	FUNCTION fn_calctripamt (rid IN NUMBER) RETURN DECIMAL;
    FUNCTION FN_CHKPAYMENT  (rid NUMBER) RETURN NUMBER;
    PROCEDURE sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_rating_for_trip  ( tripID IN INT);
    PROCEDURE sp_tripsbw2dates ( p_firstdate IN reservation.pickup_date%type, p_seconddate IN reservation.pickup_date%type);
    PROCEDURE sp_generatereceipts   (start_month IN NUMBER, end_month IN NUMBER, yr IN VARCHAR2);
END pkg_reservation;

/

create or replace PACKAGE BODY pkg_reservation
IS
    -- Function Implementation
    FUNCTION total_bookings_by_a_passenger (pid NUMBER)  
	RETURN NUMBER
    IS 
    cnt NUMBER;
    BEGIN

        SELECT COALESCE(count(*), 0) INTO cnt
        FROM passenger
        join reservation on passenger.passengerID = reservation.reservationID
        join tr_transaction on reservation.reservationID = tr_transaction.reservationID
        WHERE tr_transaction.status = 'COMPLETED'
        AND passenger.passengerID = pid
        GROUP BY passenger.passengerID;

        RETURN cnt;
    EXCEPTION when no_data_found then return 0;
   END total_bookings_by_a_passenger;
   
   FUNCTION fn_calctripamt (rid IN NUMBER) 
   RETURN DECIMAL
   IS
    cid NUMBER;
	c_cat VARCHAR2 (10);
	total_amt DECIMAL;
	n_days NUMBER;
	n_hours NUMBER;
    l_count NUMBER;

	BEGIN
    
        SELECT COUNT (*) INTO l_count
        FROM reservation
        WHERE reservationID = rid;
        
        IF l_count = 0 
         THEN DBMS_OUTPUT.PUT_LINE ('Invalid payment  for reservation ID');
         
        ELSE
        SELECT carID INTO cid
        FROM reservation
        WHERE reservationid = rid;
        
        SELECT car_category INTO c_cat
        FROM car
        WHERE carID = cid;
        
        SELECT (CAST (return_date AS DATE) - CAST (pickup_date AS DATE)) INTO n_days
        FROM reservation
        WHERE reservationID = rid;
        
        SELECT ABS(24*extract(day from diff)+extract(hour from diff)) hrs INTO n_hours FROM 
             (
				SELECT
				reservationID,
				TO_TIMESTAMP(  return_date, 'YYYY-MM-DD HH24:MI:SS') -
				TO_TIMESTAMP(   pickup_date, 'YYYY-MM-DD HH24:MI:SS') diff
				FROM reservation
				WHERE reservationID = rid
            );
        
        CASE
            WHEN c_cat = 'sedan'
            --THEN total_amt := (n_days) * 40;
            THEN total_amt := n_hours *12;
            
            WHEN c_cat = 'SUV'
            --THEN total_amt := (n_days) * 50;
            THEN total_amt := n_hours * 15;
            
            WHEN c_cat = 'hatchback'
            --THEN total_amt := (n_days) * 30;
            THEN total_amt := n_hours * 8;
            
            WHEN c_cat = 'minivan'
            --THEN total_amt := (n_days) * 35;
            THEN total_amt := n_hours * 10;
        END CASE;
        
        END IF;
        
        RETURN total_amt;
    END FN_CALCTRIPAMT;
    
    FUNCTION FN_CHKPAYMENT  (rid NUMBER)
    RETURN NUMBER 
    AS 
    a NUMBER;
    st VARCHAR2 (50);
    l_count NUMBER;
    BEGIN
     a := 0;
  --SELECT status INTO st FROM tr_transaction
  --WHERE reservationid = rid;
  
    SELECT COUNT(*) INTO l_count
    FROM tr_transaction JOIN reservation
    ON tr_transaction.reservationID = reservation.reservationID
    WHERE tr_transaction.status = 'COMPLETED' AND reservation.reservationID = rid;
    
 -- IF st = 'COMPLETED'
    IF l_count > 0
    THEN
        RETURN 1;
    ELSE RETURN 0;
    END IF;
   END FN_CHKPAYMENT;
	
   -- Procedure Implementation
   
   PROCEDURE sp_1sttripbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    tripid INT;
    begin
    select reservationID into tripid from reservation
    where pickup_date between p_firstdate and p_seconddate
    fetch first 1 rows only;
    dbms_output.put_line (tripid || ' is the tripid of the 1st trip b/w given dates');
    end sp_1sttripbetweentwodates;

    PROCEDURE sp_nooftripsbetweentwodates (p_firstdate IN reservation.pickup_date%type,
    p_seconddate IN reservation.pickup_date%type)
    is
    trip_count INT;
    begin
    select count(reservationID) into trip_count from reservation
    where pickup_date between p_firstdate and p_seconddate;
    dbms_output.put_line ('There were ' || trip_count || ' trips b/w the given dates');
    end sp_nooftripsbetweentwodates;

    PROCEDURE sp_rating_for_trip (tripID IN INT )
    is
    star_rating NUMBER;
    begin
    select  user_review.rating_in_stars INTO star_rating
    from reservation join user_review
    on reservation.reservationID = user_review.reservationID
    where reservation.reservationID = tripid;

    DBMS_OUTPUT.put_line('Rating for tripid ' || tripID || ' was ' || star_rating);
    end sp_rating_for_trip;

    PROCEDURE sp_tripsbw2dates ( p_firstdate IN reservation.pickup_date%type,  p_seconddate IN reservation.pickup_date%type)
    is    
        tripid INT;
        pid INT;
         t_date TIMESTAMP;
         car_model VARCHAR(20);
    cursor cur_trip is
        select reservationID, passengerID, pickup_date from reservation
        where pickup_date between p_firstdate and p_seconddate;
    begin
         dbms_output.put_line ('Trips b/w ' || p_firstdate || ' and ' || p_seconddate || ':');
     open cur_trip;
     loop
        fetch cur_trip into tripid, pid, t_date;
        exit when cur_trip%NOTFOUND;
        dbms_output.put_line ('Date: ' || t_date || ',' || ' Trip ID: '  || tripid || ', Passenger ID: ' || pid);  
    end loop;
    close cur_trip;

    end sp_tripsbw2dates;

    PROCEDURE SP_GENERATERECEIPTS   (start_month IN NUMBER, end_month IN NUMBER, yr IN VARCHAR2)

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

END pkg_reservation;

/

CREATE OR REPLACE PUBLIC SYNONYM syn_pkgres FOR admin.pkg_reservation;
GRANT EXECUTE ON syn_pkgres TO employee;

GRANT EXECUTE ON pkg_reservation TO employee;


-- IMPLEMENTATION USING SAMPLE TESTS

-- Data insertion through stored procedures

BEGIN

    pkg_passenger.sp_insertnewpassenger ('John', 'Smith', 'jsmith@abc.com', 'K8900198381', '1980/01/10', '56786');
    pkg_passenger.sp_insertnewpassenger ('Mark', 'Twain', 'mtwain@yahoo.com', 'B8107788390', '1950/09/30', '88779');
    pkg_passenger.sp_insertnewpassenger ('Charles', 'Dickens', 'cdickens@hotmail.com', 'Z6199088111', '1977/06/11', '28479');
    pkg_passenger.sp_insertnewpassenger ('Trofim', 'Lea', 'trlea@yahoo.com', 'B8188988390', '1950/09/23', '88129');
    pkg_passenger.sp_insertnewpassenger ('Bonaccorso', 'Cadwaladr', 'Bonaccorso@yahoo.com', 'B8178901390', '1950/09/08', '83629');
    pkg_passenger.sp_insertnewpassenger ('Emilija', 'Dudda', 'emili@yahoo.com', 'U8178666690', '1987/09/06', '11176');
    pkg_passenger.sp_insertnewpassenger ('George', 'Kamila', 'kamila@yahoo.com', 'K8114566690', '1999/09/01', '12756');
    pkg_passenger.sp_insertnewpassenger ('Rian', 'Theodoulos', 'rian@yahoo.com', 'P8177789190', '2001/09/07', '23456');
    pkg_passenger.sp_insertnewpassenger ('Mira',  'Shiro', 'miras@yahoo.com', 'H8111932821', '2001/09/07', '22456');
    pkg_passenger.sp_insertnewpassenger ('Olivia', 'Voss', 'ovoss0@addthis.com', 'U1649417829', '1995/02/15', '95491');
    pkg_passenger.sp_insertnewpassenger ('Cathee', 'Iwanicki', 'ciwanicki1@netlog.com', 'S1380610732', '2002/11/27', '64453');
    pkg_passenger.sp_insertnewpassenger ('Lindy', 'Winfield', 'lwinfield2@boston.com', 'V1492826466', '1996/05/29', '82496');
    pkg_passenger.sp_insertnewpassenger ('Cathee', 'Cheves', 'ccheves3@rakuten.co.jp', 'E1433278704', '2002/07/22', '49339');
    pkg_passenger.sp_insertnewpassenger ('Melva', 'Edgeller', 'medgeller4@360.cn', 'L1531777246', '2002/04/22', '85312');
    pkg_passenger.sp_insertnewpassenger ('Nils', 'Oliphard', 'noliphard5@bloomberg.com', 'H1913713361', '1994/11/06', '86283');
    pkg_passenger.sp_insertnewpassenger ('Adam', 'Pratchett', 'apratchett6@technorati.com', 'B1204558147', '1999/09/12', '79639');
    pkg_passenger.sp_insertnewpassenger ('Oralla', 'Gherardelli', 'ogherardelli7@linkedin.com', 'P1975667379', '1997/05/18', '85996');
    pkg_passenger.sp_insertnewpassenger ('Arline', 'Gillingwater', 'agillingwater8@altervista.org', 'N1536946842', '1992/07/19', '99393');

    pkg_employee.sp_insertnewemp ('Nick White', '1992-07-10', 10000, 4);
    pkg_employee.sp_insertnewemp ('Smith Jones', '1995-01-11', 7700, 3);
    pkg_employee.sp_insertnewemp ('Susana Scoyne', '1988-03-07', 8000, 1);
    pkg_employee.sp_insertnewemp ('Lionel Scoyne', '2002-07-09', 7000, 2);
    pkg_employee.sp_insertnewemp ('Osborne Trewartha', '1992-09-13', 13000, 3);
    pkg_employee.sp_insertnewemp ('Daryl Reichelt', '2013-08-20', 4500, 2);
    pkg_employee.sp_insertnewemp ('Flint Edess', '1985-09-25', 6700, 3);
    pkg_employee.sp_insertnewemp ('Kellby Drewes', '2009-09-26', 3000, 2);
    pkg_employee.sp_insertnewemp ('Hank Thaller', '1996-09-26', 4400, 4);
    pkg_employee.sp_insertnewemp ('Hobie Tryhorn', '1986-12-23', 5000, 2);
    pkg_employee.sp_insertnewemp ('Kevon Shortan', '1999-12-17', 6000, 1);
    pkg_employee.sp_insertnewemp ('Marty Tease', '1989-10-17', 2400, 3);

    pkg_car.sp_insnewcar ('Ford', 'S6789001', '2022', 'Black', 'SUV', 'F-150');
    pkg_car.sp_insnewcar ('BMW', 'Z6667042', '2022', 'Silver', 'sedan', 'i7');
    pkg_car.sp_insnewcar ('Audi', 'Y6444401', '2022', 'Yellow', 'sedan', 'e-Tron');
    pkg_car.sp_insnewcar ('Honda', 'O1242202', 2008, 'Fuscia', 'hatchback', 'Pilot');
    pkg_car.sp_insnewcar ('Kia', 'R1440272', 1995, 'Mauv', 'hatchback', 'Sephia');
    pkg_car.sp_insnewcar ('Dodge', 'F1648242', 2008, 'Pink', 'sedan', 'Ram 3500');
    pkg_car.sp_insnewcar ('Dodge', 'U1240262', 2001, 'Khaki', 'SUV', 'Grand Caravan');
    pkg_car.sp_insnewcar ('Mercury', 'N1246232', 1984, 'Orange', 'SUV', 'Topaz');
    pkg_car.sp_insnewcar ('Lexus', 'U1641262', 1993, 'Purple', 'SUV', 'LS');
    pkg_car.sp_insnewcar ('Volvo', 'Y1241232', 1994, 'Crimson', 'minivan', '940');
    pkg_car.sp_insnewcar ('Smart', 'T1644272', 2012, 'Mauv', 'hatchback', 'Fortwo');
    pkg_car.sp_insnewcar ('Dodge', 'R1941202', 2006, 'Turquoise', 'hatchback', 'Dakota');
    pkg_car.sp_insnewcar ('Buick', 'G1141292', 1985, 'Mauv', 'sedan', 'Somerset');
END;

/

BEGIN
    pkg_passenger.sp_changepassemail (3, 'sbleaden3@psu.edu');  
    pkg_passenger.sp_changepassemail (11, 'cece@gmail.com');
END;

/


SELECT passengerID, email FROM passenger WHERE passengerID = 3;
SELECT passengerID, email FROM passenger WHERE passengerID = 11;

DECLARE a NUMBER;
b NUMBER;
c NUMBER;
BEGIN
    a := pkg_reservation.total_bookings_by_a_passenger (9);
    b := pkg_reservation.total_bookings_by_a_passenger (22);
    c := pkg_reservation.total_bookings_by_a_passenger (110);

    DBMS_OUTPUT.PUT_LINE ('Passenger with id 9, made' || a || ' total bookings.');
    DBMS_OUTPUT.PUT_LINE ('Passenger with id 22, made' || b || ' total bookings.');
    DBMS_OUTPUT.PUT_LINE ('Passenger with id 110, made' || c || ' total bookings.');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    

    pkg_reservation.sp_1sttripbetweentwodates ('2021-01-01 00:00:00', '2021-03-01 00:00:00');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    pkg_reservation.sp_1sttripbetweentwodates ('2021-04-01 00:00:00', '2021-06-01 00:00:00');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    
    pkg_reservation.sp_nooftripsbetweentwodates ('2021-02-15 00:00:00', '2021-08-30 00:00:00');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    pkg_reservation.sp_nooftripsbetweentwodates ('2021-09-01 00:00:00', '2021-12-30 00:00:00');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    

    pkg_reservation.sp_rating_for_trip (45);
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    pkg_reservation.sp_rating_for_trip (23);
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    pkg_reservation.sp_rating_for_trip (10);
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
   

    pkg_reservation.sp_tripsbw2dates ('2021-04-04 00:00:00', '2022-01-01 00:00:00');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    pkg_reservation.sp_tripsbw2dates ('2021-05-02 00:00:00', '2022-03-06 00:00:00');

    -- To generate receipts between two months of a year, entering month number
    pkg_reservation.sp_generatereceipts (2, 7, 2021);
    pkg_reservation.sp_generatereceipts (1, 8, 2022);
END;

/

DECLARE d NUMBER;
e NUMBER;
BEGIN

    pkg_employee.sp_chgticketresolvedstatus (109);
    pkg_employee.sp_chgticketresolvedstatus (137);

    d := pkg_employee.tickets_solved_by_emp (138);
    DBMS_OUTPUT.PUT_LINE ('Employee No. 138 resolved ' || d || ' tickets in total');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');

    e := pkg_employee.tickets_solved_by_emp (100);
    DBMS_OUTPUT.PUT_LINE ('Employee No. 100 resolved ' || e || ' tickets in total');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');

END;

/

DECLARE f NUMBER;
g NUMBER;
BEGIN

    -- To update the license no. of car with ID 2
    pkg_car.sp_changecarlicno (2, 'A8899009');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    -- To update the license no. of car with ID 50
    pkg_car.sp_changecarlicno (50, 'J9029571');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');
    -- To update the license no. of car with ID 86
    pkg_car.sp_changecarlicno (86, 'H8784868');
    DBMS_OUTPUT.PUT_LINE ('                                                       ');

    f := no_of_rentals_by_car (210);
    DBMS_OUTPUT.PUT_LINE ('No. of rentals by the car ID 210 are: ' || f);
    DBMS_OUTPUT.PUT_LINE ('                                                       ');

    g := no_of_rentals_by_car (147);
    DBMS_OUTPUT.PUT_LINE ('No. of rentals by the car ID 147 are: ' || g);
END;

/

DECLARE a NUMBER;
vc NUMBER;

rid NUMBER;
rid2 NUMBER;
rid4 NUMBER;
amt NUMBER;
amt2 NUMBER;
nby_slt VARCHAR2 (55);
nby_slt2 VARCHAR2 (55);

BEGIN
    vc :=  pkg_passenger.firstvacantcar();
    DBMS_OUTPUT.PUT_LINE ('First vacant car id :' || vc);
    pkg_passenger.sp_reservecar (5, '2022/04/27', 34, vc, 'G1', rid);
	
    amt := pkg_reservation.fn_calctripamt (rid);	
	DBMS_OUTPUT.PUT_LINE ('The total payable amount for Trip ID: ' || rid || ' is ' || amt);
    
    pkg_passenger.sp_makepayment (amt, 'CREDIT', rid);
	
    nby_slt := pkg_passenger.fn_findnearbyvacantslot (02120);
	DBMS_OUTPUT.PUT_LINE ('The nearby slot is: ' || nby_slt);
	
    pkg_passenger.sp_parkcar (nby_slt, 4);
    
    -- Booking car of ID 5
    pkg_passenger.sp_reservecar (2, SYSTIMESTAMP, 100, 5, 'Y1', rid4);
	
	
	
	
END;

/



DECLARE c NUMBER;
vc2 NUMBER;
rid3 NUMBER;
amt3 DECIMAL;
nby_slt3 VARCHAR2 (51);

BEGIN
        
        --vc2 :=  pkg_passenger.firstvacantcar();
       -- DBMS_OUTPUT.PUT_LINE ('First vacant car id :' || vc2);
        pkg_passenger.sp_reservecar (4, SYSTIMESTAMP, 149, 15, 'T9', rid3);
        
        amt3 := pkg_reservation.fn_calctripamt (rid3);
        DBMS_OUTPUT.PUT_LINE ('The total payable amount for Trip ID: ' || rid3 || ' is ' || amt3);
        
        pkg_passenger.sp_makepayment (amt3, 'CREDIT', rid3);
        
        DBMS_OUTPUT.PUT_LINE (amt3);
        
        DBMS_OUTPUT.PUT_LINE ('The nearby slot is: ' || nby_slt3);
        nby_slt3  := pkg_passenger.fn_findnearbyvacantslot  (23489);
        
        
        pkg_passenger.sp_parkcar (nby_slt3, 66);
        
        
END;

/


SELECT carID, licNO FROM car WHERE carID = 2;
SELECT carID, licNO FROM car WHERE carID = 50;
SELECT carID, licNO FROM car WHERE carID = 86;  