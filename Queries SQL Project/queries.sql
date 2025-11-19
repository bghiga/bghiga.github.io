set echo on
set pagesize 10000
set linesize 10000


drop table ticket;
drop table passenger;
drop table reservation;
drop table departures
drop table equip_type;
drop table pilots;
drop table flight;
drop table airport;

create table airport (air_code varchar2(3) primary key, air_location varchar2(20), air_elevation number,
air_phone varchar2(10), air_hub_airline varchar2(20));
insert into airport values ('FLG', 'Flagstaff, AZ', 6920, '6027741897','');
insert into airport values ('PHX', 'Phoenix, AZ', 1257, '6025831971','Air West');
insert into airport values ('MSP', 'Minneapolis, MN', 862, '6123782910','Northwest');
insert into airport values ('LAX', 'Los Angeles, CA', 37, '3102731846','');
insert into airport values ('SFO', 'San Francisco, CA', 78, '4158392371','');
insert into airport values ('IAH', 'Houston, TX', 5, '2816642000','Continental');
insert into airport values ('DFW', 'Dallas, TX', 210, '2146218044','American');
insert into airport values ('JFK', 'New York, NY', 43, '2106732145', 'United');
insert into airport values ('DTW', 'Detroit, MI', 23, '4158219000', 'American');
insert into airport values ('OIA', 'Orlando, FL', 20, '5183240912', 'TWA');
insert into airport values ('MIA', 'Miami, FL', 16, '7175203400', 'Grand Cayman');

create table flight (fl_flight_no number(6) primary key, fl_orig varchar2(3) constraint 
flight_orig_fk references airport(air_code), 
fl_dest varchar2(3) constraint flight_Dest_fk references airport(air_code),
fl_orig_time DATE, fl_dest_time DATE, fl_meal char(1) constraint flight_meal_cc check
(fl_meal ='B' or fl_Meal='L' or fl_meal='D' or fl_Meal='S' or fl_meal=''), fl_fare number constraint
flight_fare_cc check(fl_fare >= 30 and fl_fare <=350), fl_distance number,
fl_time_zones number constraint flight_zone_cc check (fl_time_zones >= -2 and fl_time_zones <=2));

insert into flight values (101, 'FLG', 'PHX', to_date('05:15:am','hh:mi:am'), to_date('06:20:am','hh:mi:am'),'S', 48.50, 200, 0);
insert into flight values (102, 'PHX', 'MSP', to_date('09:00:am','hh:mi:am'), to_date('01:00:pm','hh:mi:pm'),'L', 156.00, 1000,1);
insert into flight values (103, 'MSP', 'PHX', to_date('05:00:pm','hh:mi:am'), to_date('07:15:pm','hh:mi:am'),'D', 156.00, 1000, -1 );
insert into flight values (104, 'PHX', 'FLG', to_date('08:30:pm','hh:mi:am'), to_date('09:15:pm','hh:mi:am'),'S', 48.50, 200, 0);
insert into flight values (15, 'PHX', 'LAX',  to_date('07:00:am','hh:mi:am'), to_date('07:20:am','hh:mi:am'),'B', 49.00, 400, -1);
insert into flight values (329, 'LAX', 'PHX', to_date('09:10:pm','hh:mi:am'), to_date('11:59:pm','hh:mi:am'), '', 49.00, 400, 1);
insert into flight values (40, 'PHX', 'LAX',  to_date('10:25:pm','hh:mi:am'), to_date('10:42:pm','hh:mi:am'), '', 49.00, 400, -1);
insert into flight values (400, 'LAX', 'PHX', to_date('10:10:am','hh:mi:am'), to_date('12:59:pm','hh:mi:am'), '', 49.00, 400, 1);
insert into flight values (600, 'PHX', 'SFO', to_date('06:46:am','hh:mi:am'), to_date('07:50:am','hh:mi:am'),'B', 109.00, 750, -1);
insert into flight values (604, 'PHX', 'SFO', to_date('08:33:am','hh:mi:am'), to_date('09:43:am','hh:mi:am'),'B', 109.00, 750, -1);
insert into flight values (606, 'PHX', 'SFO', to_date('11:45:am','hh:mi:am'), to_date('12:50:pm','hh:mi:am'),'L', 109.00, 750, -1);
insert into flight values (198, 'LAX', 'SFO', to_date('11:20:pm','hh:mi:am'), to_date('01:40:am','hh:mi:am'), '', 69.00, 400, 1);
insert into flight values (298, 'PHX', 'LAX', to_date('05:00:am','hh:mi:am'), to_date('05:30:am','hh:mi:am'), '', 39.00, 400, -1);
insert into flight values (60, 'PHX', 'SFO',  to_date('05:45:pm','hh:mi:am'), to_date('06:36:pm','hh:mi:am'),'S', 139.00, 750, -1);
insert into flight values (59, 'SFO', 'PHX',  to_date('10:00:am','hh:mi:am'), to_date('11:30:am','hh:mi:am'),'S', 149.00, 750, 1);
insert into flight values (691, 'SFO', 'PHX', to_date('11:25:am','hh:mi:am'), to_date('01:04:pm','hh:mi:am'), '', 109.00, 750, 1);
insert into flight values (518, 'SFO', 'PHX', to_date('02:23:pm','hh:mi:am'), to_date('04:16:pm','hh:mi:am'), '', 109.00, 750, 1);
insert into flight values (1260, 'SFO', 'PHX',to_date('05:58:pm','hh:mi:am'), to_date('07:51:pm','hh:mi:am'),'D', 109.00, 750, 1);
insert into flight values (500, 'IAH', 'DFW', to_date('08:00:am','hh:mi:am'), to_date('08:55:am','hh:mi:am'), '', 79.00, 250, 0);
insert into flight values (501, 'DFW', 'IAH', to_date('09:05:am','hh:mi:am'), to_date('10:00:am','hh:mi:am'), '', 79.00, 250, 0);
insert into flight values (502, 'IAH', 'JFK', to_date('08:30:am','hh:mi:am'), to_date('12:30:pm','hh:mi:am'), 'B', 289.00, 1200, -1);
insert into flight values (503, 'JFK', 'IAH', to_date('01:25:pm','hh:mi:am'), to_date('03:30:pm','hh:mi:am'),'S', 289.00, 1200, 1);
insert into flight values (521, 'IAH', 'DTW', to_date('11:30:am','hh:mi:am'), to_date('01:30:pm','hh:mi:am'),'L', 218.00, 1000, 0);
insert into flight values (723, 'DTW', 'JFK', to_date('01:30:pm','hh:mi:am'), to_date('04:05:pm','hh:mi:am'),'S', 189.00, 1000, 1);

