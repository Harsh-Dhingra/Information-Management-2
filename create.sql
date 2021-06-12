CREATE TABLE cabs
(
cab_no number(15) NOT NULL,
driver_name varchar(20) NOT NULL,
fare_per_km number(4) NOT NULL,
no_of_passangers number(5) NOT NULL,
PRIMARY KEY (cab_no)
);
CREATE TABLE Hotel1
(
hotel_no number(20) NOT NULL,
hotel_name varchar(20) NOT NULL,
available_rooms number(3) NOT NULL,
booked_rooms number(3) NOT NULL,
price number(10) NOT NULL,
PRIMARY KEY (hotel_no),
);
create table Payment(
order_id number(10) NOT NULL,
Amount Number(10) NOT NULL,
Cust_id number(10) NOT NULL,
PRIMARY KEY (order_id, cust_id),
FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);  
create table To(
username varchar(10) NOT NULL,
cust_id number(10) NOT NULL,
PRIMARY KEY (username, cust_id),
FOREIGN KEY (username) REFERENCES Admin(username),
FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);
CREATE TABLE location
(
sno number(2);
loc_id number(4) NOT NULL,
name varchar(20) NOT NULL,
PRIMARY KEY (sno),
);
CREATE TABLE packages
(
pack_code number(4) ,
package_details varchar(500) NOT NULL,
price number(10) NOT NULL,
package_type varchar(50) NOT NULL
);
CREATE TABLE customer
(
First_name varchar(10) NOT NULL,
Last_name varchar(10) NOT NULL,
age number(3) NOT NULL,
sex varchar(8) NOT NULL,
email_id varchar(20) NOT NULL,
phone_no number(10) NOT NULL,
cust_id number(10) NOT NULL,
house_no number(3) NOT NULL,
street varchar(20) NOT NULL,
city varchar(15) NOT NULL,
state varchar(15) NOT NULL,
pin_code number(8) NOT NULL,
no_of_people_travelling number(10) ,
PRIMARY KEY (email_id));
create table Admin (
Username varchar (50),
Name varchar (20),
Primary key (Username));
