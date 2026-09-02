-- REVIEW 
INSERT INTO autores (nombre, apellido, fecha_nacimiento, nacionalidad) VALUES
('Gabriel', 'Mendoza', '1978-04-12', 'Guatemalteca'),
('Laura', 'Castillo', '1985-09-27', 'Mexicana'),
('Andrés', 'Ramírez', '1972-01-18', 'Colombiana'),
('Sofía', 'Hernández', '1990-06-05', 'Argentina'),
('Carlos', 'Vargas', '1969-11-23', 'Española');

INSERT INTO libros (autor_id, titulo, isbn, fecha_publicacion, precio) VALUES
(1, 'El Camino de los Sueños', '978-607-001234-5', '2018-03-15', 185.50),
(2, 'Bajo el Cielo Azul', '978-607-002345-6', '2020-07-22', 210.00),
(3, 'Historias del Tiempo', '978-958-003456-7', '2016-11-08', 175.75),
(4, 'La Última Estrella', '978-950-004567-8', '2022-02-14', 245.90),
(5, 'Sombras del Pasado', '978-84-005678-9', '2019-09-30', 199.99);
