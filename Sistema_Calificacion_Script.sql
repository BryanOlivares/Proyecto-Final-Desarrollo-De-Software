/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     01/12/2019 18:48:19                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALUMNOS') and o.name = 'FK_ALUMNOS_RELATIONS_REPRESEN')
alter table ALUMNOS
   drop constraint FK_ALUMNOS_RELATIONS_REPRESEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIA_EMPLEADOS') and o.name = 'FK_MATERIA__RELATIONS_EMPLEADO')
alter table MATERIA_EMPLEADOS
   drop constraint FK_MATERIA__RELATIONS_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATRICULA') and o.name = 'FK_MATRICUL_RELATIONS_ALUMNOS')
alter table MATRICULA
   drop constraint FK_MATRICUL_RELATIONS_ALUMNOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATRICULA') and o.name = 'FK_MATRICUL_RELATIONS_NIVELES')
alter table MATRICULA
   drop constraint FK_MATRICUL_RELATIONS_NIVELES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTAS') and o.name = 'FK_NOTAS_PERTENECE_PERIODOS')
alter table NOTAS
   drop constraint FK_NOTAS_PERTENECE_PERIODOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTAS') and o.name = 'FK_NOTAS_TIENE_ALUMNOS')
alter table NOTAS
   drop constraint FK_NOTAS_TIENE_ALUMNOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALUMNOS')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALUMNOS.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALUMNOS')
            and   type = 'U')
   drop table ALUMNOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADOS')
            and   type = 'U')
   drop table EMPLEADOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATERIA_EMPLEADOS')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATERIA_EMPLEADOS.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIA_EMPLEADOS')
            and   type = 'U')
   drop table MATERIA_EMPLEADOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATRICULA')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATRICULA.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATRICULA')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATRICULA.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATRICULA')
            and   type = 'U')
   drop table MATRICULA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NIVELES')
            and   type = 'U')
   drop table NIVELES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTAS')
            and   name  = 'PERTENECE_A_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTAS.PERTENECE_A_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTAS')
            and   name  = 'TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTAS.TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NOTAS')
            and   type = 'U')
   drop table NOTAS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERIODOS_NOTAS')
            and   type = 'U')
   drop table PERIODOS_NOTAS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REPRESENTANTE')
            and   type = 'U')
   drop table REPRESENTANTE
go

