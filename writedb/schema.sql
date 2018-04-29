CREATE TABLE characters (
    ID int GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT by 1),
    Name varchar(32) NOT NULL,
    Email varchar(64) NOT NULL,
    Password varchar(256) NOT NULL, 
    Age int NOT NULL,
    Bio varchar(512) NOT NULL,
    Portrait varchar(256) NOT NULL
);

INSERT INTO characters (Name, Email, Password, Age, Bio, Portrait) 
    VALUES ('Randi', 'Randi@gmail.com', 'randi_pw', 16, 'The hero. Randi is a young boy who possesses immense courage. Upon hearing a mysterious voice he discovers the Mana Sword. Armed with the power of the Mana Sword, he sets forth on this quest to learn how to harness Mana', 'https://www.secretofmanagame.com/img/character_randi.png'),
           ('Primm', 'Primm@gmail.com', 'primm_pw', 17, 'A young noblewoman from the Kingdom of Pandora. She rebels against her father’s plans to arrange her marriage. After saving Randi from an ambush, she accompanies him on his journey to restore the power of Mana. Primm is also on her own quest to save Dyluck.', 'https://www.secretofmanagame.com/img/character_primm.png'),
           ('Popoi', 'Popoi@gmail.com', 'popoi_pw', 514, 'A mischievous and caring sprite. Popoi suffers from amnesia, but joins Randi and Primm on their quest in the hope of restoring their lost memories.', 'https://www.secretofmanagame.com/img/character_popoi.png');