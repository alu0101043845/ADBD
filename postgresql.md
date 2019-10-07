pract1=# create user ddg;   

CREATE ROLE

postgres=# alter role ddg with password 'password';

ALTER ROLE

postgres=# CREATE DATABASE pract1;

CREATE DATABASE

postgres=# \c pract1

You are now connected to database "pract1" as user "postgres".

pract1=# create table usuarios (

nombre varchar(30),

clave varchar(10)

);

CREATE TABLE

pract1=# insert into usuarios (nombre, clave) values ('Isa','asdf');

INSERT 0 1

pract1=# insert into usuarios (nombre, clave) values ('Pablo','jfx344');

INSERT 0 1

pract1=# insert into usuarios (nombre, clave) values ('Ana','tru3fal');

INSERT 0 1

pract1=# select * from usuarios;

 nombre |  clave  
 
--------+---------

 Isa    | asdf
 
 Pablo  | jfx344
 
 Ana    | tru3fal
 
(3 rows)

