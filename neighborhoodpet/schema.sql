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
       ('Anthony', 'Elkes', '9351 Copper Creek', 'Austin', 'TX', 78757, 'anthony@email.com', 'anthony'),
       ('Claire', 'Redfield', '15378 Camino Ruiz', 'Austin', 'TX', 78758, 'claire@email.com', 'claire'),
       ('Brittany', 'Vu', '6620 Willsburough Dr', 'Austin', 'TX', 78756, 'brittany@email.com', 'brittany'),
       ('Eric', 'Dunbar', '12843 Shadywood Blvd', 'Austin', 'TX', 78757, 'eric@email.com', 'eric'),
       ('Kristy', 'Haskins', '5551 Foals Rd', 'Austin', 'TX', 78758, 'kristy@email.com', 'kristy'),
       ('Phoebe', 'Roberts', '14385 Saluda Ave', 'Austin', 'TX', 78757, 'phoebe@email.com', 'phoebe'),
       ('Jose', 'Torres', '15868 Saluda Ave', 'Austin', 'TX', 78756, 'jose@email.com', 'jose');

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
VALUES ('Pancake', 'Labrador', 'Male', 2, 'Small', 'Yellow', false, 1, 'Pancake loves getting pats from strangers. Don''t be shy when you see us walking about the neighborhood!'),
       ('Tarzan', 'Pomeranian', 'Male', 5, 'Small', 'White', false, 2, 'Don''t let his fluffy appearance fool you. Tarzan is ferocious and will bark nonstop until you''re out of his sight. Advice is welcomed.'),
       ('Whiskers', 'Tabby Cat', 'Female', 6, 'Small', 'Orange', false, 3, 'Whiskers often roams the neighborhood. Maybe he''s out looking for birds or mouses. Don''t worry though as he''s not lost. Thanks'),
       ('Daisy', 'Terrier-Mix', 'Female', 10, 'Medium', 'Cream', false, 4, 'Daisy is the light of my life. I can''t imagine life without her.'),
       ('Oreo', 'American Shorthair', 'Male', 4, 'Small', 'Gray with Black Stripes', false, 5, 'This guy just lounges wherever he goes. He''s the laziest cat I know.'),
       ('Oscar', 'Box Turtle', 'Female', 5, 'Small', 'Brownish Green', true, 6, 'Oscar somehow escapes the backyard from time to time. Please contact me if you see a turtle on the loose.'),
       ('Felicia', 'Scottish Fold', 'Female', 3, 'Small', 'Orange with Stripes', false, 7, 'Felicia is strictly an indoor house cat so chances are slim she''d ever be seen outside.'),
       ('Rufus', 'French Bulldog', 'Male', 7, 'Medium', 'Dark Gray', true, 8, 'Rufus is lost! Please contact me as soon as you see him! Reward offered.');

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