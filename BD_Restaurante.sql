if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.DBS') and o.name = 'FK_DBS_ModoDePago')
alter table dbo.DBS
   drop constraint FK_DBS_ModoDePago
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.DBS') and o.name = 'FK_DBS_PS')
alter table dbo.DBS
   drop constraint FK_DBS_PS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.DetalleBoleta') and o.name = 'FK_DetalleBoleta_ModoDePago')
alter table dbo.DetalleBoleta
   drop constraint FK_DetalleBoleta_ModoDePago
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.DetalleBoleta') and o.name = 'FK_DetalleBoleta_Pedido')
alter table dbo.DetalleBoleta
   drop constraint FK_DetalleBoleta_Pedido
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.PPS') and o.name = 'FK_PPS_PS')
alter table dbo.PPS
   drop constraint FK_PPS_PS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.PPS') and o.name = 'FK_PPS_Producto')
alter table dbo.PPS
   drop constraint FK_PPS_Producto
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.Producto') and o.name = 'FK_Producto_TipoProducto')
alter table dbo.Producto
   drop constraint FK_Producto_TipoProducto
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.Productos_Pedidos') and o.name = 'FK_Productos_Pedidos_Pedido')
alter table dbo.Productos_Pedidos
   drop constraint FK_Productos_Pedidos_Pedido
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.Productos_Pedidos') and o.name = 'FK_PRODUCTO_REFERENCE_PRODUCTO')
alter table dbo.Productos_Pedidos
   drop constraint FK_PRODUCTO_REFERENCE_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.User_group') and o.name = 'FK_USER_GRO_REFERENCE_GROUPS')
alter table dbo.User_group
   drop constraint FK_USER_GRO_REFERENCE_GROUPS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.User_group') and o.name = 'FK_USER_GRO_REFERENCE_USERS')
alter table dbo.User_group
   drop constraint FK_USER_GRO_REFERENCE_USERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.DBS')
            and   type = 'U')
   drop table dbo.DBS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.DetalleBoleta')
            and   type = 'U')
   drop table dbo.DetalleBoleta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Groups')
            and   type = 'U')
   drop table dbo.Groups
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.ModoDePago')
            and   type = 'U')
   drop table dbo.ModoDePago
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.PPS')
            and   type = 'U')
   drop table dbo.PPS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.PS')
            and   type = 'U')
   drop table dbo.PS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Pedido')
            and   type = 'U')
   drop table dbo.Pedido
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Producto')
            and   type = 'U')
   drop table dbo.Producto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Productos_Pedidos')
            and   type = 'U')
   drop table dbo.Productos_Pedidos
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.TipoEmpleado')
            and   type = 'U')
   drop table dbo.TipoEmpleado
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.TipoProducto')
            and   type = 'U')
   drop table dbo.TipoProducto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.User_group')
            and   type = 'U')
   drop table dbo.User_group
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Users')
            and   type = 'U')
   drop table dbo.Users
go

drop schema dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
create schema dbo
go

