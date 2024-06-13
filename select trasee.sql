#tabel zone_protejate
SELECT nume, ST_Area(geom) AS area FROM zone_protejate;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM zone_protejate;
SELECT nume, ST_Centroid(geom) AS centroid FROM zone_protejate;

#tabel trasee_turistice
SELECT ST_Length(geom) AS length FROM trasee_turistice;
SELECT ST_AsText(geom) AS geometry FROM trasee_turistice;
SELECT fid, ST_Length(geom) AS length FROM trasee_turistice;

#tabel puncte_de_interes
SELECT nume, ST_AsText(geom) AS coordinates FROM puncte_de_interes;
SELECT nume, ST_Perimeter(ST_Buffer(geom, 100)) AS perimeter FROM puncte_de_interes;
SELECT nume, ST_AsText(geom) AS coordinates FROM puncte_de_interes WHERE fid < 5;

#tabel cai_de_acces
SELECT fid, ST_Length(geom) AS length FROM cai_de_acces;
SELECT ST_Length(geom) AS length FROM cai_de_acces WHERE ST_Length(geom) < 1000;
SELECT fid, ST_AsText(geom) AS geometry FROM cai_de_acces;

#tabel facilitati_turistice
SELECT fid, nume, ST_Centroid(geom) AS centroid FROM facilitati_turistice;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM facilitati_turistice;
SELECT nume, ST_Area(geom) AS area FROM facilitati_turistice;

