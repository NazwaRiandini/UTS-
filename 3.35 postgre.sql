CREATE TABLE Airport (
    Airport_code VARCHAR(10) PRIMARY KEY,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Airplane_Type (
    Type_name VARCHAR(50) PRIMARY KEY,
    Company VARCHAR(50) NOT NULL,
    Max_seats INT NOT NULL
);

CREATE TABLE Airplane (
    Airplane_id INT PRIMARY KEY,
    Total_no_of_seats INT NOT NULL,
    Type_name VARCHAR(50) REFERENCES Airplane_Type(Type_name)
);

CREATE TABLE Flight (
    Flight_number VARCHAR(20) PRIMARY KEY,
    Airline VARCHAR(50) NOT NULL,
    Weekdays VARCHAR(20) NOT NULL
);

CREATE TABLE Flight_Leg (
    Flight_number VARCHAR(20) REFERENCES Flight(Flight_number),
    Leg_no INT,
    Departure_airport_code VARCHAR(10) REFERENCES Airport(Airport_code),
    Scheduled_dep_time TIME NOT NULL,
    Arrival_airport_code VARCHAR(10) REFERENCES Airport(Airport_code),
    Scheduled_arr_time TIME NOT NULL,
    PRIMARY KEY (Flight_number, Leg_no)
);

CREATE TABLE Leg_Instance (
    Flight_number VARCHAR(20),
    Leg_no INT,
    Date DATE,
    No_of_avail_seats INT NOT NULL,
    Airplane_id INT REFERENCES Airplane(Airplane_id),
    Departure_airport_code VARCHAR(10) REFERENCES Airport(Airport_code),
    Dep_time TIME,
    Arrival_airport_code VARCHAR(10) REFERENCES Airport(Airport_code),
    Arr_time TIME,
    FOREIGN KEY (Flight_number, Leg_no) REFERENCES Flight_Leg(Flight_number, Leg_no),
    PRIMARY KEY (Flight_number, Leg_no, Date)
);

CREATE TABLE Seat (
    Airplane_id INT REFERENCES Airplane(Airplane_id),
    Seat_no VARCHAR(10),
    Type VARCHAR(20),
    PRIMARY KEY (Airplane_id, Seat_no)
);