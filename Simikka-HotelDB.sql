/*Simikka*/

DROP DATABASE IF EXISTS SIMIKKA_HotelDB;
CREATE DATABASE SIMIKKA_HotelDB;
USE SIMIKKA_HotelDB;

CREATE TABLE room_types (
room_type VARCHAR(20) NOT NULL,
standard_occupancy INT NOT NULL,
maximum_occupancy INT NOT NULL,
base_price DECIMAL(6,2) NOT NULL,
price_per_additional_adult DECIMAL(5,2),
PRIMARY KEY (room_type) 
);

CREATE TABLE amenity_packages (
amenity_package_number INT NOT NULL,
microwave_available BOOLEAN NOT NULL,
jacuzzi_available BOOLEAN NOT NULL,
refrigerator_available BOOLEAN NOT NULL,
oven_available BOOLEAN NOT NULL,
additional_price DECIMAL(5,2) NOT NULL,
PRIMARY KEY (amenity_package_number)
);

CREATE TABLE guests (
guest_number INT NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) NOT NULL,
zip int NOT NULL,
phone VARCHAR(10) NOT NULL,
PRIMARY KEY (guest_number),
CONSTRAINT zip_value CHECK (zip<100000)
);

CREATE TABLE rooms (
room_number INT NOT NULL, 
room_type VARCHAR(20) NOT NULL,
amenity_package_number INT NOT NULL,
ada_accessible BOOLEAN NOT NULL,
PRIMARY KEY (room_number),
FOREIGN KEY (room_type) REFERENCES room_types(room_type) ,
FOREIGN KEY (amenity_package_number) REFERENCES amenity_packages(amenity_package_number)
);

CREATE TABLE reservations (
reservation_number INT NOT NULL,
guest_number INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
PRIMARY KEY (reservation_number),
FOREIGN KEY (guest_number) REFERENCES  guests (guest_number) ON DELETE CASCADE
);

CREATE TABLE room_occupancy (
reservation_number INT NOT NULL,
room_number INT NOT NULL,
number_of_adults INT NOT NULL,
number_of_children INT NOT NULL,
total_room_cost decimal(10,2) NOT NULL,
PRIMARY KEY (reservation_number, room_number),
FOREIGN KEY (reservation_number) REFERENCES reservations (reservation_number) ON DELETE CASCADE,
FOREIGN KEY (room_number) REFERENCES rooms (room_number)
);
