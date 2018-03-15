/*Ejercicio 1*/

SELECT 57 from dual;

/*Ejercicio 2*/

SELECT sqrt(23) from dual;

/*Ejercicio 3*/

SELECT translate(round(sqrt(23), 3), '.',',' ) from dual;

/*Ejercicio 4*/

SELECT NOMBRE, upper(substr(NOMBRE, -3)) FROM ALUMNOS ORDER BY NOMBRE DESC ;

SELECT NOMBRE, upper(REGEXP_INSTR(NOMBRE,[]$)) FROM ALUMNOS ORDER BY NOMBRE DESC;

