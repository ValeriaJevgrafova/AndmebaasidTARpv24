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

---------------------------------------------------------------
kasutame XAMPP / localhost

Create table linn(
linnID int 
