--AB loomine
Create database JevgrafovaBaas;

use JevgrafovaBaas;
CREATE TABLE opilane(
opilaneId int primary key identity (1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane;
eesnimi,
perenimi, 
synniaeg, 
stip, 
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2000-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2000-12-12',
1,
4.5)

--tabeli kustutamine
drop table opilane;
--rida kastutamine, kus on opilaneId=2
DELETE FROM opilane WHERE opilaneId=2;
select * from opilane;

--andmete uuendamine
UPDATE opilane

------------------------------------------------------------------------------------
vigane kood
--AB loomine
Create database JevgrafovaBaas;
use JevgrafovaBaas;
CREATE TABLE opilane(
opilaneId int primary key identity (1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane;
eesnimi,
perenimi, 
synniaeg, 
stip, 
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2000-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2000-12-12',
1,
4.5)

--tabeli kustutamine
drop table opilane;
--rida kastutamine, kus on opilaneId=2
DELETE FROM opilane WHERE opilaneId=2;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
WHERE opilaneId=3

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY;
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bool,
Percentage single
);
Select * from language

INSERT INTO Language(ID, Code, Language)
VALUES (1, 'EST', 'eesti'), (3, 'ENG', 'inglise'),
(4, 'DE', 'saksa')

Create table keelevalik(
keelevalikId int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int, 
Foreign key (opilaneId) references opilane(opilaneId),
Language int,
Foreign key (Language) references Language(ID)
)
select * from keelevalik;
select * from Language;
select * from opilane;

INSERT INTO keelevalik(valikuNimetus, opilaneId,Language)
Values ('valik B', 3, 4)
'Nikita'

SELECT opilane.eesnimi, Language.Language
FROM opilane, Language, keelevalik
WHERE opilane.opilaneId=keelevalik.opilaneId
AND Language.ID=keelevalik