create table pilots (pil_pilot_id varchar2(3) constraint pilots_pilotID_pk primary key, 
pil_pilotname varchar2(30), pil_ssn varchar2(9),
pil_street varchar2(20), pil_city varchar2(12), pil_state varchar2(2), pil_zip varchar2(5),
pil_flight_pay number(4), pil_brthdate date, pil_hiredate date);

insert into pilots VALUES ('WRP', 'Pasewark, William B.', '523451784', '64 RHODA AVENUE','PHOENIX', 'AZ', '84326', 2500, '02-JUL-1958', '23-JUL-1993');
insert into pilots VALUES ('ELL', 'Leiss, Ernst L.', '234783222', '91 BEVERLY HILL RD',  'FLAGSTAFF', 'AZ', '85120', 2640, '12-SEP-1953', '21-JAN-1990');
insert into pilots VALUES ('SSM', 'Moore, Sharon S.', '452127055', '44 THORNHILL TRAIL',  'LOS ANGELES', 'CA', '92300', 3000, '03-SEP-1952', '20-DEC-1989');
insert into pilots VALUES ('RS', 'Scamell, Richard', '452094673', '1500 EAST RIVERSIDE',  'CUPERTINO', 'CA', '94212', 560, '13-FEB-1913', '20-MAY-1995');
insert into pilots values ('SL', 'Long, Stuart', '148434500', '3722 GEORGETOWN',  'DALLAS', 'TX', '75090', 3000, '12-OCT-1950', '03-JUN-1991');
insert into PILOTS values ('CG', 'Gladchuk, Chet', '210453278', '519 TALL OAKS DRIVE',  'HOUSTON', 'TX', '77024', 3150, '03-JUN-1951', '28-FEB-1993');
insert into PILOTS values ('KCH', 'Harris, Kenneth C.', '211463278', '519 GREEN OAKS DRIVE',  'HOUSTON', 'TX', '77004', 3150, '03-JUN-1970', '28-MAY-1993');
insert into pilots VALUES ('VIT', 'Tabor, Victor T.', '234651322', '891 BARONSHIRE',  'FLAGSTAFF', 'AZ', '85120', 2640, '12-SEP-1973', '21-JAN-1998');
insert into pilots VALUES ('ELG', 'Green, Edward L.', '234781000', '9211 CANYON HILL RD',  'FLAGSTAFF', 'AZ', '85120', 2640, '12-SEP-1963', '21-JAN-1989');

