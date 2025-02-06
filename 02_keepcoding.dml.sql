-- KeepCoding Practica SQL DataWareHouse
-- Datos dummy para Profesores
INSERT INTO Profesores (name, email, phone, linkedin) VALUES 
('Patricio Perez','patricio.perez@mail.com','698745213','https://www.linkedin.com/in/patricio-perez-ba951684/'),
('Calamardo Lopez','calamardo.lopez@mail.com','635874217','https://www.linkedin.com/in/calamardo-lopez-ba478632/'),
('Bob Esponjoso','Bob.esponjoso@mail.com','668741123','https://www.linkedin.com/in/bob-esponjoso-ba452658/'),
('Arenita Ramirez','arenita.ramirez@mail.com','622478965','https://www.linkedin.com/in/arenita-ramirez-ba742358/'),
('Cangrejo Rodríguez','cangrejo.rodriguez@mail.com','614785239','https://www.linkedin.com/in/cangrejo-rodriguez-ba147258/');

-- Datos dummy para Módulos
INSERT INTO Modulos (profesor_id, description, title, temario_link) VALUES
(1,'Introducción al sus de la IA y su alcance','IA 101','https://keepcoding.io/mod/15165'),
(1,'BigData desde 0 a experto','BigData','https://keepcoding.io/mod/356332'),
(1,'IA para empresas, su uso y terminos legales','IA Buisnes','https://keepcoding.io/mod/4654665'),
(2,'Uso de Git desde 0 a pro','Git GitHub y SourceTree','https://keepcoding.io/mod/516166161'),
(3,'Pro de SQL para toda Base de datos','SQL avanzado','https://keepcoding.io/mod/1651616'),
(4,'Uso de Python, avanzado y más','Python Expert','https://keepcoding.io/mod/17816516'),
(5,'Uso de datos para el beneficio de las empresas','Buisnes inteligence','https://keepcoding.io/mod/496496416'),
(5,'Creación de IAs generativas de actuerdo a la demanda del mercado','IA generativa','https://keepcoding.io/mod/1465161');

-- Datos dummy para Bootcamp
INSERT INTO Bootcamp (title, description, temario_link) VALUES
('BootCamp Inteligencia Artificial', 'Master BootCamp completo de Inteligencia artificial fullstack','https://keepcoding.io/temarios/496496416'),
('BigData, IA y MachineLearning', 'Master BootCamp completo de BigData, IA, MachineLearning y BI','https://keepcoding.io/temarios/651616474');

-- Datos dummy para Alumnos
INSERT INTO Alumnos (last_name, name, status, phone, email, linkedin, github) VALUES
('García', 'Juan', 'active', '+34615987412', 'juan.garcia@example.com', 'linkedin.com/in/juangarcia', 'github.com/juangarcia'),
('Martínez', 'Ana', 'active', '+34628745963', 'ana.martinez@example.com', 'linkedin.com/in/anamartinez', 'github.com/anamartinez'),
('López', 'Carlos', 'inactive', '+34639874521', 'carlos.lopez@example.com', 'linkedin.com/in/carloslopez', 'github.com/carloslopez'),
('Rodríguez', 'María', 'active', '+34641236598', 'maria.rodriguez@example.com', 'linkedin.com/in/mariarodriguez', 'github.com/mariarodriguez'),
('Pérez', 'Luis', 'active', '+34652369874', 'luis.perez@example.com', 'linkedin.com/in/luisperez', 'github.com/luisperez'),
('Gómez', 'Sofía', 'inactive', '+34663214587', 'sofia.gomez@example.com', 'linkedin.com/in/sofiagomez', 'github.com/sofiagomez'),
('Fernández', 'Diego', 'active', '+34674589632', 'diego.fernandez@example.com', 'linkedin.com/in/diegofernandez', 'github.com/diegofernandez'),
('Díaz', 'Laura', 'active', '+34685632147', 'laura.diaz@example.com', 'linkedin.com/in/lauradiaz', 'github.com/lauradiaz');

