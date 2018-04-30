CREATE TABLE users (
    ID int GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    FirstName varchar(32) NOT NULL,
    LastName varchar(32) NOT NULL,
    Email varchar(64) NOT NULL,
    Password varchar(256) NOT NULL
);