CREATE TABLE EQUIP_TYPE(EQ_EQUIP_NO NUMBER constraint equip_type_pk primary key, EQ_EQUIP_TYPE VARCHAR2(10),EQ_SEAT_CAPACITY NUMBER, EQ_FUEL_CAPACITY NUMBER, EQ_miles_per_gal number(5,2));

INSERT INTO EQUIP_TYPE VALUES (1026, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1194, 'DC 7', 282, 2340, 3.8);
INSERT INTO EQUIP_TYPE VALUES (1080, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1368, 'DC 7', 282, 2340, 3.8);
INSERT INTO EQUIP_TYPE VALUES (1081, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1345, 'BOE 737', 270, 2150, 4.1);
INSERT INTO EQUIP_TYPE VALUES (1253, 'BOE 747', 480, 2800, 3.6);
INSERT INTO EQUIP_TYPE VALUES (1489, 'CONCORDE', 350, 2750, 3.1);
INSERT INTO EQUIP_TYPE VALUES (1347, 'BOE 737', 270, 2150, 4.1);
INSERT INTO EQUIP_TYPE VALUES (1082, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1346, 'BOE 737', 270, 2150, 4.1);
INSERT INTO EQUIP_TYPE VALUES (1083, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1084, 'BOE 727', 188, 1882, 3.4);
INSERT INTO EQUIP_TYPE VALUES (1085, 'BOE 727', 188, 1882, 3.4);

CREATE TABLE DEPARTURES (DEP_FLIGHT_NO NUMBER constraint departure_flight_no_fk references
flight(FL_flight_no), DEP_DEP_DATE DATE, DEP_PILOT_ID VARCHAR2(3) constraint departure_pilotID_fk
references pilots(PIL_pilot_ID), DEP_EQUIP_NO NUMBER constraint departure_EquipNo_fk references
Equip_type(EQ_equip_no), constraint departures_flightNo_Date_pk primary key (DEP_flight_no,DEP_Dep_Date));

