-- REVIEW 01

-- SELECT
SELECT *
FROM libros
WHERE precio > 200;

SELECT titulo, precio
FROM libros
WHERE precio > 180
ORDER BY precio DESC;

SELECT *
FROM libros
ORDER BY fecha_publicacion DESC;

SELECT autor_id, COUNT(*) AS cantidad_libros
FROM libros
GROUP BY autor_id;

-- UPDATE
UPDATE libros
SET precio = 220.00
WHERE autor_id = 1;

UPDATE libros
SET precio = precio + 20
WHERE precio < 180;

UPDATE libros
SET precio = 250.00
WHERE autor_id = 4
  AND precio > 200;

-- DELETE
DELETE FROM libros
WHERE isbn = '978-607-001234-5';

DELETE FROM libros
WHERE precio < 180;

DELETE FROM libros
WHERE autor_id = 3
  AND fecha_publicacion < '2018-01-01';

-- REVIEW 02
-- CTE
WITH libros_caros AS (
    SELECT titulo, precio
    FROM libros
    WHERE precio > 180
)
SELECT titulo, precio
FROM libros_caros
ORDER BY precio DESC;

-- PARTICION
SELECT 
    fecha,
    vendedor,
    monto,
    ROUND(
        (monto / SUM(monto) OVER (
            PARTITION BY 
                EXTRACT(YEAR FROM fecha),
                EXTRACT(MONTH FROM fecha)
        )) * 100,
        2
    ) AS porcentaje_del_mes
FROM ventas_vendedores
ORDER BY fecha;

-- REVIEW 03 

-- 1. Obtener el título, fecha de publicación y precio de todos los libros publicados después del año 2000, ordenados del más reciente al más antiguo.
SELECT titulo, fecha_publicacion, precio
FROM libros
WHERE fecha_publicacion > '2000-12-31'
ORDER BY fecha_publicacion DESC;

-- 2. Listar los nombres completos (nombre y apellido en una sola columna) y la nacionalidad de todos los autores cuya nacionalidad sea 'Española' o 'Argentina'.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo, nacionalidad 
FROM autores
WHERE nacionalidad IN ('Española', 'Argentina');

-- 3. Consultar todos los libros cuyo precio esté entre $15.00 y $20.00 inclusive.
SELECT * 
FROM libros
WHERE precio BETWEEN 15.00 AND 20.00;

-- 4. Buscar todos los libros cuyo título contenga la palabra "amor" (sin importar si está en mayúsculas o minúsculas).
SELECT * 
FROM libros
WHERE titulo ILIKE '%amor%';

-- 5. Mostrar los 5 libros más costosos de la base de datos con su título y precio.
SELECT titulo,precio
FROM libros
ORDER BY precio DESC LIMIT 5;

-- 6. Mostrar el título del libro, el precio y el nombre completo del autor al que pertenece cada libro.
SELECT l.titulo, l.precio, CONCAT(a.nombre, ' ', a.apellido) AS nombre_del_autor
FROM libros l
INNER JOIN autores a ON l.autor_id = a.autor_id;

-- 7. Calcular la cantidad total de libros que ha escrito cada autor. Mostrar el nombre completo del autor y el total de libros, ordenados de mayor a menor.
SELECT CONCAT(a.nombre, ' ', a.apellido) AS nombre_del_autor, COUNT(l.libro_id) AS libros_escritos
FROM autores a
LEFT JOIN libros l ON a.autor_id = l.autor_id
GROUP BY a.autor_id, a.nombre, a.apellido
ORDER BY libros_escritos DESC;

-- 8. Obtener el precio promedio, el precio mínimo y el precio máximo de los libros publicados por cada autor.
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_del_autor,
    AVG(l.precio) AS precio_promedio,
    MIN(l.precio) AS precio_minimo,
    MAX(l.precio) AS precio_maximo
FROM autores a
LEFT JOIN libros l ON a.autor_id = l.autor_id
GROUP BY a.autor_id, a.nombre, a.apellido;

-- 9. Listar los autores que tienen un promedio de precio en sus libros superior a $20.00.
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_del_autor,
    AVG(l.precio) AS precio_promedio
FROM autores a
INNER JOIN libros l ON a.autor_id = l.autor_id
GROUP BY a.autor_id, a.nombre, a.apellido
HAVING AVG(l.precio) > 20.00;

-- 10. Contar cuántos libros se han publicado por cada nacionalidad de los autores.
SELECT 
    a.nacionalidad,
    COUNT(l.libro_id) AS total_libros
FROM autores a
INNER JOIN libros l ON a.autor_id = l.autor_id
GROUP BY a.nacionalidad;

