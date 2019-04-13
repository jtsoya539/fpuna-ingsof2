create user poliscrum identified by inge2;
grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE to poliscrum;
grant DEBUG CONNECT SESSION to poliscrum;

grant select on sys.v_$session  to poliscrum;
grant select on sys.v_$sesstat  to poliscrum;
grant select on sys.v_$statname to poliscrum;

grant execute on sys.dbms_crypto to poliscrum;