(localdb)\mssqllocaldb
--SQL salvestatud protseduur - funktsioon,
Create database protseduurTARpv24;

use protseduurTARpv24;
Create table linn(
  linnId int Ptimary Key identity(1,1),
  linnNimi varchar(30),
  rahvaArv int);
--
Select * from linn;
Insert into linn(linnNimi, rahvaArv)
Values ('Tallinn', 60000), ('Tartu', 40000), ('Narva', 20000)
--Protseduuri loomine
--protseduur, mis lisab uus linn ja kihe näitab tabelis

CREATE PROCEDURE lisaLinn
@lnimi varchar(30),
@rArv int
AS
BEGIN
Insert into linn(linnNimi, rahvaArv)
Values (@lnimi, @rArv);
SELECT * FROM linn;

END;

--protseduuri kutse 
EXEC lisaLinn @lnimi='Tartu', @rArv=1256
--lihtsam
EXEC lisaLinn 'Pärnu', 1256
--kirje kustutamine
DELETE FROM linn WHERE linnID=3;
SELECT * FROM linn;
--protseduur, mis kustutab linn id järgi
CREATE PROCEDURE kustutaLinn
@deleteID int
AS
BEGIN
SELECT * FROM linn;
DELETE FROM linn WHERE linnID=deleteID;
SELECT * FROM linn;
END;

--kutse
EXEC kustutaLinn 4;
--proceduri kustutamine
DROP Procedure kustutaLinn;


--Protseduur, mis otsib linn esimese tähte järgi
CREATE PROCEDURE lnnaOtsing
@taht char(1)
AS
BEGIN
SELECT * from linn
WHERE linnNimi LIKE @taht + '%';
--% - kõik teised tähed
END;
--kutse
EXEC linnaOtsing T;
----------------------------------------------------------------
use protseduurTARpv24;
CREATE TABLE linn (...
SELECT * FROM linn;
-- uue veeru lisamine
ALTER TABLE linn ADD test int;
-- veeru kustutamine
ALTER TABLE linn DROP COLUMN test;

CREATE PROCEDURE veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20) =null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE linn ADD ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE linn DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
BEGIN
EXEC (@sqltegevus);
END
END;


--kutse
EXEC veeruLisaKustuta @valik='add', @veerunimi='test3', @tyyp='int';
SELECT * FROM linn;

EXEC veeruLisaKustuta @valik='drop', @veerunimi='test3';
SELECT * FROM linn;

CREATE PROCEDURE veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20) =null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE  ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
BEGIN
EXEC (@sqltegevus);
END
END;
--kutse
EXEC veeruLisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi='test3', @tyyp='int';
SELECT * FROM linn;

EXEC veeruLisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi='test3';
SELECT * FROM linn;

--protseduur tingimusega
create procedure rahvaHinnang
@piir int

AS
BEGIN
SELECT linnNimi, rahvaArv, IIF(rahvaArv<@piir, 'väike linn', 'suur linn') as Hinnang
FROM linn;


END;

DROP procedure rahvaHinnang;

EXEC rahvaHinnang 2000;
--Agregaat funktsioonid: SUM(), AVG(), MIN(), MAX(), COUNT()

CREATE PROCEDURE kokkuRahvaarv

AS
BEGIN
SELECT SUM(rahvaArv) AS 'kokku rahvaArv', AVG(rahvaArv) AS 'keskmine rahvaArv', count(*) AS 'linnade arv'
FROM linn;
END;

EXEC kokkuRahvaarv;
----------------------------------------------------------------
Protseduur viga
use protseduurTARpv24
CREATE TABLE moobel (
SELECT * FROM moobel
ALTER TABLE moobel ADD test int;
ALTER TABLE moobel DROP COLUMN test;
END;

CREATE TABLE moobel ( 
id INT AUTOINCREMENT PRIMARY KEY, 
moobelNimetus varchar(100) NOT NULL, 
hind decimal(10,2) NOT NULL, 
vastutaja varchar(100) NOT NULL );
SUM(hind) AS SummaarneHind FROM moobel; 
END;

CREATE PROCEDURE AddMoobel( 
@moobelNimetus VARCHAR(100), 
@hind DECIMAL(10,2),  
@vastutaja VARCHAR(100) ) 
BEGIN INSERT INTO moobel (moobelNimetus, hind, vastutaja) 
VALUES (@moobelNimetus, @hind, @vastutaja); 
END;

CREATE PROCEDURE GetMoobelByPrice(IN min_price DECIMAL(10,2)) BEGIN 
SELECT * FROM moobel WHERE hind > 100; 
END;

CALL AddMoobel('Diivan ', 500, 'Mugav diivan ', 'Jaan '); 
CALL AddMoobel('Tool ', 150, 'Puidust tool ', 'Mari '); 
CALL AddMoobel('Laud' , 300, 'Suur laud ', 'Peeter '); 
CALL GetMoobelByPrice(200);
END;
---------------------------------------------------------------
kasutame XAMPP / localhost

Create table linn(
linnID int 
