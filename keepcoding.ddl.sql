-- KeepCoding Practica SQL DataWareHouse

-- Rollback por si se necesita
--DROP TABLE Alumno_Bootcamp;
--DROP TYPE status_suscripcion;
--DROP TABLE Modulo_bootcamp;
--DROP TABLE Alumnos;
--DROP TYPE status_alumno;
--DROP TABLE Modulos;
--DROP TABLE Profesores;


-- Creación tabla Profesores
CREATE TABLE Profesores (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	phone VARCHAR(12) NOT NULL,
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
	last_name VARCHAR(80) NOT NULL,
	status status_alumno NOT NULL,
	phone VARCHAR(12) NOT NULL,
	email VARCHAR(150) NOT NULL,
	linkedin VARCHAR(255),
	github VARCHAR(255)
);

---- Relaciones N a N
-- Creación tabla Modulo_bootcamp
CREATE TABLE Modulo_bootcamp (
	modulo_id INT NOT NULL,
	bootcamp_id INT NOT NULL,
	edition INT NOT NULL,
	start_date date,
	finsh_date date,
	exam_date date,
	module_link VARCHAR(255),
	FOREIGN KEY (profesor_id) REFERENCES Profesores(id),
	FOREIGN KEY (bootcamp_id) REFERENCES Bootcamp(id),
	PRIMARY KEY(profesor_id, bootcamp_id, edition)
);

-- Creación tabla Alumno_Bootcamp
CREATE TYPE status_suscripcion AS ENUM('interesded', 'pending interview', 'accepted', 'denided', 'payed', 'finished satisfactory', 'finished complete', 'finished not complete', 'cancelled');
CREATE TABLE Alumno_Bootcamp (
	bootcamp_id INT NOT NULL,
	alumno_id INT NOT NULL,
	edition INT NOT NULL,
	status status_suscripcion DEFAULT 'interesded',
	suscription_date date,
	notes VARCHAR(255),
	FOREIGN KEY (bootcamp_id) REFERENCES Bootcamp(id),
	FOREIGN KEY (alumno_id) REFERENCES Alumnos(id),
	PRIMARY KEY(alumno_id, bootcamp_id, edition)
);