# sql-dw-practica
### **Práctica SQL Datawarehouse** - Ejercicio de Bootcamp Inteligencia Artificial Full Stack Edición III

Este proyecto es un entregable para la práctica del Master Bootcamp Inteligencia Artificial Full Stack Edición III realizado por el centro de formación [@Keepcoding](https://github.com/KeepCoding)

---

#### A continuación se muestran los ficheros que contienen el resultaod de cada ejercicio.

- **Ejercio 1**: Archivo [01_ER_practica.drawio.pdf](./01_ER_practica.drawio.pdf), incluye el MR y la explicación de la misma, igualmente se incluye el resumen aqui.

![diagrama](./01_ER_practica.drawio.png)

```
Se crea un RM para cubrir las neceidades de Keepcoding de acuerdo a sus actividades.

Primero se crea la enitidad PROFESORES, los profesores pueden ser contactados para informar fechas 
y cambios. 

Cada profesor puede dar clase para 1 o más Módulos, de acuerdo a sus experiencia y conocimientos.
Los módulos tiene temario, título y descripción. Para esto se crea la entidad MODULOS

Los Bootcamps son los master ofrecidos por Keepcoding a los alumnos, para solventar esto se ha creado
la entidad BOOTCAMP, cada bootcamp ofrece un temario que contiene los módulos de clases. Esta 
relación puede cambiar de acuerdo a la edición del bootcamp, de tal modo que un bootcamp puede tener 
distintos módulos de acuerdo a su edición, cada uno con fechas establecidas para dar las clases. Para 
esta relación se ha creado la entidad N a N MODULO_BOOTCAMP.

Los alumnos, con entidad ALUMNOS, son quienes se inscriben a los bootcamps, pudiendo hacer más de 1,
los alumnos entonces se suscriben a los bootcamps donde llevan un proceso desde consultar información 
hasta la suscripción y cumplimiento de los bootcamps incluida la información de la edción. Para el BI solo 
ocupará el status final de la interacción con los alumnos y sus motivos de estado. Toda esta información se 
ve reflejada en la entidad  ALUMNO_BOOTCAMP 
```

- **Ejercicio 2**: Archivos [02_keepcoding.ddl.sql](./02_keepcoding.ddl.sql) para la inserción del modelo y un conjunto de datos para probar en el archivo [02_keepcoding.dml.sql](./02_keepcoding.dml.sql)

- **Ejercicio 3**: Archivo [03_ivr_detail.sql](./03_ivr_detail.sql) muestra la tabla creada para el detalle.

- **Ejercicio 4**: Archivo [04_vdn_aggregation.sql](./04_vdn_aggregation.sql) muestra la generalización solicitada.

- **Ejercicio 5**: Para este caso he encontrado más de una solución, no estoy seguro cual sea la mejor así que van ambas:
  - Solución 1: [05_client_identification1.sql](./05_client_identification1.sql)
  - Solución 2: [05_client_identification2.sql](./05_client_identification2.sql)

- **Ejercicio 6**: Igual que el punto anterior publico ambas soluciones:
  - Solución 1: [06_client_phone1.sql](./06_client_phone1.sql)
  - Solución 2: [06_client_phone2.sql](./06_client_phone2.sql)

- **Ejercicio 7**: Publico 2 soluciones:
  - Solución 1: [07_client_account1.sql](./07_client_account1.sql)
  - Solución 2: [07_client_account2.sql](./07_client_account2.sql)
> En esta ocación he visto que la solución 2 ha entregado la respuesta más rápido que la primera, pero podría ser por el cache, si puedo haré nuevas pruebas a la inversa.

- **Ejercicio 8**: Archivo [08_call_masiva.sql](./08_call_masiva.sql)

- **Ejercicio 9**: Archivo [09_info_by_phone_lg.sql](./09_info_by_phone_lg.sql)

- **Ejercicio 10**: Archivo [10_info_by_dni_lg.sql](./10_info_by_dni_lg.sql)

- **Ejercicio 11**: Archivo [11_24H_phone_lg.sql](./11_24H_phone_lg.sql). Todo digno de un Kata

- **Ejercicio 12**: Archivo [12_ivr_summary.sql](./12_ivr_summary.sql).

- **Ejercicio 13**: Archivo [13_limpieza_enteros.sql](./13_limpieza_enteros.sql)