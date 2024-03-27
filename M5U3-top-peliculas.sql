DROP TABLE IF EXISTS PELICULAS;
DROP TABLE IF EXISTS REPARTO;

CREATE TABLE PELICULAS (
	ID INT,
	PELICULA VARCHAR(200),
	ESTRENO INT,
	DIRECTOR VARCHAR(100)
);

CREATE TABLE REPARTO (
	id_pelicula INT,
	actor VARCHAR(100)
);

-- IMPORTAR EL CSV DE PELICULAS /Users/melaniecollins/peliculas.csv
COPY PELICULAS
FROM '/Users/melaniecollins/peliculas.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM PELICULAS;

-- IMPORTAR EL CSV DE REPARTO /Users/melaniecollins/reparto.csv
COPY REPARTO
FROM '/Users/melaniecollins/reparto.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM REPARTO;

-- 3. Obtener el ID de la película “Titanic”
SELECT ID AS N_ID_TITANIC
FROM PELICULAS
WHERE PELICULA = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic"
SELECT ACTOR AS ACTORES_TITANIC
FROM REPARTO
WHERE ID_PELICULA = 2;

SELECT REPARTO.ACTOR, PELICULAS.*
FROM PELICULAS
JOIN REPARTO ON PELICULAS.ID = REPARTO.ID_PELICULA
WHERE ID_PELICULA = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT REPARTO.ACTOR, PELICULAS.PELICULA
FROM PELICULAS
JOIN REPARTO ON PELICULAS.ID = REPARTO.ID_PELICULA
WHERE ACTOR = 'Harrison Ford';

SELECT COUNT(REPARTO.ACTOR) AS N_PELICULASTOP100_HF
FROM PELICULAS
JOIN REPARTO ON PELICULAS.ID = REPARTO.ID_PELICULA
WHERE ACTOR = 'Harrison Ford'; --RESULTADO 8

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
SELECT PELICULA, ESTRENO
FROM PELICULAS
WHERE ESTRENO > 1990
AND ESTRENO < 1999
ORDER BY PELICULA ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT PELICULA, LENGTH(PELICULA) AS longitud_titulo
FROM PELICULAS;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT PELICULA, LENGTH(PELICULA) AS longitud_titulo
FROM PELICULAS
ORDER BY longitud_titulo DESC
LIMIT 1;
