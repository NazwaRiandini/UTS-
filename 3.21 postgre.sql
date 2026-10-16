CREATE TABLE STATE (
    Name VARCHAR(50) PRIMARY KEY,
    Region VARCHAR(50)
);

CREATE TABLE CONGRESS_PERSON (
    Name VARCHAR(50) PRIMARY KEY,
    District VARCHAR(50) NOT NULL,
    Start_date DATE,
    Party VARCHAR(50)
);

CREATE TABLE BILL (
    Bill_name VARCHAR(50) PRIMARY KEY,
    Date_of_vote DATE,
    Passed_or_failed VARCHAR(10)
);

CREATE TABLE Sponsor (
    Congress_person_Name VARCHAR(50) REFERENCES CONGRESS_PERSON(Name),
    Bill_name VARCHAR(50) REFERENCES BILL(Bill_name),
    PRIMARY KEY (Congress_person_Name, Bill_name)
);

CREATE TABLE Vote (
    Congress_person_Name VARCHAR(50) REFERENCES CONGRESS_PERSON(Name),
    Bill_name VARCHAR(50) REFERENCES BILL(Bill_name),
    Vote_result VARCHAR(10),
    PRIMARY KEY (Congress_person_Name, Bill_name)
);