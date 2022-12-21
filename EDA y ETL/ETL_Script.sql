-- Estas dos querys deben realizarse previo a cargar la tabla desde Python
CREATE DATABASE pi01;

USE pi01;

-- Al tener una columna indice, la columna show_id ya no aporta valor, por lo que la retiramos
ALTER TABLE title DROP COLUMN show_id;

-- Revisamos las columnas para ver máximos
SELECT *, (length(type)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 7
SELECT *, (length(title)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 113
SELECT *, (length(director)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 1024
-- Analizamos el valor extremo, y tomamos la desición de arreglar el campo
UPDATE title SET director = 'ValidCAPI' WHERE `index` = 9224;
SELECT *, (length(director)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 273
SELECT *, (length(cast)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 1099
-- Detectamos un valor muy extraño, lo analizamos y los valores corresponden a un elenco muy grande, está correcto
SELECT *, (length(country)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 137
-- Detectamos un valor muy extraño, lo analizamos y los valores corresponden a varios países, está correcto
SELECT *, (length(date_added)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 19
SELECT *, (length(rating)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 10
-- Detectamos que hay valores que pertenecen a columnas diferentes
UPDATE title SET duration = rating, rating = 'Sin_datos' WHERE `index` = 14069;
UPDATE title SET duration = rating, rating = 'Sin_datos' WHERE `index` = 14026;
UPDATE title SET duration = rating, rating = 'Sin_datos' WHERE `index` = 14073;
SELECT *, (length(rating)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 9
SELECT *, (length(duration)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 10
SELECT *, (length(listed_in)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 79
SELECT *, (length(description)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 1870
SELECT *, (length(Platform)) AS Largo FROM pi01.title ORDER BY Largo DESC LIMIT 5; -- 7

-- Realizamos algunas modificaciones de tipos de datos
UPDATE title SET duration = rating
WHERE rating LIKE "%season%";

UPDATE title SET rating = 'Sin_datos'
WHERE rating LIKE "%season%";

UPDATE title SET duration = rating
WHERE rating LIKE "%min%";

UPDATE title SET rating = 'Sin_datos'
WHERE rating LIKE "%min%";

UPDATE title SET duration = REPLACE(Duration,'Seasons',''),
	duration = REPLACE(Duration,'Season',''),
   	duration = REPLACE(Duration,'min',''),
    duration = REPLACE(Duration,'Sin_datos', 0);

ALTER TABLE `pi01`.`title` 
CHANGE COLUMN `index` `ID` int not NULL,
CHANGE type Type varchar(10),
CHANGE title Title varchar(120),
CHANGE director Director varchar(300),
CHANGE cast Cast varchar(1200),
CHANGE country Country varchar(150),
CHANGE date_added Date_added varchar(20),
CHANGE release_year Release_year year,
CHANGE rating Rating varchar(10),
CHANGE duration Duration int,
CHANGE listed_in Listed_in varchar(100),
CHANGE `description` `Description` varchar(1900),
CHANGE Platform Platform varchar(7);

-- Dejamos este espacio para realizar un proceso de ETL más profundo, y realizar una mejor limpieza de los datos

UPDATE title SET director = "Sin_datos"
WHERE director = '1';

UPDATE title SET Cast = "Sin_datos"
WHERE Cast = '1';

UPDATE title SET Cast = REPLACE(Cast,"'",'')
WHERE ID = 16293;

UPDATE title SET Cast = "Sin_datos"
WHERE ID = 6416;

SELECT Director FROM title WHERE Director LIKE "%Century%";
UPDATE title SET Director = "20th Century Fox"
WHERE Director LIKE "%Century%";