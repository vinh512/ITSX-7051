CREATE TABLE users (
    UserID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,
    Address VARCHAR(256) NOT NULL,
    City VARCHAR(32) NOT NULL,
    State VARCHAR(32) NOT NULL,
    ZipCode INTEGER, 
    Email VARCHAR(64) NOT NULL UNIQUE,
    Password VARCHAR(256) NOT NULL,
    PRIMARY KEY (UserID)
);

INSERT INTO users (FirstName, LastName, Address, City, State, ZipCode, Email, Password)
VALUES ('Margie', 'Baker', '14225 Saluda Ave', 'Austin', 'TX', 78758, 'margie@email.com', 'margie'),
       ('Anthony', 'Elkes', '9351 Copper Creek', 'Austin', 'TX', 78727, 'anthony@email.com', 'anthony'),
       ('Claire', 'Redfield', '15378 Camino Ruiz', 'Austin', 'TX', 78728, 'claire@email.com', 'claire'),
       ('Brittany', 'Vu', '6620 Willsburough Dr', 'Austin', 'TX', 78756, 'brittany@email.com', 'brittany'),
       ('Eric', 'Dunbar', '12843 Shadywood Blvd', 'Austin', 'TX', 78757, 'eric@email.com', 'eric'),
       ('Kristy', 'Haskins', '5551 Foals Rd', 'Austin', 'TX', 78728, 'kristy@email.com', 'kristy'),
       ('Phoebe', 'Roberts', '14385 Saluda Ave', 'Austin', 'TX', 78758, 'phoebe@email.com', 'phoebe'),
       ('Jose', 'Torres', '15868 Saluda Ave', 'Austin', 'TX', 78758, 'jose@email.com', 'jose');

DROP TABLE users;

------------------------------------------------------------------------------------------------------

CREATE TABLE pets (
    PetID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    PetName VARCHAR(32) NOT NULL,
    Breed VARCHAR(32) NOT NULL,
    Gender VARCHAR(8) NOT NULL,
    Age INTEGER NOT NULL,
    Size VARCHAR(32) NOT NULL, 
    Color VARCHAR(64) NOT NULL, 
    IsMissing BOOLEAN,
    OwnerID INTEGER NOT NULL, 
    Bio VARCHAR(1024),
    PRIMARY KEY (PetID),   
    FOREIGN KEY (OwnerID) REFERENCES USERS (UserID)
);

INSERT INTO pets (PetName, Breed, Gender, Age, Size, Color, IsMissing, OwnerID, Bio)
VALUES ('Fluggie', 'Pug', 'Male', 2, 'small', 'tan', false, 1, 'This pug is an aggressive adventurer'),
       ('Tarzan', 'Husky', 'Male', 15, 'large', 'black & white', false, 2, 'Tarzan loves the cold'),
       ('Whiskers', 'Rat', 'Female', 1, 'small', 'white', false, 3, 'Rat Bio'),
       ('Felicia', 'Tabby Cat', 'Female', 4, 'small', 'orange', true, 4, 'Felicia Bio'),
       ('Oreo', 'Pomeranian', 'Male', 10, 'small', 'white with black pattern', true, 5, 'Oreo Bio'),
       ('Princess', 'Corgi', 'Female', 7, 'medium', 'brown with white', false, 6, 'Princess Bio'),
       ('Hank', 'Golden Lab', 'Male', 2, 'large', 'golden tan', true, 7, 'Hank Bio'),
       ('Rufus', 'Siamese', 'Male', 6, 'small', 'gray', false, 8, 'Rufus Bio');

DROP TABLE pets;

------------------------------------------------------------------------------------------------------

CREATE TABLE images (
  ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  filename VARCHAR(128) NOT NULL,
  content_type VARCHAR(128) NOT NULL,
  ownerID INTEGER NOT NULL,
  content blob,
  FOREIGN KEY (ownerID) REFERENCES USERS (UserID)
);

DROP TABLE images;