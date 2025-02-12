CREATE TEMP FUNCTION Limpieza_Enteros(x INT64)
RETURNS INT64
AS (
  ifnull(x,-999999)
);
-- Ejemplo de prueba:
--select Limpieza_Enteros(10), Limpieza_Enteros(-400), Limpieza_Enteros(null)