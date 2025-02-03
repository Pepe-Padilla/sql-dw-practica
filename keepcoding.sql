-- KeepCoding Practica SQL DataWareHouse
-- Creación tabla Profesores
CREATE TABLE Profesores (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	phone VARCHAR(12) NOT NULL,
	discord VARCHAR(80),
	linkedin VARCHAR(255)
);

-- Creación tabla Módulos
CREATE TABLE Modulos (
	id SERIAL PRIMARY KEY,
	profesor_id INT NOT NULL,
	description VARCHAR(255) NOT NULL,
	title VARCHAR(80) NOT NULL,
	temario_link VARCHAR(255) NOT NULL,
	FOREIGN KEY (profesor_id) REFERENCES Profesores(id)
);

-- Creación tabla Bootcamp
CREATE TABLE Bootcamp (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	description VARCHAR(255) NOT NULL,
	temario_link VARCHAR(255)
);

-- Creación tabla Alumnos
CREATE TYPE status_alumno AS ENUM('registred', 'active', 'inactive');
CREATE TABLE Alumnos (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	first_name VARCHAR(80) NOT NULL,
	status status_alumno NOT NULL,
	
);