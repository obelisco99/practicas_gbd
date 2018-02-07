CREATE TABLE localidades(
  id_localidad NUMBER(5) CONSTRAINT localidades_pk PRIMARY KEY,
  nombre VARCHAR2(50) CONSTRAINT localidades_nn1 NOT NULL,
  poblacion NUMBER(8)
);

CREATE TABLE provincias(
  n_provincia NUMBER(2) CONSTRAINT provincias_pk PRIMARY KEY ,
  nombre VARCHAR2(25) CONSTRAINT provincias_uk1 UNIQUE
    CONSTRAINT provincias_nn1 NOT NULL ,
  superficie NUMBER(5)
);

CREATE TABLE comunidades(
  id_comunidad NUMBER(2) CONSTRAINT comunidades_pk PRIMARY KEY ,
  nombre VARCHAR2(25) CONSTRAINT comunidades_uk1 UNIQUE
    CONSTRAINT comunidades_nn1 NOT NULL ,
  max_provincias NUMBER(1),
  id_capital NUMBER(5) CONSTRAINT comunidades_fk1 REFERENCES localidades(id_localidad)
    CONSTRAINT comunidades_uk2 UNIQUE
    CONSTRAINT comunidades_nn2 NOT NULL
);

ALTER TABLE localidades ADD (n_provincia NUMBER(2)
  CONSTRAINT localidades_fk REFERENCES provincias(n_provincia)
  CONSTRAINT localidades_nn2 NOT NULL
  );

ALTER TABLE provincias ADD (id_capital NUMBER(5)
  CONSTRAINT provincias_fk1 REFERENCES localidades(id_localidad)
  CONSTRAINT provincias_nn2 NOT NULL
  CONSTRAINT provincias_uk2 UNIQUE
  );

ALTER TABLE provincias ADD (id_comunidad NUMBER(2)
  CONSTRAINT provincias_fk2 REFERENCES comunidades(id_comunidad)
  CONSTRAINT provincias_nn3 NOT NULL
  );








