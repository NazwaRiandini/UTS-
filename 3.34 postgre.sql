CREATE TABLE Author (
    Email VARCHAR(50) PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL
);

CREATE TABLE Paper (
    PaperID VARCHAR(50) PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Abstract TEXT,
    FileName VARCHAR(100) NOT NULL
);

CREATE TABLE Author_Paper (
    Author_Email VARCHAR(50) REFERENCES Author(Email),
    PaperID VARCHAR(50) REFERENCES Paper(PaperID),
    Is_Contact_Author BOOLEAN,
    PRIMARY KEY (Author_Email, PaperID)
);

CREATE TABLE Reviewer (
    Email VARCHAR(50) PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    Affiliation VARCHAR(100)
);

CREATE TABLE Review (
    Reviewer_Email VARCHAR(50) REFERENCES Reviewer(Email),
    PaperID VARCHAR(50) REFERENCES Paper(PaperID),
    Tech_merit INT,
    Readability INT,
    Originality INT,
    Relevance INT,
    Overall_rec VARCHAR(20),
    Comm_Committee TEXT,
    Comm_Author TEXT,
    PRIMARY KEY (Reviewer_Email, PaperID)
);