insert into departures values ('15',' 01-APR-2017', 'WRP' , 1026);
insert into departures values ('15',' 28-JUN-2017', 'WRP' , 1026);
insert into departures values ('15',' 20-AUG-2017', 'WRP' , 1026);
insert into departures values ('40',' 28-JUN-2017', 'SL' , 1081);
insert into departures values ('40',' 29-JUN-2017', 'SL' , 1081);
insert into departures values ('40',' 20-AUG-2017', 'SL' , 1081);
insert into departures values ('40',' 21-AUG-2017', 'SL' , 1081);
insert into departures values ('40',' 21-SEP-2017', 'SL' , 1081);
insert into departures values ('40',' 22-SEP-2017', 'SL' , 1081);
insert into departures values ('40',' 23-SEP-2017', 'SL' , 1081);
insert into departures values ('40',' 29-SEP-2017', 'SL' , 1081);
insert into departures values ('60',' 19-APR-2017', 'ELL' , 1194);
insert into departures values ('60',' 04-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 05-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 08-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 10-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 20-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 21-JUN-2017', 'ELL' , 1194);
insert into departures values ('60',' 29-JUL-2017', 'ELL' , 1194);
insert into departures values ('60',' 24-AUG-2017', 'ELL' , 1194);
insert into departures values ('60',' 25-SEP-2017', 'ELL' , 1194);
insert into departures values ('101',' 18-APR-2017', 'KCH' , 1253);
insert into departures values ('101',' 15-JUL-2017', 'KCH' , 1253);
insert into departures values ('101',' 29-SEP-2017', 'KCH' , 1253);
insert into departures values ('102',' 02-APR-2017', 'KCH' , 1253);
insert into departures values ('102',' 18-APR-2017', 'KCH' , 1253);
insert into departures values ('102',' 21-APR-2017', 'KCH' , 1253);
insert into departures values ('102',' 25-APR-2017', 'KCH' , 1253);
insert into departures values ('102',' 01-MAY-2017', 'KCH' , 1253);
insert into departures values ('102',' 18-MAY-2017', 'KCH' , 1253);
insert into departures values ('102',' 21-JUN-2017', 'KCH' , 1253);
insert into departures values ('102',' 24-AUG-2017', 'KCH' , 1253);
insert into departures values ('102',' 25-AUG-2017', 'KCH' , 1253);
insert into departures values ('103',' 02-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 19-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 21-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 22-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 23-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 29-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 05-MAY-2017', 'KCH' , 1253);
insert into departures values ('103',' 18-MAY-2017', 'KCH' , 1253);
insert into departures values ('103',' 21-JUN-2017', 'KCH' , 1253);
insert into departures values ('103',' 26-AUG-2017', 'KCH' , 1253);
insert into departures values ('103',' 28-AUG-2017', 'KCH' , 1253);
insert into departures values ('103',' 29-AUG-2017', 'KCH' , 1253);
insert into departures values ('104',' 13-MAY-2017', 'KCH' , 1253);
insert into departures values ('104',' 25-MAY-2017', 'KCH' , 1253);
insert into departures values ('104',' 02-JUN-2017', 'KCH' , 1253);
insert into departures values ('104',' 20-JUL-2017', 'KCH' , 1253);
insert into departures values ('104',' 23-JUL-2017', 'KCH' , 1253);
insert into departures values ('104',' 30-JUL-2017', 'KCH' , 1253);
insert into departures values ('104',' 26-SEP-2017', 'KCH' , 1253);
insert into departures values ('329',' 01-APR-2017', 'WRP' , 1026);
insert into departures values ('329',' 10-APR-2017', 'WRP' , 1026);
insert into departures values ('329',' 20-JUN-2017', 'WRP' , 1026);
insert into departures values ('329',' 23-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 24-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 25-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 27-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 28-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 22-SEP-2017', 'WRP' , 1026);
insert into departures values ('400',' 20-AUG-2017', 'SL' , 1081);
insert into departures values ('400',' 21-AUG-2017', 'SL' , 1081);
insert into departures values ('400',' 23-AUG-2017', 'SL' , 1081);
insert into departures values ('400',' 28-AUG-2017', 'SL' , 1081);
insert into departures values ('400',' 21-SEP-2017', 'SL' , 1081);
insert into departures values ('400',' 23-SEP-2017', 'SL' , 1081);
insert into departures values ('400',' 25-SEP-2017', 'SL' , 1081);
insert into departures values ('500',' 02-JUN-2017', 'RS' , 1368);
insert into departures values ('500',' 18-JUN-2017', 'RS' , 1368);
insert into departures values ('500',' 01-SEP-2017', 'RS' , 1368);
insert into departures values ('501',' 05-JUN-2017', 'RS' , 1368);
insert into departures values ('501',' 07-JUN-2017', 'RS' , 1368);
insert into departures values ('501',' 22-JUN-2017', 'RS' , 1368);
insert into departures values ('501',' 29-JUN-2017', 'RS' , 1368);
insert into departures values ('501',' 08-SEP-2017', 'RS' , 1368);
insert into departures values ('501',' 09-SEP-2017', 'RS' , 1368);
insert into departures values ('503',' 28-APR-2017', 'ELG' , 1489);
insert into departures values ('503',' 29-APR-2017', 'ELG' , 1489);
insert into departures values ('503',' 23-JUL-2017', 'ELG' , 1489);
insert into departures values ('503',' 27-JUL-2017', 'ELG' , 1489);
insert into departures values ('503',' 29-JUL-2017', 'ELG' , 1489);
insert into departures values ('503',' 30-JUL-2017', 'ELG' , 1489);
insert into departures values ('518',' 29-APR-2017', 'CG' , 1345);
insert into departures values ('518',' 30-APR-2017', 'CG' , 1345);
insert into departures values ('518',' 30-MAY-2017', 'CG' , 1345);
insert into departures values ('518',' 28-JUN-2017', 'CG' , 1345);
insert into departures values ('518',' 29-JUN-2017', 'CG' , 1345);
insert into departures values ('518',' 29-SEP-2017', 'CG' , 1345);
insert into departures values ('521',' 21-APR-2017', 'CG' , 1085);
insert into departures values ('521',' 19-JUL-2017', 'CG' , 1085);
insert into departures values ('521',' 20-JUL-2017', 'CG' , 1085);
insert into departures values ('600',' 17-APR-2017', 'WRP' , 1347);
insert into departures values ('600',' 25-APR-2017', 'WRP' , 1347);
insert into departures values ('600',' 21-JUN-2017', 'WRP' , 1347);
insert into departures values ('600',' 16-JUL-2017', 'WRP' , 1347);
insert into departures values ('600',' 26-AUG-2017', 'WRP' , 1347);
insert into departures values ('600',' 25-SEP-2017', 'WRP' , 1347);
insert into departures values ('604',' 22-APR-2017', 'CG' , 1345);
insert into departures values ('604',' 24-APR-2017', 'CG' , 1345);
insert into departures values ('604',' 30-APR-2017', 'CG' , 1345);
insert into departures values ('604',' 25-AUG-2017', 'CG' , 1345);
insert into departures values ('604',' 22-SEP-2017', 'CG' , 1345);
insert into departures values ('606',' 20-APR-2017', 'SL' , 1081);
insert into departures values ('606',' 21-APR-2017', 'SL' , 1081);
insert into departures values ('606',' 25-APR-2017', 'SL' , 1081);
insert into departures values ('606',' 27-APR-2017', 'SL' , 1081);
insert into departures values ('606',' 17-MAY-2017', 'SL' , 1081);
insert into departures values ('606',' 21-JUN-2017', 'SL' , 1081);
insert into departures values ('606',' 15-JUL-2017', 'SL' , 1081);
insert into departures values ('691',' 24-APR-2017', 'WRP' , 1347);
insert into departures values ('691',' 29-APR-2017', 'WRP' , 1347);
insert into departures values ('691',' 13-MAY-2017', 'WRP' , 1347);
insert into departures values ('691',' 19-MAY-2017', 'WRP' , 1347);
insert into departures values ('691',' 02-JUN-2017', 'WRP' , 1347);
insert into departures values ('691',' 28-JUN-2017', 'WRP' , 1347);
insert into departures values ('691',' 19-JUL-2017', 'WRP' , 1347);
insert into departures values ('691',' 20-JUL-2017', 'WRP' , 1347);
insert into departures values ('691',' 23-JUL-2017', 'WRP' , 1347);
insert into departures values ('691',' 22-SEP-2017', 'WRP' , 1347);
insert into departures values ('723',' 22-APR-2017', 'CG' , 1085);
insert into departures values ('723',' 23-APR-2017', 'CG' , 1085);
insert into departures values ('723',' 24-APR-2017', 'CG' , 1085);
insert into departures values ('723',' 25-APR-2017', 'CG' , 1085);
insert into departures values ('723',' 20-JUL-2017', 'CG' , 1085);
insert into departures values ('723',' 21-JUL-2017', 'CG' , 1085);
insert into departures values ('723',' 26-JUL-2017', 'CG' , 1085);
insert into departures values ('723',' 29-JUL-2017', 'CG' , 1085);
insert into departures values ('1260',' 18-APR-2017', 'SL' , 1081);
insert into departures values ('1260',' 19-APR-2017', 'SL' , 1081);
insert into departures values ('1260',' 22-APR-2017', 'SL' , 1081);
insert into departures values ('1260',' 29-APR-2017', 'SL' , 1081);
insert into departures values ('1260',' 27-JUN-2017', 'SL' , 1081);
insert into departures values ('1260',' 23-JUL-2017', 'SL' , 1081);
insert into departures values ('1260',' 28-AUG-2017', 'SL' , 1081);
insert into departures values ('1260',' 29-AUG-2017', 'SL' , 1081);
insert into departures values ('1260',' 01-SEP-2017', 'SL' , 1081);
insert into departures values ('1260',' 28-SEP-2017', 'SL' , 1081);
insert into departures values ('1260',' 29-SEP-2017', 'SL' , 1081);
insert into departures values ('15',' 08-APR-2017', 'WRP' , 1026);
insert into departures values ('15',' 08-JUL-2017', 'WRP' , 1026);
insert into departures values ('15',' 08-AUG-2017', 'WRP' , 1026);
insert into departures values ('15',' 08-SEP-2017', 'WRP' , 1026);
insert into departures values ('40',' 08-APR-2017', 'SL' , 1081);
insert into departures values ('40',' 08-JUL-2017', 'SL' , 1081);
insert into departures values ('40',' 08-AUG-2017', 'SL' , 1081);
insert into departures values ('40',' 08-SEP-2017', 'SL' , 1081);
insert into departures values ('59',' 08-APR-2017', 'ELL' , 1194);
insert into departures values ('59',' 08-JUL-2017', 'ELL' , 1194);
insert into departures values ('59',' 08-AUG-2017', 'ELL' , 1194);
insert into departures values ('59',' 08-SEP-2017', 'ELL' , 1194);
insert into departures values ('60',' 08-APR-2017', 'ELL' , 1194);
insert into departures values ('60',' 08-JUL-2017', 'ELL' , 1194);
insert into departures values ('60',' 08-AUG-2017', 'ELL' , 1194);
insert into departures values ('60',' 08-SEP-2017', 'ELL' , 1194);
insert into departures values ('101',' 08-APR-2017', 'KCH' , 1253);
insert into departures values ('101',' 08-JUL-2017', 'KCH' , 1253);
insert into departures values ('101',' 08-AUG-2017', 'KCH' , 1253);
insert into departures values ('101',' 08-SEP-2017', 'KCH' , 1253);
insert into departures values ('102',' 08-APR-2017', 'KCH' , 1253);
insert into departures values ('102',' 08-JUL-2017', 'KCH' , 1253);
insert into departures values ('102',' 08-AUG-2017', 'KCH' , 1253);
insert into departures values ('102',' 08-SEP-2017', 'KCH' , 1253);
insert into departures values ('103',' 08-APR-2017', 'KCH' , 1253);
insert into departures values ('103',' 08-JUL-2017', 'KCH' , 1253);
insert into departures values ('103',' 08-AUG-2017', 'KCH' , 1253);
insert into departures values ('103',' 08-SEP-2017', 'KCH' , 1253);
insert into departures values ('104',' 08-APR-2017', 'KCH' , 1253);
insert into departures values ('104',' 08-JUL-2017', 'KCH' , 1253);
insert into departures values ('104',' 08-AUG-2017', 'KCH' , 1253);
insert into departures values ('104',' 08-SEP-2017', 'KCH' , 1253);
insert into departures values ('329',' 08-APR-2017', 'WRP' , 1026);
insert into departures values ('329',' 08-JUL-2017', 'WRP' , 1026);
insert into departures values ('329',' 08-AUG-2017', 'WRP' , 1026);
insert into departures values ('329',' 08-SEP-2017', 'WRP' , 1026);
insert into departures values ('400',' 08-APR-2017', 'SL' , 1081);
insert into departures values ('400',' 08-JUL-2017', 'SL' , 1081);
insert into departures values ('400',' 08-AUG-2017', 'SL' , 1081);
insert into departures values ('400',' 08-SEP-2017', 'SL' , 1081);
insert into departures values ('500',' 08-APR-2017', 'RS' , 1368);
insert into departures values ('500',' 08-JUL-2017', 'RS' , 1368);
insert into departures values ('500',' 08-AUG-2017', 'RS' , 1368);
insert into departures values ('500',' 08-SEP-2017', 'RS' , 1368);
insert into departures values ('501',' 08-APR-2017', 'RS' , 1368);
insert into departures values ('501',' 08-JUL-2017', 'RS' , 1368);
insert into departures values ('501',' 08-AUG-2017', 'RS' , 1368);
insert into departures values ('502',' 08-APR-2017', 'ELG' , 1489);
insert into departures values ('502',' 08-JUL-2017', 'ELG' , 1489);
insert into departures values ('502',' 08-AUG-2017', 'ELG' , 1489);
insert into departures values ('502',' 08-SEP-2017', 'ELG' , 1489);
insert into departures values ('503',' 08-APR-2017', 'ELG' , 1489);
insert into departures values ('503',' 08-JUL-2017', 'ELG' , 1489);
insert into departures values ('503',' 08-AUG-2017', 'ELG' , 1489);
insert into departures values ('503',' 08-SEP-2017', 'ELG' , 1489);
insert into departures values ('518',' 08-APR-2017', 'CG' , 1345);
insert into departures values ('518',' 08-JUL-2017', 'CG' , 1345);
insert into departures values ('518',' 08-AUG-2017', 'CG' , 1345);
insert into departures values ('518',' 08-SEP-2017', 'CG' , 1345);
insert into departures values ('521',' 08-APR-2017', 'CG' , 1085);
insert into departures values ('521',' 08-JUL-2017', 'CG' , 1085);
insert into departures values ('521',' 08-AUG-2017', 'CG' , 1085);
insert into departures values ('521',' 08-SEP-2017', 'CG' , 1085);
insert into departures values ('600',' 08-APR-2017', 'WRP' , 1347);
insert into departures values ('600',' 08-JUL-2017', 'WRP' , 1347);
insert into departures values ('600',' 08-AUG-2017', 'WRP' , 1347);
insert into departures values ('600',' 08-SEP-2017', 'WRP' , 1347);
insert into departures values ('604',' 08-APR-2017', 'CG' , 1345);
insert into departures values ('604',' 08-JUL-2017', 'CG' , 1345);
insert into departures values ('604',' 08-AUG-2017', 'CG' , 1345);
insert into departures values ('604',' 08-SEP-2017', 'CG' , 1345);
insert into departures values ('606',' 08-APR-2017', 'SL' , 1081);
insert into departures values ('606',' 08-JUL-2017', 'SL' , 1081);
insert into departures values ('606',' 08-AUG-2017', 'SL' , 1081);
insert into departures values ('606',' 08-SEP-2017', 'SL' , 1081);
insert into departures values ('691',' 08-APR-2017', 'WRP' , 1347);
insert into departures values ('691',' 08-JUL-2017', 'WRP' , 1347);
insert into departures values ('691',' 08-AUG-2017', 'WRP' , 1347);
insert into departures values ('691',' 08-SEP-2017', 'WRP' , 1347);
insert into departures values ('723',' 08-APR-2017', 'CG' , 1085);
insert into departures values ('723',' 08-JUL-2017', 'CG' , 1085);
insert into departures values ('723',' 08-AUG-2017', 'CG' , 1085);
insert into departures values ('723',' 08-SEP-2017', 'CG' , 1085);
--insert into departures values ('724',' 08-APR-2017', 'CG' , 1085);
--insert into departures values ('724',' 08-JUL-2017', 'CG' , 1085);
--insert into departures values ('724',' 08-AUG-2017', 'CG' , 1085);
--insert into departures values ('724',' 08-SEP-2017', 'CG' , 1085);
insert into departures values ('1260',' 08-APR-2017', 'SL' , 1081);
insert into departures values ('1260',' 08-JUL-2017', 'SL' , 1081);
insert into departures values ('1260',' 08-AUG-2017', 'SL' , 1081);
insert into departures values ('1260',' 08-SEP-2017', 'SL' , 1081);

