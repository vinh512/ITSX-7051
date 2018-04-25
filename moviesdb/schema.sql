CREATE TABLE movies (
    ID int GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    Title varchar(100) NOT NULL,
    ReleaseYear int NOT NULL,
    Rating varchar(5) NOT NULL,
    RunTime varchar(10) NOT NULL,
    Genre varchar(25) NOT NULL,
    ReleaseDate varchar(15),
    Director varchar(50) NOT NULL,
    Cover varchar(255),
    Synopsis varchar(1000),
    primary key (id)
);

INSERT INTO movies (Title, ReleaseYear, Rating, RunTime, Genre, ReleaseDate, Director, Cover, Synopsis)
    VALUES ('Lion King', 1994, '8.5', '1h 28min', 'Drama', '24 June 1994', 'Roger Allers', 'https://ia.media-imdb.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_SY1000_CR0,0,673,1000_AL_.jpg', 'A Lion cub crown prince is tricked by a treacherous uncle into thinking he caused his father''s death and flees into exile in despair, only to learn in adulthood his identity and his responsibilities.'),
           ('Aladdin', 1992, '8.0', '1h 30min', 'Adventure', '25 Nov 1992', 'Ron Clements', 'https://ia.media-imdb.com/images/M/MV5BY2Q2NDI1MjUtM2Q5ZS00MTFlLWJiYWEtNTZmNjQ3OGJkZDgxXkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_.jpg', 'When a street urchin vies for the love of a beautiful princess, he uses a genie''s magic power to make himself off as a prince in order to marry her.'),
           ('The Little Mermaid', 1989, '7.6', '1h 23min', 'Fantasy', '14 Nov 1989', 'Ron Clements', 'https://ia.media-imdb.com/images/M/MV5BN2JlZTBhYTEtZDE3OC00NTA3LTk5NTQtNjg5M2RjODllM2M0XkEyXkFqcGdeQXVyNjk1Njg5NTA@._V1_SY1000_CR0,0,675,1000_AL_.jpg', 'A mermaid princess makes a Faustian bargain with an unscrupulous sea-witch in order to meet a human prince on land.'),
           ('Beauty and the Beast', 1991, '8.0', '1h 24min', 'Fantasy', '22 Nov 1991', 'Gary Trousdale', 'https://ia.media-imdb.com/images/M/MV5BMzE5MDM1NDktY2I0OC00YWI5LTk2NzUtYjczNDczOWQxYjM0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_SX674_AL_.jpg', 'A young woman whose father has been imprisoned by a terrifying beast offers herself in his place, unaware that her captor is actually a prince, physically altered by a magic spell.'),
           ('Mulan', 1998, '7.6', '1h 28min', 'Drama', '19 June 1998', 'Tony Bancroft', 'https://ia.media-imdb.com/images/M/MV5BODkxNGQ1NWYtNzg0Ny00Yjg3LThmZTItMjE2YjhmZTQ0ODY5XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,673,1000_AL_.jpg', 'To save her father from death in the army, a young maiden secretly goes in his place and becomes one of China''s greatest heroines in the process.');