/*==============================================================*/
/* Table: ALUMNOS                                               */
/*==============================================================*/
create table ALUMNOS (
   ID_ALUMN             int       identity(1,1)           not null,
   ID_REPR              int                  null,
   NOMBRE_ALUMN         varchar(20)          null,
   APELLIDO_ALUMN       varchar(20)          null,
   CEDULA_ALUMN			varchar(15)			not null,
   PASS_ALUMN			varchar(15)			not null,
   DIRECCION_ALUMN      varchar(50)          not null,   
   FECHA_NACIMINETO_ALUMN datetime             not null,
   constraint PK_ALUMNOS primary key nonclustered (ID_ALUMN)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on ALUMNOS (
ID_REPR ASC
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   ID_EMPL              int       identity(1,1)           not null,
   NOMBRE_EMPL          varchar(30)          not null,
   APELLIDO_EMPL        varchar(30)          not null,
   CEDULA_ALUMN			varchar(15)			not null,
   PASS_ALUMN			varchar(15)			not null,
   DIRECCION_EMPL       varchar(50)          null,
   TELEFONO_EMPL        varchar(15)          not null,
   TITULO_EMPL          varchar(30)          not null,
   constraint PK_EMPLEADOS primary key nonclustered (ID_EMPL)
)
go

/*==============================================================*/
/* Table: MATERIA_EMPLEADOS                                     */
/*==============================================================*/
create table MATERIA_EMPLEADOS (
   ID_EMPL              int                  not null,
   ID_MATER             int        identity(1,1)          not null,
   constraint PK_MATERIA_EMPLEADOS primary key nonclustered (ID_EMPL, ID_MATER)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on MATERIA_EMPLEADOS (
ID_EMPL ASC
)
go

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         int       identity(1,1)           not null,
   ID_ALUMN             int                  null,
   ID_NIVEL             int                  null,
   FECHA_HORA           datetime             null,
   COSTO                decimal(4,2)         null,
   PARALELO             char(1)              not null,
   constraint PK_MATRICULA primary key nonclustered (ID_MATRICULA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on MATRICULA (
ID_ALUMN ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on MATRICULA (
ID_NIVEL ASC
)
go

/*==============================================================*/
/* Table: NIVELES                                               */
/*==============================================================*/
create table NIVELES (
   ID_NIVEL             int     identity(1,1)             not null,
   NOMBRE_NIVEL         varchar(20)          not null,
   constraint PK_NIVELES primary key nonclustered (ID_NIVEL)
)
go

/*==============================================================*/
/* Table: NOTAS                                                 */
/*==============================================================*/
create table NOTAS (
   ID_NOTA              int       identity(1,1)           not null,
   ID_ALUMN             int                  null,
   ID_PERIODO           int                  null,
   ID_MATER             int                  null,
   NOTA                 decimal(3,2)         not null,
   FECH_HORA_REG        datetime             not null,
   constraint PK_NOTAS primary key nonclustered (ID_NOTA)
)
go

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on NOTAS (
ID_ALUMN ASC
)
go

/*==============================================================*/
/* Index: PERTENECE_A_FK                                        */
/*==============================================================*/
create index PERTENECE_A_FK on NOTAS (
ID_PERIODO ASC
)
go

/*==============================================================*/
/* Table: PERIODOS_NOTAS                                        */
/*==============================================================*/
create table PERIODOS_NOTAS (
   ID_PERIODO           int     identity(1,1)             not null,
   NUM_PERIODO          int                  not null,
   constraint PK_PERIODOS_NOTAS primary key nonclustered (ID_PERIODO)
)
go

/*==============================================================*/
/* Table: REPRESENTANTE                                         */
/*==============================================================*/
create table REPRESENTANTE (
   ID_REPR              int      identity(1,1)            not null,
   NOMBRE_REPR          varchar(20)          not null,
   APELLIDO_REPR        varchar(20)          not null,
   CEDULA_REPR          varchar(15)          not null,
   TRABAJO_REPR         varchar(20)          null,
   DIR_TRABAJO_REPR     varchar(20)          null,
   TLF_TRABAJO_REPR     varchar(20)          null,
   TELEFONO_REPR        varchar(15)          not null,
   CELULAR_REPR         varchar(15)          null,
   ROL_REPR_REPR        varchar(20)          not null,
   constraint PK_REPRESENTANTE primary key nonclustered (ID_REPR)
)
go

alter table ALUMNOS
   add constraint FK_ALUMNOS_RELATIONS_REPRESEN foreign key (ID_REPR)
      references REPRESENTANTE (ID_REPR)
go

alter table MATERIA_EMPLEADOS
   add constraint FK_MATERIA__RELATIONS_EMPLEADO foreign key (ID_EMPL)
      references EMPLEADOS (ID_EMPL)
go

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_ALUMNOS foreign key (ID_ALUMN)
      references ALUMNOS (ID_ALUMN)
go

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_NIVELES foreign key (ID_NIVEL)
      references NIVELES (ID_NIVEL)
go

alter table NOTAS
   add constraint FK_NOTAS_PERTENECE_PERIODOS foreign key (ID_PERIODO)
      references PERIODOS_NOTAS (ID_PERIODO)
go

alter table NOTAS
   add constraint FK_NOTAS_TIENE_ALUMNOS foreign key (ID_ALUMN)
      references ALUMNOS (ID_ALUMN)
go

create table Administrador (
   CEDULA_Admin             varchar(20)          null,
   Password_Admin             varchar(20)          null
)
go

INSERT INTO [dbo].[Administrador]
           ([CEDULA_Admin]
           ,[Password_Admin])
     VALUES
           ('1750024067'
           ,'123456')
GO