CREATE TABLE RESERVATION (RES_CONFIRM_NO NUMBER constraint reservation_confirmNo_pk primary Key, 
RES_DATE DATE, RES_NAME VARCHAR2(20),
RES_PHONE VARCHAR2(10), RES_FLIGHT_NO NUMBER, RES_FLIGHT_DATE DATE, 
foreign key (Res_flight_no,res_flight_date) references departures(DEP_flight_no,DEP_dep_date));

insert into reservation values  ('1' , '01-APR-2017' , 'Ole Olson' , '2186942221' , '15' , '01-APR-2017');
insert into reservation values  ('2' , '01-APR-2017' , 'Pete Peterson' , '2186943000' , '101' , '15-JUL-2017');
insert into reservation values  ('3' , '01-APR-2017' , 'Swen Swenson' , '2186948822' , '101' , '18-APR-2017');
insert into reservation values  ('4' , '11-APR-2017' , 'Andy Anderson' , '6025233510' , '606' , '21-APR-2017');
insert into reservation values  ('5' , '17-APR-2017' , 'Torgie Torgenson' , '2082223333' , '606' , '17-MAY-2017');
insert into reservation values  ('6' , '17-APR-2017' , 'Andy Anderson' , '6025233510' , '102' , '18-APR-2017');

CREATE TABLE PASSENGER (PAS_NAME VARCHAR2(20), PAS_ITINERARY_NO NUMBER 
constraint Passenger_ITNo_pk primary key, PAS_FARE NUMBER, PAS_CONFIRM_NO NUMBER
constraint passenger_confirmNo_fk references reservation(RES_confirm_no));

