CREATE EXTENSION postgis;

CREATE TABLE IF NOT EXISTS  zone_protejate (
    FID SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
    restrictii VARCHAR NOT NULL, 
    geom geometry('Polygon', 4326)
);

CREATE TABLE IF NOT EXISTS trasee_turistice (
    FID SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
    dificultate VARCHAR(50) NOT NULL,
    geom geometry('LineString', 4326)
);

CREATE TABLE IF NOT EXISTS puncte_de_interes (
    FID SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
    descriere TEXT,
    geom geometry('Point', 4326),
    traseu_ID INT,
    zone_protejate_ID INT,
    FOREIGN KEY (traseu_ID) REFERENCES trasee_turistice(FID),
    FOREIGN KEY (zone_protejate_ID) REFERENCES zone_protejate(FID)
);

CREATE TABLE IF NOT EXISTS  cai_de_acces (
    FID SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
    tip VARCHAR(50) NOT NULL,
    geom geometry('LineString', 4326),
    traseu_ID INT, 
    zone_protejate_ID INT,
    FOREIGN KEY (traseu_ID) REFERENCES trasee_turistice(FID),
    FOREIGN KEY (zone_protejate_ID) REFERENCES zone_protejate(FID)
);

CREATE TABLE IF NOT EXISTS facilitati_turistice (
    FID SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
    tip VARCHAR(50) NOT NULL,
    geom geometry('Polygon', 4326),
    traseu_ID INT,
    FOREIGN KEY (traseu_ID) REFERENCES trasee_turistice(FID)
);