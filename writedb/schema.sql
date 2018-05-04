DROP TABLE users;

CREATE TABLE users (
    ID int GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    FirstName varchar(32) NOT NULL,
    LastName varchar(32) NOT NULL,
    Email varchar(64) NOT NULL UNIQUE,
    Password varchar(256) NOT NULL
);

INSERT INTO users (FirstName, LastName, Email, Password) 
VALUES ('Ryu', 'Hayabusa', 'ryu@gmail.com', 'pw1'),
       ('Ken', 'Masters', 'ken@yahoo.com', 'pw2'),
       ('Chun', 'Li', 'chun@aol.com', 'pw3');
