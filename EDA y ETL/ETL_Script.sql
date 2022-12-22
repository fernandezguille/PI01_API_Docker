-- Estas dos querys deben realizarse previo a cargar la tabla desde Python
# CREATE DATABASE pi01;
# USE pi01;

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

-- Realizamos únicamente transformaciones en las columnas Cast y Listed_in, que serán las consultadas por la API

SELECT DISTINCT listed_in FROM genre ORDER BY 1;

UPDATE title SET Listed_in = REPLACE(Listed_in,'TV ','');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Action & Adventure','Action, Adventure');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Action-Adventure','Action, Adventure');
UPDATE title SET Listed_in = REPLACE(Listed_in,' and Culture',', Culture');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Animals & Nature','Animals, Nature');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Anime Features','Anime');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Anime Series','Anime');
UPDATE title SET Listed_in = REPLACE(Listed_in,'British TV Shows','British');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Children & Family Movies','Children, Family');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Classic & Cult TV','Classic, Cult');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Classic Movies','Classic');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Classics','Classic');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Comedies','Comedy');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Concert Film','Concert');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Crime TV Shows','Crime');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Cult Movies','Cult');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Documentaries','Documentary');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Dramas','Drama');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Faith and Spirituality','Faith & Spirituality');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Game Shows','Game Show');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Historical','History');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Horror Movies','Horror');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Independent Movies','Independent');
UPDATE title SET Listed_in = REPLACE(Listed_in,'International Movies','International');
UPDATE title SET Listed_in = REPLACE(Listed_in,'International TV Shows','International');
UPDATE title SET Listed_in = REPLACE(Listed_in,"Kids' TV",'Kids');
UPDATE title SET Listed_in = REPLACE(Listed_in,"Korean TV Shows",'Korean');
UPDATE title SET Listed_in = REPLACE(Listed_in,"LGBTQ Movies",'LGBTQ+');
UPDATE title SET Listed_in = REPLACE(Listed_in,"LGBTQ",'LGBTQ+');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Lifestyle & Culture','Lifestyle, Culture');
UPDATE title SET Listed_in = REPLACE(Listed_in,"Mysteries",'Mystery');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Music & Musicals','Music, Musical');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Music Videos and Concerts','Music, Concert');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Reality TV','Reality');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Romantic Movies','Romance');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Romantic TV Shows','Romance');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Sci-Fi & Fantasy','Sci-Fi, Fantasy');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Science & Nature TV','Science, Nature');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Science & Technology','Science, Technology');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Science Fiction','Sci-Fi');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Spanish-Language TV Shows','Spanish-Language');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Sports Movies','Sports');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Stand-Up Comedy','Stand-Up, Comedy');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Stand-Up Comedy & Talk Shows','Stand-Up, Comedy, Talk Show');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Talk Show and Variety','Talk Show, Variety');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Teen TV Shows','Teen');
UPDATE title SET Listed_in = REPLACE(Listed_in,'Thrillers','Thriller');

-- Revisamos si quedó algún género sin arreglar
SELECT Listed_in, count(Listed_in) FROM title GROUP BY 1 HAVING Listed_in LIKE '%Movies%';
UPDATE title SET Listed_in = REPLACE(Listed_in,'Movies','Sin_dato');
SELECT Listed_in, count(Listed_in) FROM title GROUP BY 1 HAVING Listed_in LIKE '%TV%';

-- Ahora para Cast
SELECT *, (length(cast)) AS Largo FROM pi01.actor ORDER BY Largo DESC LIMIT 15;

UPDATE title SET Cast = REPLACE(Cast,'|',',');