---- Relaciones N a N
-- Datos dummy para Modulo_bootcamp
INSERT INTO Modulo_bootcamp (modulo_id, bootcamp_id, edition, start_date, finsh_date, exam_date, module_link) VALUES
-- Bootcamp 1, Edition 1
(1, 1, 1, '2023-01-01', '2023-01-28', '2023-02-18', 'https://keepcoding.io/editionBoot/12345'),
(2, 1, 1, '2023-02-19', '2023-03-18', '2023-04-08', 'https://keepcoding.io/editionBoot/67890'),
(3, 1, 1, '2023-04-09', '2023-05-06', '2023-05-27', 'https://keepcoding.io/editionBoot/54321'),
(4, 1, 1, '2023-05-28', '2023-06-24', '2023-07-15', 'https://keepcoding.io/editionBoot/98765'),
(5, 1, 1, '2023-07-16', '2023-08-12', '2023-09-02', 'https://keepcoding.io/editionBoot/11223'),

-- Bootcamp 1, Edition 2
(1, 1, 2, '2023-09-03', '2023-09-30', '2023-10-21', 'https://keepcoding.io/editionBoot/44556'),
(2, 1, 2, '2023-10-22', '2023-11-18', '2023-12-09', 'https://keepcoding.io/editionBoot/77889'),
(3, 1, 2, '2023-12-10', '2024-01-06', '2024-01-27', 'https://keepcoding.io/editionBoot/33445'),
(4, 1, 2, '2024-01-28', '2024-02-24', '2024-03-16', 'https://keepcoding.io/editionBoot/66778'),
(5, 1, 2, '2024-03-17', '2024-04-13', '2024-05-04', 'https://keepcoding.io/editionBoot/99001'),

-- Bootcamp 2, Edition 1
(6, 2, 1, '2023-01-01', '2023-01-28', '2023-02-18', 'https://keepcoding.io/editionBoot/22334'),
(7, 2, 1, '2023-02-19', '2023-03-18', '2023-04-08', 'https://keepcoding.io/editionBoot/55667'),
(8, 2, 1, '2023-04-09', '2023-05-06', '2023-05-27', 'https://keepcoding.io/editionBoot/88990'),
(1, 2, 1, '2023-05-28', '2023-06-24', '2023-07-15', 'https://keepcoding.io/editionBoot/11223'),
(2, 2, 1, '2023-07-16', '2023-08-12', '2023-09-02', 'https://keepcoding.io/editionBoot/44556'),

-- Bootcamp 2, Edition 2
(6, 2, 2, '2023-09-03', '2023-09-30', '2023-10-21', 'https://keepcoding.io/editionBoot/77889'),
(7, 2, 2, '2023-10-22', '2023-11-18', '2023-12-09', 'https://keepcoding.io/editionBoot/33445'),
(8, 2, 2, '2023-12-10', '2024-01-06', '2024-01-27', 'https://keepcoding.io/editionBoot/66778'),
(1, 2, 2, '2024-01-28', '2024-02-24', '2024-03-16', 'https://keepcoding.io/editionBoot/99001'),
(2, 2, 2, '2024-03-17', '2024-04-13', '2024-05-04', 'https://keepcoding.io/editionBoot/22334');


-- Datos dummy para Alumno_Bootcamp
INSERT INTO Alumno_Bootcamp ( bootcamp_id, alumno_id, edition, status, suscription_date, notes) VALUES
(1, 1, 1, 'interesded', '2024-01-10', 'El alumno mostró interés pero aún no ha aplicado.'),
(1, 2, 1, 'pending interview', '2024-01-12', 'Esperando entrevista con el equipo de admisiones.'),
(1, 3, 1, 'accepted', '2024-01-15', 'El alumno fue aceptado y puede proceder al pago.'),
(1, 4, 1, 'denided', '2024-01-16', 'No cumple con los requisitos mínimos de ingreso.'),
(2, 5, 2, 'payed', '2024-02-01', 'El alumno completó el pago y está listo para iniciar.'),
(2, 6, 2, 'finished satisfactory', '2024-05-20', 'Completó todos los módulos con calificaciones sobresalientes.'),
(2, 7, 2, 'finished complete', '2024-05-20', 'Completó todos los módulos con calificaciones aprobatorias.'),
(2, 8, 2, 'finished not complete', '2024-05-20', 'No completó algunos módulos obligatorios.'),
(1, 5, 1, 'cancelled', '2024-03-01', 'El alumno decidió cancelar su inscripción antes de iniciar.');
;