/*==============================================================*/
/* Table: DBS                                                   */
/*==============================================================*/
create table dbo.DBS (
   ID                   int                  identity(1, 1),
   IdPedido             int                  null,
   MontoTotal           decimal              null,
   IdModoDePago         int                  null,
   constraint PK_DBS primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: DetalleBoleta                                         */
/*==============================================================*/
create table dbo.DetalleBoleta (
   ID                   int                  identity(1, 1),
   IdPedido             int                  not null,
   MontoTotal           decimal(18,2)        not null,
   IdModoDePago         int                  not null,
   constraint PK_DetalleBoleta primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Groups                                                */
/*==============================================================*/
create table dbo.Groups (
   idGroup              int                  identity(1, 1),
   Nombre_grupo         nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   Permisos             nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   constraint PK__Groups__E0CF5D24F9C39AB1 primary key (idGroup)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ModoDePago                                            */
/*==============================================================*/
create table dbo.ModoDePago (
   ID                   int                  identity(1, 1),
   Descripcion          nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS not null,
   constraint PK_ModoDePago primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: PPS                                                   */
/*==============================================================*/
create table dbo.PPS (
   ID                   int                  identity(1, 1),
   IdProducto           int                  null,
   IdPedido             int                  null,
   Observacion          nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   constraint PK_PPS primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: PS                                                    */
/*==============================================================*/
create table dbo.PS (
   ID                   int                  identity(1, 1),
   Atendido             bit                  null,
   Detalle              nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   constraint PK_PS primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Pedido                                                */
/*==============================================================*/
create table dbo.Pedido (
   ID                   int                  identity(1, 1),
   Detalle              nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS not null,
   Direccion            varchar(100)         not null,
   telefono             varchar(10)          null,
   constraint PK_Pedido primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Producto                                              */
/*==============================================================*/
create table dbo.Producto (
   IDPRod               int                  not null,
   Nombre               nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS not null,
   IdTipoProducto       int                  not null,
   Precio               decimal(18,2)        not null,
   Descripcion          nvarchar(100)        collate SQL_Latin1_General_CP1_CI_AS not null,
   imagen               nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   constraint PK_Producto primary key (IDPRod)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Productos_Pedidos                                     */
/*==============================================================*/
create table dbo.Productos_Pedidos (
   ID                   int                  identity(1, 1),
   IdPedido             int                  not null,
   IDPRod               int                  null,
   Observacion          nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   Cantidad             int                  null,
   constraint PK_Productos_Pedidos primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: TipoEmpleado                                          */
/*==============================================================*/
create table dbo.TipoEmpleado (
   ID                   int                  identity(1, 1),
   Descripcion          nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS not null,
   Sueldo               decimal(18,2)        null,
   constraint PK_TipoEmpleado primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: TipoProducto                                          */
/*==============================================================*/
create table dbo.TipoProducto (
   ID                   int                  identity(1, 1),
   Descripcion          nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS not null,
   constraint PK_TipoProducto primary key (ID)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: User_group                                            */
/*==============================================================*/
create table dbo.User_group (
   idUser_group         int                  identity(1, 1),
   idGroup              int                  null,
   idUser               numeric              null,
   constraint PK__User_gro__0B368F8950DAEC24 primary key (idUser_group)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table dbo.Users (
   idUser               numeric              collate SQL_Latin1_General_CP1_CI_AS identity,
   Usuario              nvarchar(20)         collate SQL_Latin1_General_CP1_CI_AS null,
   Password             nvarchar(20)         collate SQL_Latin1_General_CP1_CI_AS null,
   Correo               nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   Nombre               nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   Apellido             nvarchar(50)         collate SQL_Latin1_General_CP1_CI_AS null,
   Telefono             nchar(10)            collate SQL_Latin1_General_CP1_CI_AS null,
   Genero               nchar(15)            collate SQL_Latin1_General_CP1_CI_AS null,
   constraint PK_Users primary key (idUser)
         on "PRIMARY"
)
on "PRIMARY"
go

alter table dbo.DBS
   add constraint FK_DBS_ModoDePago foreign key (IdModoDePago)
      references dbo.ModoDePago (ID)
go

alter table dbo.DBS
   add constraint FK_DBS_PS foreign key (IdPedido)
      references dbo.PS (ID)
go

alter table dbo.DetalleBoleta
   add constraint FK_DetalleBoleta_ModoDePago foreign key (IdModoDePago)
      references dbo.ModoDePago (ID)
go

alter table dbo.DetalleBoleta
   add constraint FK_DetalleBoleta_Pedido foreign key (IdPedido)
      references dbo.Pedido (ID)
go

alter table dbo.PPS
   add constraint FK_PPS_PS foreign key (IdPedido)
      references dbo.PS (ID)
go

alter table dbo.PPS
   add constraint FK_PPS_Producto foreign key (IdProducto)
      references dbo.Producto (IDPRod)
go

alter table dbo.Producto
   add constraint FK_Producto_TipoProducto foreign key (IdTipoProducto)
      references dbo.TipoProducto (ID)
go

alter table dbo.Productos_Pedidos
   add constraint FK_Productos_Pedidos_Pedido foreign key (IdPedido)
      references dbo.Pedido (ID)
go

alter table dbo.Productos_Pedidos
   add constraint FK_PRODUCTO_REFERENCE_PRODUCTO foreign key (IDPRod)
      references dbo.Producto (IDPRod)
go

alter table dbo.User_group
   add constraint FK_USER_GRO_REFERENCE_GROUPS foreign key (idGroup)
      references dbo.Groups (idGroup)
go

alter table dbo.User_group
   add constraint FK_USER_GRO_REFERENCE_USERS foreign key (idUser)
      references dbo.Users (idUser)
go
