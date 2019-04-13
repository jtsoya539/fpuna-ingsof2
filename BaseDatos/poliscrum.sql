prompt PL/SQL Developer Export User Objects for user POLISCRUM@RISK
prompt Created by javie on s·bado, 13 de abril de 2019
set define off
spool poliscrum.log

prompt
prompt Creating table T_APLICACIONES
prompt =============================
prompt
create table POLISCRUM.T_APLICACIONES
(
  id_aplicacion        VARCHAR2(5) not null,
  nombre               VARCHAR2(100),
  tipo                 CHAR(1),
  activo               CHAR(1),
  clave                VARCHAR2(50),
  detalle              VARCHAR2(2000),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE,
  version_actual       VARCHAR2(10)
)
;
comment on table POLISCRUM.T_APLICACIONES
  is 'Aplicaciones';
comment on column POLISCRUM.T_APLICACIONES.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_APLICACIONES.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_APLICACIONES.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_APLICACIONES.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_APLICACIONES
  add constraint PK_APLICACIONES primary key (ID_APLICACION);

prompt
prompt Creating table T_CIUDADES
prompt =========================
prompt
create table POLISCRUM.T_CIUDADES
(
  id_pais              NUMBER(3) not null,
  id_ciudad            NUMBER(3) not null,
  nombre               VARCHAR2(100),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_CIUDADES
  is 'Ciudades';
comment on column POLISCRUM.T_CIUDADES.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_CIUDADES.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_CIUDADES.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_CIUDADES.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_CIUDADES
  add constraint PK_CIUDADES primary key (ID_PAIS, ID_CIUDAD);

prompt
prompt Creating table T_ERRORES
prompt ========================
prompt
create table POLISCRUM.T_ERRORES
(
  id_error VARCHAR2(10) not null,
  mensaje  VARCHAR2(2000)
)
;
comment on table POLISCRUM.T_ERRORES
  is 'Errores';
alter table POLISCRUM.T_ERRORES
  add constraint PK_ERRORES primary key (ID_ERROR);

prompt
prompt Creating table T_PAISES
prompt =======================
prompt
create table POLISCRUM.T_PAISES
(
  id_pais              NUMBER(3) not null,
  nombre               VARCHAR2(100),
  iso_alpha_2          VARCHAR2(2),
  iso_alpha_3          VARCHAR2(3),
  iso_numeric          NUMBER(3),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_PAISES
  is 'Paises';
comment on column POLISCRUM.T_PAISES.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_PAISES.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_PAISES.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_PAISES.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_PAISES
  add constraint PK_PAISES primary key (ID_PAIS);

prompt
prompt Creating table T_PARAMETROS
prompt ===========================
prompt
create table POLISCRUM.T_PARAMETROS
(
  id_parametro VARCHAR2(50) not null,
  descripcion  VARCHAR2(500),
  valor        VARCHAR2(500)
)
;
comment on table POLISCRUM.T_PARAMETROS
  is 'Parametros';
alter table POLISCRUM.T_PARAMETROS
  add constraint PK_PARAMETROS primary key (ID_PARAMETRO);

prompt
prompt Creating table T_PERSONAS
prompt =========================
prompt
create table POLISCRUM.T_PERSONAS
(
  id_persona           NUMBER(10) not null,
  nombre               VARCHAR2(100),
  apellido             VARCHAR2(100),
  nombre_completo      VARCHAR2(200),
  tipo_persona         CHAR(1),
  tipo_documento       VARCHAR2(3),
  numero_documento     VARCHAR2(20),
  id_pais              NUMBER(3),
  fecha_nacimiento     DATE,
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_PERSONAS
  is 'Personas';
comment on column POLISCRUM.T_PERSONAS.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_PERSONAS.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_PERSONAS.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_PERSONAS.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_PERSONAS
  add constraint PK_PERSONAS primary key (ID_PERSONA);
alter table POLISCRUM.T_PERSONAS
  add constraint FK_PERSONAS_PAISES foreign key (ID_PAIS)
  references POLISCRUM.T_PAISES (ID_PAIS);

prompt
prompt Creating table T_PROYECTO_ESTADOS
prompt =================================
prompt
create table POLISCRUM.T_PROYECTO_ESTADOS
(
  id_proyecto_estado NUMBER(3) not null,
  descripcion        VARCHAR2(100),
  activo             CHAR(1)
)
;
comment on table POLISCRUM.T_PROYECTO_ESTADOS
  is 'Estados de Proyecto';
alter table POLISCRUM.T_PROYECTO_ESTADOS
  add constraint PK_PROYECTO_ESTADOS primary key (ID_PROYECTO_ESTADO);

prompt
prompt Creating table T_PROYECTOS
prompt ==========================
prompt
create table POLISCRUM.T_PROYECTOS
(
  id_proyecto        NUMBER(5) not null,
  nombre             VARCHAR2(200),
  id_estado          NUMBER(3),
  fecha_inicio       DATE,
  fecha_fin_estimado DATE,
  fecha_fin          DATE
)
;
comment on table POLISCRUM.T_PROYECTOS
  is 'Proyectos';
alter table POLISCRUM.T_PROYECTOS
  add constraint PK_PROYECTOS primary key (ID_PROYECTO);
alter table POLISCRUM.T_PROYECTOS
  add constraint FK_PROYECTOS_PROYECTO_ESTADOS foreign key (ID_ESTADO)
  references POLISCRUM.T_PROYECTO_ESTADOS (ID_PROYECTO_ESTADO);

prompt
prompt Creating table T_ROLES
prompt ======================
prompt
create table POLISCRUM.T_ROLES
(
  id_rol               NUMBER(3) not null,
  nombre               VARCHAR2(100),
  activo               CHAR(1),
  detalle              VARCHAR2(2000),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_ROLES
  is 'Roles';
comment on column POLISCRUM.T_ROLES.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_ROLES.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_ROLES.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_ROLES.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_ROLES
  add constraint PK_ROLES primary key (ID_ROL);

prompt
prompt Creating table T_ROL_PARAMETROS
prompt ===============================
prompt
create table POLISCRUM.T_ROL_PARAMETROS
(
  id_rol       NUMBER(3) not null,
  id_parametro VARCHAR2(50) not null,
  consultar    CHAR(1) default 'N',
  insertar     CHAR(1) default 'N',
  actualizar   CHAR(1) default 'N',
  eliminar     CHAR(1) default 'N'
)
;
comment on table POLISCRUM.T_ROL_PARAMETROS
  is 'Parametros por Rol';
alter table POLISCRUM.T_ROL_PARAMETROS
  add constraint PK_ROL_PARAMETROS primary key (ID_ROL, ID_PARAMETRO);
alter table POLISCRUM.T_ROL_PARAMETROS
  add constraint FK_ROL_PARAMETROS_PARAMETROS foreign key (ID_PARAMETRO)
  references POLISCRUM.T_PARAMETROS (ID_PARAMETRO);
alter table POLISCRUM.T_ROL_PARAMETROS
  add constraint FK_ROL_PARAMETROS_ROLES foreign key (ID_ROL)
  references POLISCRUM.T_ROLES (ID_ROL);

prompt
prompt Creating table T_USUARIOS
prompt =========================
prompt
create table POLISCRUM.T_USUARIOS
(
  id_usuario           NUMBER(10) not null,
  alias                VARCHAR2(30),
  id_persona           NUMBER(10),
  estado               CHAR(1),
  avatar               BLOB,
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_USUARIOS
  is 'Usuarios';
comment on column POLISCRUM.T_USUARIOS.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_USUARIOS.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_USUARIOS.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_USUARIOS.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_USUARIOS
  add constraint PK_USUARIOS primary key (ID_USUARIO);
alter table POLISCRUM.T_USUARIOS
  add constraint UK_USUARIOS_ALIAS unique (ALIAS);
alter table POLISCRUM.T_USUARIOS
  add constraint FK_USUARIOS_PERSONAS foreign key (ID_PERSONA)
  references POLISCRUM.T_PERSONAS (ID_PERSONA);

prompt
prompt Creating table T_ROL_USUARIOS
prompt =============================
prompt
create table POLISCRUM.T_ROL_USUARIOS
(
  id_rol               NUMBER(3) not null,
  id_usuario           NUMBER(10) not null,
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_ROL_USUARIOS
  is 'Usuarios por Rol';
comment on column POLISCRUM.T_ROL_USUARIOS.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_ROL_USUARIOS.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_ROL_USUARIOS.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_ROL_USUARIOS.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_ROL_USUARIOS
  add constraint PK_ROL_USUARIOS primary key (ID_ROL, ID_USUARIO);
alter table POLISCRUM.T_ROL_USUARIOS
  add constraint FK_ROL_USUARIOS_ROLES foreign key (ID_ROL)
  references POLISCRUM.T_ROLES (ID_ROL);
alter table POLISCRUM.T_ROL_USUARIOS
  add constraint FK_ROL_USUARIOS_USUARIOS foreign key (ID_USUARIO)
  references POLISCRUM.T_USUARIOS (ID_USUARIO);

prompt
prompt Creating table T_SERVICIOS
prompt ==========================
prompt
create table POLISCRUM.T_SERVICIOS
(
  id_servicio          NUMBER(3) not null,
  nombre               VARCHAR2(100),
  tipo                 CHAR(1),
  activo               CHAR(1),
  clave                VARCHAR2(50),
  detalle              VARCHAR2(2000),
  version_actual       VARCHAR2(10),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_SERVICIOS
  is 'Servicios Web';
comment on column POLISCRUM.T_SERVICIOS.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_SERVICIOS.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_SERVICIOS.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_SERVICIOS.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_SERVICIOS
  add constraint PK_SERVICIOS primary key (ID_SERVICIO);

prompt
prompt Creating table T_SESIONES
prompt =========================
prompt
create table POLISCRUM.T_SESIONES
(
  id_sesion           NUMBER not null,
  token               VARCHAR2(300),
  estado              CHAR(1),
  id_aplicacion       VARCHAR2(5),
  fecha_autenticacion DATE,
  fecha_expiracion    DATE,
  id_usuario          NUMBER(10),
  direccion_ip        VARCHAR2(50),
  host                VARCHAR2(50),
  terminal            VARCHAR2(50)
)
;
comment on table POLISCRUM.T_SESIONES
  is 'Sesiones';
alter table POLISCRUM.T_SESIONES
  add constraint PK_SESIONES primary key (ID_SESION);
alter table POLISCRUM.T_SESIONES
  add constraint FK_SESIONES_APLICACIONES foreign key (ID_APLICACION)
  references POLISCRUM.T_APLICACIONES (ID_APLICACION);
alter table POLISCRUM.T_SESIONES
  add constraint FK_SESIONES_USUARIOS foreign key (ID_USUARIO)
  references POLISCRUM.T_USUARIOS (ID_USUARIO);

prompt
prompt Creating table T_SIGNIFICADOS
prompt =============================
prompt
create table POLISCRUM.T_SIGNIFICADOS
(
  dominio              VARCHAR2(50) not null,
  codigo               VARCHAR2(30) not null,
  significado          VARCHAR2(300),
  referencia           VARCHAR2(50),
  activo               CHAR(1),
  usuario_insercion    VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_insercion      DATE default SYSDATE,
  usuario_modificacion VARCHAR2(10) default SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE default SYSDATE
)
;
comment on table POLISCRUM.T_SIGNIFICADOS
  is 'Significados';
comment on column POLISCRUM.T_SIGNIFICADOS.usuario_insercion
  is 'Usuario que realizo la insercion del registro';
comment on column POLISCRUM.T_SIGNIFICADOS.fecha_insercion
  is 'Fecha en que se realizo la insercion del registro';
comment on column POLISCRUM.T_SIGNIFICADOS.usuario_modificacion
  is 'Usuario que realizo la ultima modificacion en el registro';
comment on column POLISCRUM.T_SIGNIFICADOS.fecha_modificacion
  is 'Fecha en que se realizo la ultima modificacion en el registro';
alter table POLISCRUM.T_SIGNIFICADOS
  add constraint PK_SIGNIFICADOS primary key (DOMINIO, CODIGO);

prompt
prompt Creating table T_SISTEMAS
prompt =========================
prompt
create table POLISCRUM.T_SISTEMAS
(
  id_sistema     VARCHAR2(5) not null,
  nombre         VARCHAR2(100),
  detalle        VARCHAR2(2000),
  activo         CHAR(1),
  fecha_actual   DATE,
  version_actual VARCHAR2(10)
)
;
comment on table POLISCRUM.T_SISTEMAS
  is 'Sistemas';
alter table POLISCRUM.T_SISTEMAS
  add constraint PK_SISTEMAS primary key (ID_SISTEMA);

prompt
prompt Creating table T_USUARIO_CLAVES
prompt ===============================
prompt
create table POLISCRUM.T_USUARIO_CLAVES
(
  id_usuario                 NUMBER(10) not null,
  tipo                       CHAR(1) not null,
  estado                     CHAR(1),
  hash                       VARCHAR2(500),
  salt                       VARCHAR2(500),
  algoritmo                  VARCHAR2(30),
  cantidad_intentos_fallidos NUMBER(3),
  iteraciones                NUMBER(10),
  fecha_ultima_autenticacion DATE
)
;
comment on table POLISCRUM.T_USUARIO_CLAVES
  is 'Claves por Usuario';
alter table POLISCRUM.T_USUARIO_CLAVES
  add constraint PK_USUARIO_CLAVES primary key (ID_USUARIO, TIPO);
alter table POLISCRUM.T_USUARIO_CLAVES
  add constraint FK_USUARIO_CLAVES_USUARIOS foreign key (ID_USUARIO)
  references POLISCRUM.T_USUARIOS (ID_USUARIO);

prompt
prompt Creating sequence S_ID_CIUDAD
prompt =============================
prompt
create sequence POLISCRUM.S_ID_CIUDAD
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_PAIS
prompt ===========================
prompt
create sequence POLISCRUM.S_ID_PAIS
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_PERSONA
prompt ==============================
prompt
create sequence POLISCRUM.S_ID_PERSONA
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_ROL
prompt ==========================
prompt
create sequence POLISCRUM.S_ID_ROL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_SERVICIO
prompt ===============================
prompt
create sequence POLISCRUM.S_ID_SERVICIO
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_SESION
prompt =============================
prompt
create sequence POLISCRUM.S_ID_SESION
minvalue 1
maxvalue 9999999999999999999999999999
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence S_ID_USUARIO
prompt ==============================
prompt
create sequence POLISCRUM.S_ID_USUARIO
minvalue 1
maxvalue 9999999999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating package K_AUDITORIA
prompt ============================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_auditoria IS

  -- Agrupa operaciones relacionadas con la auditoria de tablas
  --
  -- %author jmeza 5/1/2019 21:42:37

  -- Genera campos de auditoria para una tabla
  --
  -- %param i_tabla Tabla
  PROCEDURE p_generar_campos_auditoria(i_tabla IN VARCHAR2);

  -- Genera trigger de auditoria para una tabla
  --
  -- %param i_tabla Tabla
  -- %param i_trigger Trigger
  PROCEDURE p_generar_trigger_auditoria(i_tabla   IN VARCHAR2,
                                        i_trigger IN VARCHAR2 DEFAULT NULL);

END;
/

prompt
prompt Creating package K_AUTENTICACION
prompt ================================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_autenticacion IS

  -- Agrupa operaciones relacionadas con la autenticacion de usuarios
  --
  -- %author jmeza 11/3/2019 23:24:54

  PROCEDURE p_registrar_usuario(i_usuario IN VARCHAR2,
                                i_clave   IN VARCHAR2);

  PROCEDURE p_cambiar_clave(i_usuario       IN VARCHAR2,
                            i_clave_antigua IN VARCHAR2,
                            i_clave_nueva   IN VARCHAR2);

  FUNCTION f_validar_credenciales(i_usuario IN VARCHAR2,
                                  i_clave   IN VARCHAR2) RETURN BOOLEAN;

  PROCEDURE p_validar_credenciales(i_usuario IN VARCHAR2,
                                   i_clave   IN VARCHAR2);

  PROCEDURE p_iniciar_sesion(i_usuario IN VARCHAR2,
                             i_token   IN VARCHAR2);

  PROCEDURE p_finalizar_sesion(i_id_sesion IN NUMBER);
END;
/

prompt
prompt Creating package K_ERROR
prompt ========================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_error IS

  -- Agrupa operaciones relacionadas con los errores del sistema
  --
  -- %author jmeza 25/3/2019 21:04:47

  -- Tipos de error
  oracle_predefined_error CONSTANT VARCHAR2(3) := 'OPE';
  user_defined_error      CONSTANT VARCHAR2(3) := 'UDE';

  FUNCTION f_tipo_error(i_sqlcode IN NUMBER) RETURN VARCHAR2;

  -- Retorna el mensaje de un error de BD
  --
  -- %param i_sqlerrm Mensaje de error de BD
  -- %param i_sqlcode Codigo de error de BD
  -- %return Mensaje de error
  FUNCTION f_mensaje_error(i_sqlerrm IN VARCHAR2,
                           i_sqlcode IN NUMBER DEFAULT NULL) RETURN VARCHAR2;

END;
/

prompt
prompt Creating package K_SERVICIO
prompt ===========================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_servicio IS

  -- Agrupa operaciones relacionadas con la API del sistema
  --
  -- %author jmeza 17/3/2019 15:23:21

  FUNCTION api_validar_credenciales(i_usuario IN VARCHAR2,
                                    i_clave   IN VARCHAR2) RETURN CLOB;

  FUNCTION api_iniciar_sesion(i_usuario IN VARCHAR2,
                              i_token   IN VARCHAR2) RETURN CLOB;

  FUNCTION api_finalizar_sesion(i_id_sesion IN NUMBER) RETURN CLOB;

END;
/

prompt
prompt Creating package K_SISTEMA
prompt ==========================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_sistema IS

  -- Agrupa operaciones relacionadas con los parametros de sistema
  --
  -- %author jmeza 5/1/2019 19:48:32

  -- Retorna el valor de un parametro de sistema, si no existe retorna null
  --
  -- %param i_parametro Nombre del parametro de sistema
  -- %return Valor del parametro de sistema
  -- %raises <exception> 
  FUNCTION f_valor_parametro(i_parametro IN VARCHAR2) RETURN VARCHAR2;

  -- Define el valor de un parametro de sistema
  --
  -- %param i_parametro Nombre del parametro de sistema
  -- %param i_valor Valor del parametro de sistema
  -- %raises <exception> 
  PROCEDURE p_definir_parametro(i_parametro IN VARCHAR2,
                                i_valor     IN VARCHAR2);

  -- Define el valor de todos los parametros de sistema a null
  --
  -- %raises <exception> 
  PROCEDURE p_limpiar_parametros;

  -- Elimina todos los parametros de sistema definidos
  --
  -- %raises <exception> 
  PROCEDURE p_eliminar_parametros;

  -- Imprime todos los parametros de sistema definidos
  --
  -- %raises <exception> 
  PROCEDURE p_imprimir_parametros;

END;
/

prompt
prompt Creating package K_UTIL
prompt =======================
prompt
CREATE OR REPLACE PACKAGE POLISCRUM.k_util IS

  -- Agrupa herramientas para facilitar el desarrollo
  --
  -- %author jmeza 5/1/2019 21:42:37

  -- Genera trigger de secuencia para un campo de una tabla
  --
  -- %param i_tabla Tabla
  -- %param i_campo Campo
  -- %param i_trigger Trigger
  PROCEDURE p_generar_trigger_secuencia(i_tabla   IN VARCHAR2,
                                        i_campo   IN VARCHAR2,
                                        i_trigger IN VARCHAR2 DEFAULT NULL);

  -- Retorna el valor que se encuenta en la posicion indicada dentro de una cadena
  -- Si la posicion se encuentra fuera de rango retorna el valor mas cercano (primer valor o ultimo valor)
  --
  -- %param i_cadena Cadena
  -- %param i_posicion Posicion dentro de la cadena
  -- %param i_separador Caracter separador. Por defecto '~'
  -- %return Valor que se encuenta en la posicion indicada
  FUNCTION f_valor_posicion(i_cadena    IN VARCHAR2,
                            i_posicion  IN NUMBER,
                            i_separador IN VARCHAR2 DEFAULT '~')
    RETURN VARCHAR2;

  FUNCTION f_reemplazar_acentos(i_cadena IN VARCHAR2) RETURN VARCHAR2;

  -- Retorna el significado de un codigo dentro de un dominio 
  --
  -- %param i_dominio Dominio
  -- %param i_codigo Codigo
  -- %return Significado
  FUNCTION f_significado_codigo(i_dominio IN VARCHAR2,
                                i_codigo  IN VARCHAR2) RETURN VARCHAR2;

  FUNCTION f_base_datos RETURN VARCHAR2;

  FUNCTION f_terminal RETURN VARCHAR2;

  FUNCTION f_host RETURN VARCHAR2;

  FUNCTION f_direccion_ip RETURN VARCHAR2;

END;
/

prompt
prompt Creating type Y_PROYECTO
prompt ========================
prompt
CREATE OR REPLACE TYPE POLISCRUM.y_proyecto force AS OBJECT
(
-- Author  : JAVIE
-- Created : 12/4/2019 19:44:25
-- Purpose :

-- Attributes
  id_proyecto        NUMBER(5),
  nombre             VARCHAR2(200),
  id_estado          NUMBER(3),
  descripcion_estado VARCHAR2(100),
  fecha_inicio       DATE,
  fecha_fin_estimado DATE,
  fecha_fin          DATE,

-- Member functions and procedures
  CONSTRUCTOR FUNCTION y_proyecto RETURN SELF AS RESULT,
  MEMBER FUNCTION to_json RETURN CLOB
)
/

prompt
prompt Creating type Y_PROYECTOS
prompt =========================
prompt
CREATE OR REPLACE TYPE POLISCRUM.y_proyectos IS TABLE OF y_proyecto
/

prompt
prompt Creating type Y_RESPUESTA
prompt =========================
prompt
CREATE OR REPLACE TYPE POLISCRUM.y_respuesta AS OBJECT
(
-- Agrupa datos de respuesta de un proceso
--
-- %author jmeza 9/3/2019 16:28:00

  codigo     VARCHAR2(10), -- Codigo de la respuesta
  mensaje    VARCHAR2(2000), -- Mensaje de la respuesta
  mensaje_bd VARCHAR2(2000), -- Mensaje de Base de Datos
  origen     VARCHAR2(500), -- Origen de la respuesta
  datos      CLOB, -- Datos

  CONSTRUCTOR FUNCTION y_respuesta RETURN SELF AS RESULT,
  MEMBER FUNCTION to_json RETURN CLOB
)
/

prompt
prompt Creating package body K_AUDITORIA
prompt =================================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_auditoria IS

  PROCEDURE p_generar_campos_auditoria(i_tabla IN VARCHAR2) IS
    l_sentencia VARCHAR2(1000) := '';
  BEGIN
    -- Genera campos
    l_sentencia := 'alter table ' || i_tabla || ' add
(
  usuario_insercion    VARCHAR2(10) DEFAULT SUBSTR(USER, 1, 10),
  fecha_insercion      DATE DEFAULT SYSDATE,
  usuario_modificacion VARCHAR2(10) DEFAULT SUBSTR(USER, 1, 10),
  fecha_modificacion   DATE DEFAULT SYSDATE
)';
    EXECUTE IMMEDIATE l_sentencia;
  
    -- Genera comentarios
    l_sentencia := 'comment on column ' || i_tabla ||
                   '.usuario_insercion is ''Usuario que realizo la insercion del registro''';
    EXECUTE IMMEDIATE l_sentencia;
  
    l_sentencia := 'comment on column ' || i_tabla ||
                   '.fecha_insercion is ''Fecha en que se realizo la insercion del registro''';
    EXECUTE IMMEDIATE l_sentencia;
  
    l_sentencia := 'comment on column ' || i_tabla ||
                   '.usuario_modificacion is ''Usuario que realizo la ultima modificacion en el registro''';
    EXECUTE IMMEDIATE l_sentencia;
  
    l_sentencia := 'comment on column ' || i_tabla ||
                   '.fecha_modificacion is ''Fecha en que se realizo la ultima modificacion en el registro''';
    EXECUTE IMMEDIATE l_sentencia;
  END;

  PROCEDURE p_generar_trigger_auditoria(i_tabla   IN VARCHAR2,
                                        i_trigger IN VARCHAR2 DEFAULT NULL) IS
    l_sentencia VARCHAR2(1000) := '';
    l_trigger   VARCHAR2(30);
  BEGIN
    l_trigger := lower(nvl(i_trigger, 'ga_' || substr(i_tabla, 3)));
  
    -- Genera trigger
    l_sentencia := 'CREATE OR REPLACE TRIGGER ' || l_trigger || '
  BEFORE DELETE OR INSERT OR UPDATE ON ' ||
                   lower(i_tabla) || '
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;';
  
    EXECUTE IMMEDIATE l_sentencia;
  END;

BEGIN
  -- Initialization
  NULL;
END;
/

prompt
prompt Creating package body K_AUTENTICACION
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_autenticacion IS

  c_algoritmo      CONSTANT PLS_INTEGER := sys.dbms_crypto.hmac_sh1;
  c_iteraciones    CONSTANT PLS_INTEGER := 4096;
  c_longitud_bytes CONSTANT PLS_INTEGER := 32;

  c_clave_acceso CONSTANT CHAR(1) := 'A';

  cantidad_intentos_permitidos CONSTANT PLS_INTEGER := 3;

  -- Excepciones
  ex_credenciales_invalidas EXCEPTION;
  ex_usuario_inexistente    EXCEPTION;

  -- https://mikepargeter.wordpress.com/2012/11/26/pbkdf2-in-oracle
  -- https://www.ietf.org/rfc/rfc6070.txt
  FUNCTION pbkdf2(p_password   IN VARCHAR2,
                  p_salt       IN VARCHAR2,
                  p_count      IN INTEGER,
                  p_key_length IN INTEGER) RETURN VARCHAR2 IS
    l_block_count INTEGER;
    l_last        RAW(32767);
    l_xorsum      RAW(32767);
    l_result      RAW(32767);
  BEGIN
    -- SHA-1   ==> 20 bytes
    -- SHA-256 ==> 32 bytes
    l_block_count := ceil(p_key_length / 20);
    FOR i IN 1 .. l_block_count LOOP
      l_last   := utl_raw.concat(utl_raw.cast_to_raw(p_salt),
                                 utl_raw.cast_from_binary_integer(i,
                                                                  utl_raw.big_endian));
      l_xorsum := NULL;
      FOR j IN 1 .. p_count LOOP
        l_last := sys.dbms_crypto.mac(l_last,
                                      c_algoritmo,
                                      utl_raw.cast_to_raw(p_password));
        IF l_xorsum IS NULL THEN
          l_xorsum := l_last;
        ELSE
          l_xorsum := utl_raw.bit_xor(l_xorsum, l_last);
        END IF;
      END LOOP;
      l_result := utl_raw.concat(l_result, l_xorsum);
    END LOOP;
    RETURN rawtohex(utl_raw.substr(l_result, 1, p_key_length));
  END;

  FUNCTION lf_id_usuario(i_alias IN VARCHAR2) RETURN NUMBER IS
    l_id_usuario t_usuarios.id_usuario%TYPE;
  BEGIN
    BEGIN
      SELECT id_usuario
        INTO l_id_usuario
        FROM t_usuarios
       WHERE alias = i_alias;
    EXCEPTION
      WHEN no_data_found THEN
        l_id_usuario := NULL;
      WHEN OTHERS THEN
        l_id_usuario := NULL;
    END;
    RETURN l_id_usuario;
  END;

  PROCEDURE lp_registrar_intento_fallido(i_id_usuario IN NUMBER,
                                         i_tipo       IN CHAR) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    UPDATE t_usuario_claves
       SET cantidad_intentos_fallidos = CASE
                                          WHEN nvl(cantidad_intentos_fallidos,
                                                   0) >=
                                               cantidad_intentos_permitidos THEN
                                           cantidad_intentos_fallidos
                                          ELSE
                                           nvl(cantidad_intentos_fallidos, 0) + 1
                                        END,
           estado = CASE
                      WHEN nvl(cantidad_intentos_fallidos, 0) >=
                           cantidad_intentos_permitidos THEN
                       'B'
                      ELSE
                       estado
                    END
     WHERE id_usuario = i_id_usuario
       AND tipo = i_tipo;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
  END;

  PROCEDURE lp_registrar_autenticacion(i_id_usuario IN NUMBER,
                                       i_tipo       IN CHAR) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    UPDATE t_usuario_claves
       SET cantidad_intentos_fallidos = 0,
           fecha_ultima_autenticacion = SYSDATE
     WHERE id_usuario = i_id_usuario
       AND tipo = i_tipo;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
  END;

  PROCEDURE p_registrar_usuario(i_usuario IN VARCHAR2,
                                i_clave   IN VARCHAR2) IS
    l_id_usuario t_usuarios.id_usuario%TYPE;
    l_hash       t_usuario_claves.hash%TYPE;
    l_salt       t_usuario_claves.salt%TYPE;
  BEGIN
    -- Genera salt
    l_salt := rawtohex(sys.dbms_crypto.randombytes(c_longitud_bytes));
    -- Genera hash
    l_hash := pbkdf2(i_clave, l_salt, c_iteraciones, c_longitud_bytes);
  
    -- Inserta usuario
    INSERT INTO t_usuarios
      (alias, estado)
    VALUES
      (i_usuario, 'A')
    RETURNING id_usuario INTO l_id_usuario;
  
    -- Inserta clave de usuario
    INSERT INTO t_usuario_claves c
      (id_usuario,
       tipo,
       estado,
       HASH,
       salt,
       algoritmo,
       iteraciones,
       cantidad_intentos_fallidos,
       fecha_ultima_autenticacion)
    VALUES
      (l_id_usuario,
       c_clave_acceso,
       'A',
       l_hash,
       l_salt,
       c_algoritmo,
       c_iteraciones,
       0,
       SYSDATE);
  END;

  PROCEDURE p_cambiar_clave(i_usuario       IN VARCHAR2,
                            i_clave_antigua IN VARCHAR2,
                            i_clave_nueva   IN VARCHAR2) IS
    l_id_usuario t_usuarios.id_usuario%TYPE;
    l_hash       t_usuario_claves.hash%TYPE;
    l_salt       t_usuario_claves.salt%TYPE;
  BEGIN
    -- Busca usuario
    l_id_usuario := lf_id_usuario(i_usuario);
  
    IF l_id_usuario IS NULL THEN
      RAISE ex_usuario_inexistente;
    END IF;
  
    IF NOT f_validar_credenciales(i_usuario, i_clave_antigua) THEN
      RAISE ex_credenciales_invalidas;
    END IF;
  
    -- Genera salt
    l_salt := rawtohex(sys.dbms_crypto.randombytes(c_longitud_bytes));
    -- Genera hash
    l_hash := pbkdf2(i_clave_nueva, l_salt, c_iteraciones, c_longitud_bytes);
  
    -- Actualiza clave de usuario
    UPDATE t_usuario_claves
       SET HASH                       = l_hash,
           salt                       = l_salt,
           algoritmo                  = c_algoritmo,
           iteraciones                = c_iteraciones,
           cantidad_intentos_fallidos = 0,
           fecha_ultima_autenticacion = SYSDATE
     WHERE id_usuario = l_id_usuario
       AND tipo = c_clave_acceso
       AND estado = 'A';
    IF SQL%NOTFOUND THEN
      RAISE ex_credenciales_invalidas;
    END IF;
  EXCEPTION
    WHEN ex_usuario_inexistente THEN
      raise_application_error(-20000, 'Credenciales invalidas');
    WHEN ex_credenciales_invalidas THEN
      lp_registrar_intento_fallido(l_id_usuario, c_clave_acceso);
      raise_application_error(-20000, 'Credenciales invalidas');
    WHEN OTHERS THEN
      lp_registrar_intento_fallido(l_id_usuario, c_clave_acceso);
      raise_application_error(-20000, 'Credenciales invalidas');
  END;

  FUNCTION f_validar_credenciales(i_usuario IN VARCHAR2,
                                  i_clave   IN VARCHAR2) RETURN BOOLEAN IS
    l_id_usuario  t_usuarios.id_usuario%TYPE;
    l_hash        t_usuario_claves.hash%TYPE;
    l_salt        t_usuario_claves.salt%TYPE;
    l_iteraciones t_usuario_claves.iteraciones%TYPE;
  BEGIN
    -- Busca usuario
    l_id_usuario := lf_id_usuario(i_usuario);
  
    IF l_id_usuario IS NULL THEN
      RAISE ex_usuario_inexistente;
    END IF;
  
    BEGIN
      SELECT c.hash, c.salt, c.iteraciones
        INTO l_hash, l_salt, l_iteraciones
        FROM t_usuario_claves c
       WHERE c.id_usuario = l_id_usuario
         AND c.tipo = c_clave_acceso
         AND c.estado = 'A';
    EXCEPTION
      WHEN OTHERS THEN
        RAISE ex_credenciales_invalidas;
    END;
  
    IF l_hash <> pbkdf2(i_clave,
                        l_salt,
                        l_iteraciones,
                        utl_raw.length(hextoraw(l_hash))) THEN
      RAISE ex_credenciales_invalidas;
    END IF;
  
    lp_registrar_autenticacion(l_id_usuario, c_clave_acceso);
    RETURN TRUE;
  EXCEPTION
    WHEN ex_usuario_inexistente THEN
      RETURN FALSE;
    WHEN ex_credenciales_invalidas THEN
      lp_registrar_intento_fallido(l_id_usuario, c_clave_acceso);
      RETURN FALSE;
    WHEN OTHERS THEN
      lp_registrar_intento_fallido(l_id_usuario, c_clave_acceso);
      RETURN FALSE;
  END;

  PROCEDURE p_validar_credenciales(i_usuario IN VARCHAR2,
                                   i_clave   IN VARCHAR2) IS
  BEGIN
    IF NOT f_validar_credenciales(i_usuario, i_clave) THEN
      raise_application_error(-20000, 'Credenciales invalidas');
    END IF;
  END;

  PROCEDURE p_iniciar_sesion(i_usuario IN VARCHAR2,
                             i_token   IN VARCHAR2) IS
    l_id_usuario t_usuarios.id_usuario%TYPE;
    l_cantidad   NUMBER(3);
  BEGIN
    -- Busca usuario
    l_id_usuario := lf_id_usuario(i_usuario);
  
    IF l_id_usuario IS NULL THEN
      RAISE ex_usuario_inexistente;
    END IF;
  
    -- Obtiene cantidad de sesiones del usuario
    SELECT COUNT(id_sesion)
      INTO l_cantidad
      FROM t_sesiones
     WHERE estado = 'A'
       AND id_usuario = l_id_usuario;
  
    IF l_cantidad > 0 THEN
      raise_application_error(-20000, 'Usuario tiene una sesion activa');
    END IF;
  
    -- Inserta sesion
    INSERT INTO t_sesiones
      (token,
       estado,
       id_aplicacion,
       fecha_autenticacion,
       fecha_expiracion,
       id_usuario,
       direccion_ip,
       host,
       terminal)
    VALUES
      (i_token,
       'A',
       NULL,
       SYSDATE,
       NULL,
       l_id_usuario,
       k_util.f_direccion_ip,
       k_util.f_host,
       k_util.f_terminal);
  EXCEPTION
    WHEN ex_usuario_inexistente THEN
      raise_application_error(-20000, 'Usuario inexistente');
  END;

  PROCEDURE p_finalizar_sesion(i_id_sesion IN NUMBER) IS
  BEGIN
    UPDATE t_sesiones SET estado = 'F' WHERE id_sesion = i_id_sesion;
  END;

BEGIN
  -- Initialization
  NULL;
END;
/

prompt
prompt Creating package body K_ERROR
prompt =============================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_error IS

  FUNCTION f_tipo_error(i_sqlcode IN NUMBER) RETURN VARCHAR2 IS
    l_tipo_error VARCHAR2(3);
  BEGIN
    IF i_sqlcode >= -20999 AND i_sqlcode <= -20000 THEN
      l_tipo_error := user_defined_error;
    ELSE
      l_tipo_error := oracle_predefined_error;
    END IF;
    RETURN l_tipo_error;
  END;

  FUNCTION f_mensaje_error(i_sqlerrm IN VARCHAR2,
                           i_sqlcode IN NUMBER DEFAULT NULL) RETURN VARCHAR2 IS
    l_posicion NUMBER := instr(i_sqlerrm, 'ORA-', 1, 2);
  BEGIN
    IF l_posicion > 12 THEN
      RETURN REPLACE(substr(REPLACE(i_sqlerrm, '"', ' '),
                            1,
                            l_posicion - 2),
                     'ORA' || to_char(nvl(i_sqlcode, -20000)) || ':',
                     '');
    ELSE
      RETURN TRIM(REPLACE(REPLACE(i_sqlerrm, '"', ' '),
                          'ORA' || to_char(nvl(i_sqlcode, -20000)) || ':'));
    END IF;
  END;

BEGIN
  -- Initialization
  NULL;
END;
/

prompt
prompt Creating package body K_SERVICIO
prompt ================================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_servicio IS

  -- Excepciones
  ex_api_error EXCEPTION;

  FUNCTION lf_mensaje_error(i_id_error IN VARCHAR2) RETURN VARCHAR2 IS
    l_mensaje t_errores.mensaje%TYPE;
  BEGIN
    BEGIN
      SELECT mensaje
        INTO l_mensaje
        FROM t_errores
       WHERE id_error = i_id_error;
    EXCEPTION
      WHEN no_data_found THEN
        l_mensaje := 'Error no registrado';
    END;
    RETURN l_mensaje;
  END;

  PROCEDURE lp_respuesta_error(io_respuesta IN OUT y_respuesta,
                               i_codigo     IN VARCHAR2,
                               i_mensaje    IN VARCHAR2,
                               i_mensaje_bd IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF i_codigo = '0' THEN
      io_respuesta.codigo  := '999';
      io_respuesta.mensaje := lf_mensaje_error(io_respuesta.codigo);
    ELSE
      io_respuesta.codigo  := substr(i_codigo, 1, 10);
      io_respuesta.mensaje := substr(i_mensaje, 1, 2000);
    END IF;
    io_respuesta.mensaje_bd := substr(i_mensaje_bd, 1, 2000);
    io_respuesta.datos      := NULL;
  END;

  PROCEDURE lp_respuesta_ok(io_respuesta IN OUT y_respuesta,
                            i_datos      IN CLOB DEFAULT NULL) IS
  BEGIN
    io_respuesta.codigo     := '0';
    io_respuesta.mensaje    := 'OK';
    io_respuesta.mensaje_bd := NULL;
    io_respuesta.datos      := i_datos;
  END;

  FUNCTION lf_validar_credenciales(i_usuario IN VARCHAR2,
                                   i_clave   IN VARCHAR2) RETURN y_respuesta IS
    resp y_respuesta;
  BEGIN
    -- Inicializa respuesta
    resp := NEW y_respuesta();
  
    resp.origen := 'Validando parametros';
    IF i_usuario IS NULL THEN
      lp_respuesta_error(resp, '1', 'Debe ingresar usuario');
      RAISE ex_api_error;
    END IF;
  
    IF i_clave IS NULL THEN
      lp_respuesta_error(resp, '2', 'Debe ingresar clave');
      RAISE ex_api_error;
    END IF;
  
    resp.origen := 'Validando credenciales';
    IF NOT k_autenticacion.f_validar_credenciales(i_usuario, i_clave) THEN
      lp_respuesta_error(resp, '3', 'Credenciales invalidas');
      RAISE ex_api_error;
    END IF;
  
    lp_respuesta_ok(resp);
    RETURN resp;
  EXCEPTION
    WHEN ex_api_error THEN
      RETURN resp;
    WHEN OTHERS THEN
      lp_respuesta_error(resp, '999', lf_mensaje_error('999'), SQLERRM);
      RETURN resp;
  END;

  FUNCTION api_validar_credenciales(i_usuario IN VARCHAR2,
                                    i_clave   IN VARCHAR2) RETURN CLOB IS
  
    l_resp CLOB;
  BEGIN
    -- Proceso
    l_resp := lf_validar_credenciales(i_usuario, i_clave).to_json;
    RETURN l_resp;
  END;

  FUNCTION lf_iniciar_sesion(i_usuario IN VARCHAR2,
                             i_token   IN VARCHAR2) RETURN y_respuesta IS
    resp y_respuesta;
  BEGIN
    -- Inicializa respuesta
    resp := NEW y_respuesta();
  
    resp.origen := 'Validando parametros';
    IF i_usuario IS NULL THEN
      lp_respuesta_error(resp, '1', 'Debe ingresar usuario');
      RAISE ex_api_error;
    END IF;
  
    IF i_token IS NULL THEN
      lp_respuesta_error(resp, '2', 'Debe ingresar token');
      RAISE ex_api_error;
    END IF;
  
    resp.origen := 'Iniciando sesion';
    k_autenticacion.p_iniciar_sesion(i_usuario, i_token);
  
    lp_respuesta_ok(resp);
    RETURN resp;
  EXCEPTION
    WHEN ex_api_error THEN
      RETURN resp;
    WHEN OTHERS THEN
      IF k_error.f_tipo_error(SQLCODE) = k_error.user_defined_error THEN
        lp_respuesta_error(resp,
                           '998',
                           k_error.f_mensaje_error(SQLERRM, SQLCODE),
                           SQLERRM);
      ELSE
        lp_respuesta_error(resp, '999', lf_mensaje_error('999'), SQLERRM);
      END IF;
      RETURN resp;
  END;

  FUNCTION api_iniciar_sesion(i_usuario IN VARCHAR2,
                              i_token   IN VARCHAR2) RETURN CLOB IS
    l_resp CLOB;
  BEGIN
    -- Proceso
    l_resp := lf_iniciar_sesion(i_usuario, i_token).to_json;
    RETURN l_resp;
  END;

  FUNCTION lf_finalizar_sesion(i_id_sesion IN NUMBER) RETURN y_respuesta IS
    resp y_respuesta;
  BEGIN
    -- Inicializa respuesta
    resp := NEW y_respuesta();
  
    resp.origen := 'Validando parametros';
    IF i_id_sesion IS NULL THEN
      lp_respuesta_error(resp, '1', 'Debe ingresar id_sesion');
      RAISE ex_api_error;
    END IF;
  
    resp.origen := 'Finalizando sesion';
    k_autenticacion.p_finalizar_sesion(i_id_sesion);
  
    lp_respuesta_ok(resp);
    RETURN resp;
  EXCEPTION
    WHEN ex_api_error THEN
      RETURN resp;
    WHEN OTHERS THEN
      IF k_error.f_tipo_error(SQLCODE) = k_error.user_defined_error THEN
        lp_respuesta_error(resp,
                           '998',
                           k_error.f_mensaje_error(SQLERRM, SQLCODE),
                           SQLERRM);
      ELSE
        lp_respuesta_error(resp, '999', lf_mensaje_error('999'), SQLERRM);
      END IF;
      RETURN resp;
  END;

  FUNCTION api_finalizar_sesion(i_id_sesion IN NUMBER) RETURN CLOB IS
    l_resp CLOB;
  BEGIN
    -- Proceso
    l_resp := lf_finalizar_sesion(i_id_sesion).to_json;
    RETURN l_resp;
  END;

BEGIN
  -- Initialization
  NULL;
END;
/

prompt
prompt Creating package body K_SISTEMA
prompt ===============================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_sistema IS

  TYPE ly_parametros IS TABLE OF VARCHAR2(50) INDEX BY VARCHAR2(30);

  g_parametros ly_parametros;
  g_indice     VARCHAR2(30);

  FUNCTION f_valor_parametro(i_parametro IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF g_parametros.exists(i_parametro) THEN
      RETURN g_parametros(i_parametro);
    ELSE
      RETURN NULL;
    END IF;
  END;

  PROCEDURE p_definir_parametro(i_parametro IN VARCHAR2,
                                i_valor     IN VARCHAR2) IS
  BEGIN
    g_parametros(i_parametro) := substr(i_valor, 1, 50);
  END;

  PROCEDURE p_limpiar_parametros IS
  BEGIN
    g_indice := g_parametros.first;
    WHILE g_indice IS NOT NULL LOOP
      g_parametros(g_indice) := NULL;
      g_indice := g_parametros.next(g_indice);
    END LOOP;
  END;

  PROCEDURE p_eliminar_parametros IS
  BEGIN
    g_parametros.delete;
  END;

  PROCEDURE p_imprimir_parametros IS
  BEGIN
    g_indice := g_parametros.first;
    WHILE g_indice IS NOT NULL LOOP
      dbms_output.put_line(g_indice || ': ' || g_parametros(g_indice));
      g_indice := g_parametros.next(g_indice);
    END LOOP;
  END;

BEGIN
  -- Inicializar parametros
  DECLARE
    l_nombre         t_sistemas.nombre%TYPE;
    l_version_actual t_sistemas.version_actual%TYPE;
    l_fecha_actual   t_sistemas.fecha_actual%TYPE;
  BEGIN
    SELECT nombre, version_actual, fecha_actual
      INTO l_nombre, l_version_actual, l_fecha_actual
      FROM t_sistemas
     WHERE id_sistema = 'POLISCRUM';
    p_definir_parametro('SISTEMA', l_nombre);
    p_definir_parametro('VERSION', l_version_actual);
    p_definir_parametro('FECHA', to_char(l_fecha_actual, 'YYYY-MM-DD'));
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
  p_definir_parametro('USUARIO', USER);
END;
/

prompt
prompt Creating package body K_UTIL
prompt ============================
prompt
CREATE OR REPLACE PACKAGE BODY POLISCRUM.k_util IS

  PROCEDURE p_generar_trigger_secuencia(i_tabla   IN VARCHAR2,
                                        i_campo   IN VARCHAR2,
                                        i_trigger IN VARCHAR2 DEFAULT NULL) IS
    l_sentencia VARCHAR2(1000) := '';
    l_trigger   VARCHAR2(30);
  BEGIN
    l_trigger := lower(nvl(i_trigger, 'gs_' || substr(i_tabla, 3)));
  
    -- Genera secuencia
    l_sentencia := 'CREATE SEQUENCE s_' || lower(i_campo);
    EXECUTE IMMEDIATE l_sentencia;
  
    -- Genera trigger
    l_sentencia := 'CREATE OR REPLACE TRIGGER ' || l_trigger || '
  BEFORE INSERT ON ' || lower(i_tabla) || '
  FOR EACH ROW
BEGIN
  SELECT s_' || lower(i_campo) || '.nextval INTO :new.' ||
                   lower(i_campo) || ' FROM dual;
END;';
  
    EXECUTE IMMEDIATE l_sentencia;
  END;

  FUNCTION f_valor_posicion(i_cadena    IN VARCHAR2,
                            i_posicion  IN NUMBER,
                            i_separador IN VARCHAR2 DEFAULT '~')
    RETURN VARCHAR2 IS
    l_valor           VARCHAR2(1000);
    l_posicion        NUMBER;
    l_separador       VARCHAR2(10);
    l_longitud_valor  NUMBER;
    l_posicion_inicio NUMBER;
    l_posicion_fin    NUMBER;
  BEGIN
    l_separador := i_separador;
  
    IF i_posicion > 0 THEN
      l_posicion := i_posicion;
    ELSE
      l_posicion := 1;
    END IF;
  
    -- Posicion del inicio del valor dentro de la cadena
    IF l_posicion > 1 THEN
      l_posicion_inicio := instr(i_cadena, l_separador, 1, l_posicion - 1);
      IF l_posicion_inicio = 0 THEN
        l_posicion_inicio := instr(i_cadena, l_separador, -1, 1);
      END IF;
      l_posicion_inicio := l_posicion_inicio + 1;
    ELSE
      l_posicion_inicio := 1;
    END IF;
  
    -- Posicion del fin del valor dentro de la cadena
    l_posicion_fin := instr(i_cadena, l_separador, 1, l_posicion);
  
    IF l_posicion_fin = 0 THEN
      l_valor := substr(i_cadena, l_posicion_inicio);
    ELSE
      l_longitud_valor := l_posicion_fin - l_posicion_inicio;
      l_valor          := substr(i_cadena,
                                 l_posicion_inicio,
                                 l_longitud_valor);
    END IF;
    RETURN l_valor;
  END;

  FUNCTION f_reemplazar_acentos(i_cadena IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN translate(i_cadena,
                     '·ÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚‰ÎÔˆ¸Á„ı¡…Õ”⁄¿»Ã“Ÿ¬ Œ‘€ƒÀœ÷‹«√’',
                     'aeiouaeiouaeiouaeioucaoAEIOUAEIOUAEIOUAEIOUCAO');
  END;

  FUNCTION f_significado_codigo(i_dominio IN VARCHAR2,
                                i_codigo  IN VARCHAR2) RETURN VARCHAR2 IS
    l_significado t_significados.significado%TYPE;
  BEGIN
    BEGIN
      SELECT a.significado
        INTO l_significado
        FROM t_significados a
       WHERE a.dominio = i_dominio
         AND a.codigo = i_codigo;
    EXCEPTION
      WHEN OTHERS THEN
        l_significado := NULL;
    END;
    RETURN l_significado;
  END;

  FUNCTION f_base_datos RETURN VARCHAR2 IS
  BEGIN
    RETURN sys_context('USERENV', 'DB_NAME');
  END;

  FUNCTION f_terminal RETURN VARCHAR2 IS
  BEGIN
    RETURN sys_context('USERENV', 'TERMINAL');
  END;

  FUNCTION f_host RETURN VARCHAR2 IS
  BEGIN
    RETURN sys_context('USERENV', 'HOST');
  END;

  FUNCTION f_direccion_ip RETURN VARCHAR2 IS
  BEGIN
    RETURN sys_context('USERENV', 'IP_ADDRESS');
  END;

BEGIN
  -- Initialization
  NULL;
END;
/

prompt
prompt Creating type body Y_PROYECTO
prompt =============================
prompt
CREATE OR REPLACE TYPE BODY POLISCRUM.y_proyecto IS
  CONSTRUCTOR FUNCTION y_proyecto RETURN SELF AS RESULT AS
  BEGIN
    RETURN;
  END;

  MEMBER FUNCTION to_json RETURN CLOB IS
    l_json CLOB;
  BEGIN
    l_json := '{';
    l_json := l_json || '"id_proyecto": "' || to_char(self.id_proyecto) ||
              '", ';
    l_json := l_json || '"nombre": "' || self.nombre || '", ';
    l_json := l_json || '"id_estado": "' || to_char(self.id_estado) ||
              '", ';
    l_json := l_json || '"descripcion_estado": "' ||
              self.descripcion_estado || '", ';
    l_json := l_json || '"fecha_inicio": "' ||
              to_char(self.fecha_inicio, 'YYYY-MM-DD') || '", ';
    l_json := l_json || '"fecha_fin_estimado": "' ||
              to_char(self.fecha_fin_estimado, 'YYYY-MM-DD') || '", ';
    l_json := l_json || '"fecha_fin": "' ||
              to_char(self.fecha_fin, 'YYYY-MM-DD') || '"';
    l_json := l_json || '}';
    RETURN l_json;
  END;
END;
/

prompt
prompt Creating type body Y_RESPUESTA
prompt ==============================
prompt
CREATE OR REPLACE TYPE BODY POLISCRUM.y_respuesta IS
  CONSTRUCTOR FUNCTION y_respuesta RETURN SELF AS RESULT AS
  BEGIN
    self.codigo     := '0';
    self.mensaje    := 'OK';
    self.mensaje_bd := NULL;
    self.origen     := NULL;
    self.datos      := NULL;
    RETURN;
  END;

  MEMBER FUNCTION to_json RETURN CLOB IS
    l_json CLOB;
  BEGIN
    l_json := '{';
    l_json := l_json || '"codigo": "' || self.codigo || '", ';
    l_json := l_json || '"mensaje": "' || self.mensaje || '", ';
    l_json := l_json || '"mensaje_bd": "' || self.mensaje_bd || '", ';
    l_json := l_json || '"origen": "' || self.origen || '", ';
    l_json := l_json || '"datos": "' || self.datos || '"';
    l_json := l_json || '}';
    RETURN l_json;
  END;
END;
/

prompt
prompt Creating trigger GA_APLICACIONES
prompt ================================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_aplicaciones
  BEFORE DELETE OR INSERT OR UPDATE ON t_aplicaciones
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_CIUDADES
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_ciudades
  BEFORE DELETE OR INSERT OR UPDATE ON t_ciudades
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_PAISES
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_paises
  BEFORE DELETE OR INSERT OR UPDATE ON t_paises
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_PERSONAS
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_personas
  BEFORE DELETE OR INSERT OR UPDATE ON t_personas
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_ROLES
prompt =========================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_roles
  BEFORE DELETE OR INSERT OR UPDATE ON t_roles
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_ROL_USUARIOS
prompt ================================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_rol_usuarios
  BEFORE DELETE OR INSERT OR UPDATE ON t_rol_usuarios
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_SERVICIOS
prompt =============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_servicios
  BEFORE DELETE OR INSERT OR UPDATE ON t_servicios
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_SIGNIFICADOS
prompt ================================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_significados
  BEFORE DELETE OR INSERT OR UPDATE ON t_significados
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GA_USUARIOS
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.ga_usuarios
  BEFORE DELETE OR INSERT OR UPDATE ON t_usuarios
  FOR EACH ROW
DECLARE
  -- Auditoria para insercion de registros
  PROCEDURE lp_insercion IS
  BEGIN
    :new.usuario_insercion := substr(USER, 1, 10);
    :new.fecha_insercion   := SYSDATE;
  END;

  -- Auditoria para modificacion de registros
  PROCEDURE lp_modificacion IS
  BEGIN
    :new.usuario_modificacion := substr(USER, 1, 10);
    :new.fecha_modificacion   := SYSDATE;
  END;
BEGIN
  -- Registrar campos de auditoria
  IF inserting THEN
    lp_insercion;
    lp_modificacion;
  ELSIF updating THEN
    lp_modificacion;
  END IF;
END;
/

prompt
prompt Creating trigger GS_CIUDADES
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_ciudades
  BEFORE INSERT ON t_ciudades
  FOR EACH ROW
BEGIN
  SELECT s_id_ciudad.nextval INTO :new.id_ciudad FROM dual;
END;
/

prompt
prompt Creating trigger GS_PAISES
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_paises
  BEFORE INSERT ON t_paises
  FOR EACH ROW
BEGIN
  SELECT s_id_pais.nextval INTO :new.id_pais FROM dual;
END;
/

prompt
prompt Creating trigger GS_PERSONAS
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_personas
  BEFORE INSERT ON t_personas
  FOR EACH ROW
BEGIN
  SELECT s_id_persona.nextval INTO :new.id_persona FROM dual;
END;
/

prompt
prompt Creating trigger GS_ROLES
prompt =========================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_roles
  BEFORE INSERT ON t_roles
  FOR EACH ROW
BEGIN
  SELECT s_id_rol.nextval INTO :new.id_rol FROM dual;
END;
/

prompt
prompt Creating trigger GS_SERVICIOS
prompt =============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_servicios
  BEFORE INSERT ON t_servicios
  FOR EACH ROW
BEGIN
  SELECT s_id_servicio.nextval INTO :new.id_servicio FROM dual;
END;
/

prompt
prompt Creating trigger GS_SESIONES
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_sesiones
  BEFORE INSERT ON t_sesiones
  FOR EACH ROW
BEGIN
  SELECT s_id_sesion.nextval INTO :new.id_sesion FROM dual;
END;
/

prompt
prompt Creating trigger GS_USUARIOS
prompt ============================
prompt
CREATE OR REPLACE TRIGGER POLISCRUM.gs_usuarios
  BEFORE INSERT ON t_usuarios
  FOR EACH ROW
BEGIN
  SELECT s_id_usuario.nextval INTO :new.id_usuario FROM dual;
END;
/


prompt Done
spool off
set define on
