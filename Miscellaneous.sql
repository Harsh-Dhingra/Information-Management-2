create or replace procedure new_user
IS
First_name varchar(10) ;
Last_name varchar(10) ;
age number(3) ;
sex varchar(8) ;
email_id varchar(50) ;
phone_no number(10);
cust_id number(10) ;
house_no number(3) ;
street varchar(20) ;
city varchar(15) ;
state varchar(15) ;
pin_code number(8) ;
no_of_people_travelling number(10) ;
BEGIN
insert into Customer values( '&First_name ', '&Last_name',&age,'&sex', '&email_id', &phone_no ,
&cust_id , &house_no, '&street', '&city', '&state' ,&pin_code, &no_of_people_travelling )
COMMIT:
END;
/



set serveroutput on;
CREATE OR REPLACE Procedure hotel_booking(hid in number , npeople in number)
IS
nrooms number;
arooms number;
cost number(8);
crooms number;
brooms number;
drooms number;
price number;
begin
nrooms := npeople/3;
SELECT available_rooms,price,booked_rooms INTO arooms,price,brooms FROM hotel1 WHERE
hotel_no = hid;
if (nrooms <= arooms)
THEN
crooms := arooms-nrooms;
SELECT price,booked_rooms INTO price,brooms FROM hotel1 WHERE
hotel_no = hid;
drooms := brooms + nrooms;
dbms_output.put_line( nrooms || ' rooms have been allotted to you' );
UPDATE hotel1 SET available_rooms = crooms,booked_rooms = drooms WHERE hotel_no = hid;
cost := nrooms * price ;
dbms_output.put_line('total expense of the hotel is: ' || cost);
else
dbms_output.put_line('rooms have not been allotted');
END IF;
End;
/
declare
npeople number;
hid number;
Begin
hid := &enter_hotel_no;
npeople := &no_of_people_accompanying;
hotel_booking(hid,npeople);
END;
/


set serveroutput on;
create or replace procedure package_booking(pcode in number)
IS
p number;
cursor c2 is select pack_code,package_type,package_details from packages where pack_code=pcode;
cost number(10);
begin
select price into p from packages where pack_code=pcode;
dbms_output.put_line('you have selected: ');
for rec in c2 loop
dbms_output.put_line(rec.pack_code||' '||rec.package_type||' '||rec.package_details);
end loop;
cost:= p+0.18*p;
dbms_output.put_line('total cost of the package includding GST is :' || cost);
end;
/
DECLARE
cursor c1 is select pack_code,package_type,package_details from packages;
BEGIN
dbms_output.put_line('different packages available are:');
for rec in c1 loop
dbms_output.put_line(rec.pack_code||' '||rec.package_type||' '||rec.package_details);
end loop;
end;
/
declare
pcode number;
begin
pcode:=&enter_the_pack_code;
PACKAGE_BOOKING(PCODE) ;
END;
/ 


set serveroutput on;
create or replace procedure tourist_attraction(lid in number)
IS
cursor c2 is select places_to_visit from location_places_to_visit where loc_id=lid;
begin
dbms_output.put_line('famous tourist attractions are');
for rec in c2 loop
dbms_output.put_line(rec.places_to_visit);
end loop;
end;
/
declare
cursor c1 is select distinct loc_id,name from location;
begin
dbms_output.put_line('enter the location id where you want to see the tourist attraction spots');
for rec in c1 loop
dbms_output.put_line(rec.loc_id||' '||rec.name);
end loop;
end;
/
declare
lid location.loc_id%type;
begin
lid:= &enter_loc_id;
tourist_attraction(lid);
end;
/

CREATE OR REPLACE TRIGGER PRIMARY_KEY
BEFORE INSERT ON packages
FOR EACH ROW
DECLARE
E packages.pack_code%TYPE;
BEGIN
IF (:NEW.pack_code IS NULL) THEN
RAISE_APPLICATION_ERROR(-20099, 'trigger generated error PRIMARY KEY VIOLATION
BECAUSE IT CANNOT BE NULL');
END IF;
SELECT pack_code INTO E FROM payment WHERE pack_code=:NEW.pack_code;
RAISE_APPLICATION_ERROR(-20003, 'trigger generated error PRIMARY KEY VIOLATION
BECAUSE IT SHOULD BE UNIQUE');
EXCEPTION
WHEN NO_DATA_FOUND THEN
NULL;
END;
/ 

CREATE OR REPLACE TRIGGER PHONE_CHECK
BEFORE INSERT OR UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
IF LENGTH(:NEW.PHONE_NO) NOT LIKE 10 THEN
RAISE_APPLICATION_ERROR(-20000,'TRIGGER GENERATED ERROR PHONE NO CANNOT
HAVE OTHER THEN 10 DIGITS');
END IF;
END;
/

