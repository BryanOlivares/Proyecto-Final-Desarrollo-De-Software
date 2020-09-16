/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     14/02/2020 8:13:29                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIAS') and o.name = 'FK_MATERIAS_RELATIONS_EMPLEADO')
alter table MATERIAS
   drop constraint FK_MATERIAS_RELATIONS_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATRICULAS') and o.name = 'FK_MATRICUL_RELATIONS_ALUMNOS')
alter table MATRICULAS
   drop constraint FK_MATRICUL_RELATIONS_ALUMNOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATRICULAS') and o.name = 'FK_MATRICUL_RELATIONS_MATERIAS')
alter table MATRICULAS
   drop constraint FK_MATRICUL_RELATIONS_MATERIAS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTAS') and o.name = 'FK_NOTAS_RELATIONS_ALUMNOS')
alter table NOTAS
   drop constraint FK_NOTAS_RELATIONS_ALUMNOS
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
           where  id    = object_id('MATERIAS')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATERIAS.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIAS')
            and   type = 'U')
   drop table MATERIAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATRICULAS')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATRICULAS.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATRICULAS')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATRICULAS.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATRICULAS')
            and   type = 'U')
   drop table MATRICULAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTAS')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTAS.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NOTAS')
            and   type = 'U')
   drop table NOTAS
go

/*==============================================================*/
/* Table: ALUMNOS                                               */
/*==============================================================*/
create table ALUMNOS (
   ID_ALUMN             int           identity       not null,
   NOMBRE_ALUMN         varchar(50)          null,
   APELLIDO_ALLUMN         varchar(50)          null,
   CEDULA_ALUMN			varchar(15)			not null,
   PASS_ALUMN			varchar(15)			not null,
   DIRECCION_ALUMN      varchar(50)          null,
   FECHA_NACIMIENTO_ALUMN datetime             null,
   constraint PK_ALUMNOS primary key nonclustered (ID_ALUMN)
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   ID_EMPL              int          identity        not null,
   NOMBRE_EMPL          varchar(50)          null,
   APELLIDO_EMPL        varchar(50)          null,
   DIRECCION_EMPL       varchar(50)          null,
   CEDULA_EMPL          varchar(50)          null,
   PASS_EMPL			varchar(15)			not null,
   TELEFONO_EMPL        varchar(50)          null,
   TITULO_EMPL          varchar(50)          null,
   ROL_EMPL             varchar(50)          null,
   constraint PK_EMPLEADOS primary key nonclustered (ID_EMPL)
)
go

/*==============================================================*/
/* Table: MATERIAS                                              */
/*==============================================================*/
create table MATERIAS (
   ID_MATER             int         identity         not null,
   ID_EMPL              int                  null,
   NOMB_MATER           varchar(30)          null,
   constraint PK_MATERIAS primary key nonclustered (ID_MATER)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on MATERIAS (
ID_EMPL ASC
)
go

/*==============================================================*/
/* Table: MATRICULAS                                            */
/*==============================================================*/
create table MATRICULAS (
   ID_MATR              int           identity       not null,
   ID_ALUMN             int                  not null,
   ID_MATER             int                  not null,
   FECHA_MATR           datetime             null,
   constraint PK_MATRICULAS primary key (ID_MATR, ID_ALUMN, ID_MATER)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on MATRICULAS (
ID_ALUMN ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on MATRICULAS (
ID_MATER ASC
)
go

/*==============================================================*/
/* Table: NOTAS                                                 */
/*==============================================================*/
create table NOTAS (
   ID_NOTA              int          identity        not null,
   ID_ALUMN             int                  null,
   NOTA                 numeric(3,2)         null,
   FECHA_HORA_REG       datetime             null,
   MATERIA_NOTA         char(10)             null,
   constraint PK_NOTAS primary key nonclustered (ID_NOTA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on NOTAS (
ID_ALUMN ASC
)
go

alter table MATERIAS
   add constraint FK_MATERIAS_RELATIONS_EMPLEADO foreign key (ID_EMPL)
      references EMPLEADOS (ID_EMPL)
go

alter table MATRICULAS
   add constraint FK_MATRICUL_RELATIONS_ALUMNOS foreign key (ID_ALUMN)
      references ALUMNOS (ID_ALUMN)
go

alter table MATRICULAS
   add constraint FK_MATRICUL_RELATIONS_MATERIAS foreign key (ID_MATER)
      references MATERIAS (ID_MATER)
go

alter table NOTAS
   add constraint FK_NOTAS_RELATIONS_ALUMNOS foreign key (ID_ALUMN)
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
           ('1600731176'
           ,'1868')
GO
