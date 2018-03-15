select FECHA_PRESTAMO,sysdate-FECHA_PRESTAMO
from PRESTAMOS
order by FECHA_PRESTAMO desc;

--------------------------------------------------------

SELECT FECHA_PRESTAMO, N_COPIA, FECHA_TOPE FROM PRESTAMOS WHERE FECHA_ENTREGA IS NULL;

--------------------------------------------------------

SELECT ID_PRESTAMO, DNI FROM PRESTAMOS WHERE extract(MONTH FROM FECHA_PRESTAMO)=extract(MONTH FROM sysdate);

--------------------------------------------------------

SELECT DNI, to_char(FECHA_PRESTAMO, 'fmdd/month/yyyy'),to_char(FECHA_TOPE, 'fmdd/month/yyyy'), to_char(FECHA_ENTREGA, 'fmdd/month/yyyy'), N_COPIA FROM PRESTAMOS;

--------------------------------------------------------

SELECT TITULO from peliculas WHERE instr(TITULO, ' ')=0;

--------------------------------------------------------

SELECT TITULO FROM PELICULAS WHERE instr(TITULO, ' ')>0 AND instr(TITULO, ' ', instr(TITULO, ' ')+1)=0;

--------------------------------------------------------

SELECT TITULO FROM PELICULAS WHERE length(TITULO)>length(CRITICA);

---------------------------------------------------------

SELECT upper(translate(TITULO, 'áéíóúü','aeiouu')) FROM PELICULAS;

----------------------------------------------------------

SELECT TITULO, AÑO FROM PELICULAS WHERE extract(YEAR FROM AÑO);

-----------------------------------------------------------

SELECT NVL(SUBSTR(TITULO,1,instr(TITULO,' ', 1, 3)),TITULO) as titulo_comprimido FROM PELICULAS ;

------------------------------------------------------------

SELECT NOMBRE FROM CLIENTES WHERE instr(NOMBRE, 'A') in (1,3,5) OR instr(NOMBRE, 'E') in (1,3,5);

SELECT NOMBRE FROM CLIENTES WHERE REGEXP_INSTR(UPPER(NOMBRE),'[AEÁÉ]') IN (1,3,5);

-------------------------------------------------------------

SELECT TITULO from PELICULAS WHERE instr(TITULO, ' ')=0 AND regexp_COUNT(TITULO, '[aeiouAEIOU]')=1;

-------------------------------------------------------------

SELECT APELLIDO2 ||' '|| APELLIDO1 ||' '|| NOMBRE ||' '|| NVL(EMAIL, ', sin email') AS datos
FROM CLIENTES ORDER BY APELLIDO2 ASC ;