insert into passenger values('Ole Olson', 1, 410 , 1);
insert into passenger values('Lena Olson', 2, 98 , 1);
insert into passenger values('Pete Peterson', 3, 315 , 2);
insert into passenger values('Hazel Peterson', 4, 315 , 2);
insert into passenger values('David Peterson', 5, 315 , 2);
insert into passenger values('Swen Swenson', 6, 345 , 3);
insert into passenger values('Olga Swenson', 7, 315 , 3);
insert into passenger values('Pete Swenson', 8, 409 , 3);
insert into passenger values('Andy Anderson', 9, 436 , 4);
insert into passenger values('Gloria Anderson', 10, 436 , 4);
insert into passenger values('Torgie Torgenson', 11, 578.5 , 5);
insert into passenger values('Andy Anderson', 12, 560 , 6);
insert into passenger values('Gloria Anderson', 13, 312 , 6);

CREATE TABLE TICKET (TIC_ITINERARY_NO NUMBER constraint ticket_ITNo_Passenger_ITNo_fk 
references passenger(PAS_itinerary_no), TIC_FLIGHT_NO NUMBER, TIC_FLIGHT_DATE DATE,
foreign key (TIC_flight_no, TIC_flight_date) references departures(DEP_flight_no,
DEP_Dep_date),
TIC_SEAT VARCHAR2(3), constraint ticket_ITNo_FlightNo_PK primary Key 
(TIC_itinerary_no, TIC_flight_no, TIC_flight_date));

