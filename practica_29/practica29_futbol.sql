CREATE TABLE equipos(
  id_equipo NUMBER(2) CONSTRAINT equipos_pk PRIMARY KEY,
  nombre VARCHAR2(50) CONSTRAINT equipos_uk1 UNIQUE
                      CONSTRAINT equipos_nn1 NOT NULL ,
  estadio VARCHAR2(50) CONSTRAINT equipos_uk2 UNIQUE ,
  aforo NUMBER(6) ,
  fecha_fundacion NUMBER(4) ,
  ciudad VARCHAR2(50) CONSTRAINT equipos_nn2 NOT NULL
);

CREATE TABLE jugadores(
  id_jugador NUMBER(3) CONSTRAINT jugadores_pk PRIMARY KEY,
  nombre VARCHAR2(50) CONSTRAINT jugadores_nn1 NOT NULL,
  fecha_nac DATE ,
  id_equipo NUMBER(2) CONSTRAINT jugadores_fk REFERENCES equipos(id_equipo) ON DELETE SET NULL
);


CREATE TABLE partidos(
  id_equipo_casa NUMBER(2) CONSTRAINT partidos_fk1 REFERENCES equipos(id_equipo) ON DELETE CASCADE
                            CONSTRAINT partidos_uk1 UNIQUE ,
  id_equipo_fuera NUMBER(2) CONSTRAINT partidos_fk2  REFERENCES equipos(id_equipo) ON DELETE CASCADE
                             CONSTRAINT partidos_uk2 UNIQUE ,
  fecha TIMESTAMP,
  goles_casa NUMBER(2) ,
  goles_fuera NUMBER(2) ,
  observaciones VARCHAR2(1000),
  CONSTRAINT partidos_pk PRIMARY KEY (id_equipo_casa,id_equipo_fuera),
  CONSTRAINT partidos_ck1 CHECK (id_equipo_fuera!=id_equipo_casa)
);

CREATE TABLE goles(
  id_equipo_casa NUMBER(2) ,
  id_equipo_fuera NUMBER(2) ,
  minuto INTERVAL DAY TO SECOND ,
  descripcion VARCHAR2(2000),
  id_jugador NUMBER(3) CONSTRAINT goles_fk2 REFERENCES jugadores(id_jugador) ON DELETE CASCADE ,
  CONSTRAINT goles_pk PRIMARY KEY (id_equipo_casa, id_equipo_fuera, minuto),
  CONSTRAINT goles_fk1 FOREIGN KEY (id_equipo_casa, id_equipo_fuera)
    REFERENCES partidos(id_equipo_casa, id_equipo_fuera) ON DELETE CASCADE
);

---------------------------------------------------------

ALTER TABLE equipos MODIFY(
  estadio CONSTRAINT equipos_nn3 NOT NULL,
  aforo CONSTRAINT equipos_nn4 NOT NULL
  );

ALTER TABLE equipos MODIFY fecha_fundacion DATE;

ALTER TABLE jugadores drop CONSTRAINT jugadores_nn1;

---------------------------------------------------------

INSERT INTO equipos(id_equipo, nombre, estadio, aforo, fecha_fundacion, ciudad) VALUES (1, 'Cascorro  F.C', 'la Arenera', '4000', '01/01/1961', 'Cascorro de Arriba');

INSERT INTO equipos(id_equipo, nombre, estadio, aforo, fecha_fundacion, ciudad) VALUES (2, 'Athletico de Matalasleñas', 'Cerro Galvez', '1200', '12/03/1970', 'Matalasleñas');

INSERT INTO jugadores(id_jugador, nombre, fecha_nac, id_equipo) VALUES (1, 'Amoribia', '20/01/1990', 1);

INSERT INTO jugadores(id_jugador, nombre, fecha_nac, id_equipo) VALUES (2, 'Garcia', '', 2);

INSERT INTO jugadores(id_jugador, nombre, fecha_nac, id_equipo) VALUES (3, 'Pedrosa', '12/09/1993', 1);

INSERT INTO partidos(id_equipo_casa, id_equipo_fuera, fecha, goles_casa, goles_fuera, observaciones) VALUES (1, 2, '05/11/2016', '2', '1', '');

INSERT INTO goles(id_equipo_casa, id_equipo_fuera, minuto, descripcion, id_jugador)  VALUES (1, 2, INTERVAL '23:00' MINUTE TO SECOND, 'Falta directa', 1);

INSERT INTO goles(id_equipo_casa, id_equipo_fuera, minuto, descripcion, id_jugador)  VALUES (1, 2, INTERVAL '40:00' MINUTE TO SECOND, 'Penalti', 2);

INSERT INTO goles(id_equipo_casa, id_equipo_fuera, minuto, descripcion, id_jugador)  VALUES (1, 2, INTERVAL '70:00' MINUTE TO SECOND, 'Jugada personal', 3);

---------------------------------------------------------
