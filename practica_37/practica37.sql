SELECT EQUIPO_CASA, EQUIPO_FUERA, (GOLES_CASA||'-'||GOLES_FUERA)
AS goles, CASE
  WHEN GOLES_CASA>GOLES_FUERA THEN 'Victoria local'
    WHEN GOLES_FUERA>GOLES_CASA THEN 'Victoria visitante'
  WHEN GOLES_FUERA=GOLES_CASA THEN  'Empate' END AS resultado
FROM PARTIDOS_COMPLETOS;

-----------------------------------------------------------------

SELECT * FROM PARTIDOS_COMPLETOS WHERE fecha>sysdate
  AND TO_CHAR(FECHA,'DAY')='Sábado'
  AND extract(hour FROM FECHA)=18 and ESTADIO='San Isidro';

-----------------------------------------------------------------

SELECT EQUIPO_CASA FROM PARTIDOS_COMPLETOS
WHERE EQUIPO_CASA=CIUDAD_CASA
ORDER BY length(EQUIPO_CASA) DESC;

-----------------------------------------------------------------

SELECT EQUIPO_FUERA FROM PARTIDOS_COMPLETOS WHERE instr(EQUIPO_CASA, 'o')>4;

-----------------------------------------------------------------

SELECT EQUIPO_FUERA, EQUIPO_CASA, ESTADIO, AFORO,
  to_char(FECHA, 'fmdd "de" month , day hh PM ') AS FECHA
FROM PARTIDOS_COMPLETOS
WHERE sysdate>FECHA
AND regexp_like(AFORO,^[0-9][00]$)