insert into ticket values (1, 15, '01-APR-2017','10D');
insert into ticket values (1, 329,'01-APR-2017','12D');
insert into ticket values (2, 15, '01-APR-2017', '10E');
insert into ticket values (2, 329, '10-APR-2017', '12E');
insert into ticket values (3, 101, '15-JUL-2017', '3D');
insert into ticket values (3, 104, '23-JUL-2017', '4D');
insert into ticket values (4, 101, '15-JUL-2017', '3C');
insert into ticket values (4, 104, '23-JUL-2017', '4C');
insert into ticket values (5, 101, '15-JUL-2017', '3B');
insert into ticket values (5, 104, '20-JUL-2017', '4B');
insert into ticket values (6, 101, '18-APR-2017', '10A');
insert into ticket values (6, 104, '23-JUL-2017', '8B');
insert into ticket values (7, 101, '18-APR-2017', '10B');
insert into ticket values (7, 104, '30-JUL-2017', '8C');
insert into ticket values (8, 101, '18-APR-2017', '10C');
insert into ticket values (8, 104, '23-JUL-2017', '8D');
insert into ticket values (9, 606, '27-APR-2017', '12B');
insert into ticket values (9, 691, '08-JUL-2017', '12A');
insert into ticket values (10, 606, '20-APR-2017', '12C');
insert into ticket values (11, 606, '17-MAY-2017', '12B');
insert into ticket values (11, 691, '19-MAY-2017', '13B');
insert into ticket values (12, 102, '18-APR-2017', '10B');
insert into ticket values (12, 103, '19-APR-2017', '7B');
insert into ticket values (13, 102, '18-APR-2017', '7C');
insert into ticket values (13, 103, '23-APR-2017', '3C');

--1
select * from passenger
order by pas_name, pas_fare;

--2
select pil_pilotname, pil_state, pil_city, pil_zip, pil_flight_pay
from pilots
where pil_flight_pay > 2500 and (pil_city = 'HOUSTON' or pil_city = 'PHOENIX');

--3
select pil_pilotname, pil_state, pil_city, pil_zip, pil_flight_pay
from pilots
where pil_flight_pay > 2500 and pil_city in ('HOUSTON','PHOENIX');

--4
select * from equip_type
where eq_seat_capacity<280 or(eq_miles_per_gal>4 and eq_fuel_capacity<2000);

--5
select * from airport
where air_location like '%Los Angeles%';

--6
select dep_pilot_id from departures
having count(dep_flight_no)>20
group by dep_pilot_id
order by dep_pilot_id asc;

--7
SELECT FL_FLIGHT_NO AS "Flight Number", FL_FARE AS "Fare", FL_DISTANCE AS "Distance", round(fl_distance/fl_fare, 2) AS "Miles Flown Per Dollar"
from flight
where (fl_distance/fl_fare)> 5.5
order by "Miles Flown Per Dollar";

--8
select airport.air_location, count(flight.fl_flight_no) AS "Number Of Departing Flights" from airport join flight on flight.fl_orig=airport.air_code
group by airport.air_location;

--9
select pil_state AS "State", max(pil_flight_pay) AS "Max Pay" ,min(pil_flight_pay) AS "Min Pay",avg(pil_flight_pay) AS "Avg Pay" from pilots group by pil_state;

--10
select pilots.pil_pilotname, min(departures.dep_dep_date) AS "First Departure" from pilots join departures on pilots.pil_pilot_id=departures.dep_pilot_id
group by pilots.pil_pilotname
order by pilots.pil_pilotname;

--11
select eq_equip_type, max(eq_fuel_capacity * eq_miles_per_gal) AS "Maximum Distance Flown"
from equip_type
group by eq_equip_type;


--12
select fl_orig, count(fl_flight_no) AS "NUMBER_OF_FLIGHTS" from flight group by fl_orig;
