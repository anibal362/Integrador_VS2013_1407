USE [master]
GO
/****** Object:  Database [reserva]    Script Date: 23/07/2017 16:03:54 ******/
CREATE DATABASE [reserva]
 GO
ALTER DATABASE [reserva] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reserva].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reserva] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reserva] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reserva] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reserva] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reserva] SET ARITHABORT OFF 
GO
ALTER DATABASE [reserva] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reserva] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [reserva] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reserva] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reserva] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reserva] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reserva] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reserva] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reserva] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reserva] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reserva] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reserva] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reserva] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reserva] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reserva] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reserva] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reserva] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reserva] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reserva] SET RECOVERY FULL 
GO
ALTER DATABASE [reserva] SET  MULTI_USER 
GO
ALTER DATABASE [reserva] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reserva] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reserva] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reserva] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [reserva]
GO
/****** Object:  StoredProcedure [dbo].[deletecancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deletecancha]
	@cancha_id int
as
update cancha 
set activo = 0, fecha_modificacion = GETDATE()
where cancha_id = @cancha_id




GO
/****** Object:  StoredProcedure [dbo].[deleteReserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteReserva]
	@reserva_id int
as
update reserva 
set activo = 0, fecha_modificacion = GETDATE()
where reserva_id = @reserva_id




GO
/****** Object:  StoredProcedure [dbo].[deleteUsuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[deleteUsuario](@usuario_id int)
as
update usuario 
set activo = 0, fecha_modificacion = GETDATE()
where usuario_id = @usuario_id




GO
/****** Object:  StoredProcedure [dbo].[insertCancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertCancha] 
	@cancha_usuario_id int, @cancha_nombre varchar(100),
	@cancha_descripcion varchar(200), @cancha_tipo_id int,@cancha_distrito_id int

As
INSERT INTO dbo.cancha
           (cancha_usuario_id           ,cancha_nombre
           ,cancha_descripcion          ,cancha_tipo_id , cancha_distrito_id          ,activo
           ,usuario_creacion            ,fecha_creacion)
     VALUES
           (@cancha_usuario_id          ,@cancha_nombre
           ,@cancha_descripcion         ,@cancha_tipo_id  ,@cancha_distrito_id          ,1
           ,'master'					,GETDATE())




GO
/****** Object:  StoredProcedure [dbo].[insertReserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertReserva]
	@reserva_fecha datetime, @reserva_horainicio time, @reserva_horafin time,
	@reserva_canchaid int,@reserva_cliente_dni varchar(10), @reserva_cliente_nombre varchar(50),
	@reserva_cliente_apellido varchar(50), @reserva_cliente_email varchar(50),@reserva_cliente_telefono varchar(50),
	@reserva_cliente_celular varchar(12)
as
INSERT INTO [dbo].[reserva]
           ([reserva_fecha]
           ,[reserva_horainicio]
           ,[reserva_horafin]
           ,[reserva_canchaid]
           ,[reserva_cliente_dni]
           ,[reserva_cliente_nombre]
           ,[reserva_cliente_apellido]
           ,[reserva_cliente_email]
           ,[reserva_cliente_telefono]
           ,[reserva_cliente_celular]
           ,[activo]
           ,[usuario_creacion]
           ,[fecha_creacion]
           )
     VALUES
           (@reserva_fecha
           ,@reserva_horainicio
           ,@reserva_horafin
           ,@reserva_canchaid
           ,@reserva_cliente_dni
           ,@reserva_cliente_nombre
           ,@reserva_cliente_apellido
           ,@reserva_cliente_email
           ,@reserva_cliente_telefono
           ,@reserva_cliente_celular
           ,1
           ,'master'
           ,GETDATE()
           )




GO
/****** Object:  StoredProcedure [dbo].[insertUsuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertUsuario]
			@usuario_nombre varchar(50)
           ,@usuario_contraseña varchar(50)           ,@usuario_razonsocial varchar(50)
           ,@usuario_ruc varchar(12)           ,@usuario_email varchar(50)
           ,@usuario_telefono varchar(12)           ,@usuario_foto_url varchar(50)
           ,@usuario_presentacion varchar(500)           
as
insert into dbo.usuario
		(
			usuario_nombre 
           ,usuario_contraseña            ,usuario_razonsocial 
           ,usuario_ruc           ,usuario_email
           ,usuario_telefono            ,usuario_foto_url 
           ,usuario_presentacion           ,activo ,fecha_creacion, usuario_creacion
		   )
values(
			@usuario_nombre
           ,@usuario_contraseña           ,@usuario_razonsocial
           ,@usuario_ruc           ,@usuario_email
           ,@usuario_telefono           ,@usuario_foto_url
           ,@usuario_presentacion           ,1, GETDATE(), 'master'
)




GO
/****** Object:  StoredProcedure [dbo].[selectAllCancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllCancha]
as
select * from dbo.cancha




GO
/****** Object:  StoredProcedure [dbo].[selectAllCanchaxUsuarioId]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[selectAllCanchaxUsuarioId]
	@cancha_usuario_id int
as
select c.cancha_id, c.cancha_nombre, c.cancha_descripcion,c.cancha_usuario_id, c.cancha_tipo_id ,tmd.tablamaestradetalle_descripcion cancha_tipo
from dbo.cancha c
inner join tablamaestradetalle tmd on tmd.tablamaestradetalle_id = c.cancha_tipo_id and tmd.tablamaestra_id=1
where c.cancha_usuario_id = @cancha_usuario_id




GO
/****** Object:  StoredProcedure [dbo].[selectAllReserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[selectAllReserva]
as
select * from dbo.reserva




GO
/****** Object:  StoredProcedure [dbo].[selectAllUsuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllUsuario]
as
select * from dbo.usuario




GO
/****** Object:  StoredProcedure [dbo].[selectCancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectCancha] @cancha_nombre int
as
select * from dbo.cancha 
where cancha_nombre = @cancha_nombre




GO
/****** Object:  StoredProcedure [dbo].[selectReserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[selectReserva]
	@reserva_id int
as
select * from dbo.reserva
where reserva_id = @reserva_id




GO
/****** Object:  StoredProcedure [dbo].[selectUsuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectUsuario] (@usuario_nombre int)
as
select * from dbo.usuario
where usuario_nombre = @usuario_nombre




GO
/****** Object:  StoredProcedure [dbo].[updateCancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[updateCancha](
	@cancha_id int,
	@cancha_usuario_id int, @cancha_nombre varchar(100),
	@cancha_descripcion varchar(200), @cancha_tipo_id int)
As
update cancha
set 		
            cancha_usuario_id = @cancha_usuario_id           ,cancha_nombre = @cancha_nombre
           ,cancha_descripcion = @cancha_descripcion           ,cancha_tipo_id = @cancha_tipo_id
           ,fecha_modificacion = GETDATE()		   
where cancha_id = @cancha_id




GO
/****** Object:  StoredProcedure [dbo].[updateReserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateReserva]
	@reserva_id int, @reserva_fecha datetime, @reserva_horainicio time, @reserva_horafin time,
	@reserva_canchaid int,@reserva_cliente_dni varchar(10), @reserva_cliente_nombre varchar(50),
	@reserva_cliente_apellido varchar(50), @reserva_cliente_email varchar(50),@reserva_cliente_telefono varchar(50),
	@reserva_cliente_celular varchar(12)
as
UPDATE [dbo].[reserva]
   SET [reserva_fecha] = @reserva_fecha
      ,[reserva_horainicio] = @reserva_horainicio
      ,[reserva_horafin] = @reserva_horafin
      ,[reserva_canchaid] = @reserva_canchaid
      ,[reserva_cliente_dni] = @reserva_cliente_dni
      ,[reserva_cliente_nombre] = @reserva_cliente_nombre
      ,[reserva_cliente_apellido] = @reserva_cliente_apellido
      ,[reserva_cliente_email] = @reserva_cliente_email
      ,[reserva_cliente_telefono] = @reserva_cliente_telefono
      ,[reserva_cliente_celular] = @reserva_cliente_celular
      ,[fecha_modificacion] = GETDATE()
 WHERE reserva_id = @reserva_id




GO
/****** Object:  StoredProcedure [dbo].[updateUsuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateUsuario]
			@usuario_id int, @usuario_nombre varchar(50)
           ,@usuario_contraseña varchar(50)           ,@usuario_razonsocial varchar(50)
           ,@usuario_ruc varchar(12)           ,@usuario_email varchar(50)
           ,@usuario_telefono varchar(12)           ,@usuario_foto_url varchar(50)
           ,@usuario_presentacion varchar(500)           
as
update usuario
set
			usuario_nombre =@usuario_nombre
           ,usuario_contraseña =@usuario_contraseña           ,usuario_razonsocial =@usuario_razonsocial
           ,usuario_ruc =@usuario_ruc          ,usuario_email =@usuario_email
           ,usuario_telefono =@usuario_telefono           ,usuario_foto_url =@usuario_foto_url
           ,usuario_presentacion =@usuario_presentacion        ,fecha_modificacion =GETDATE()
where
usuario_id  = @usuario_id




GO
/****** Object:  Table [dbo].[cancha]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cancha](
	[cancha_id] [int] IDENTITY(1,1) NOT NULL,
	[cancha_usuario_id] [int] NOT NULL,
	[cancha_nombre] [varchar](100) NULL,
	[cancha_descripcion] [varchar](200) NULL,
	[cancha_tipo_id] [int] NOT NULL,
	[cancha_distrito_id] [int] NULL,
	[activo] [bit] NOT NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_cancha] PRIMARY KEY CLUSTERED 
(
	[cancha_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reserva](
	[reserva_id] [int] IDENTITY(1,1) NOT NULL,
	[reserva_fecha] [datetime] NULL,
	[reserva_horainicio] [time](7) NULL,
	[reserva_horafin] [time](7) NULL,
	[reserva_canchaid] [int] NULL,
	[reserva_cliente_dni] [varchar](10) NOT NULL,
	[reserva_cliente_nombre] [varchar](50) NULL,
	[reserva_cliente_apellido] [varchar](50) NULL,
	[reserva_cliente_email] [varchar](50) NULL,
	[reserva_cliente_telefono] [varchar](12) NULL,
	[reserva_cliente_celular] [varchar](12) NULL,
	[activo] [bit] NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_reserva] PRIMARY KEY CLUSTERED 
(
	[reserva_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tabla_maestra]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tabla_maestra](
	[tablamaestra_id] [int] IDENTITY(1,1) NOT NULL,
	[tablamaestra_descripcion] [varchar](100) NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_tabla_maestra] PRIMARY KEY CLUSTERED 
(
	[tablamaestra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tablamaestradetalle]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tablamaestradetalle](
	[tablamaestradetalle_id] [int] IDENTITY(1,1) NOT NULL,
	[tablamaestra_id] [int] NOT NULL,
	[tablamaestradetalle_descripcion] [varchar](100) NULL,
	[tablamaestradetalle_valor] [int] NULL,
	[tablamaestradetalle_orden] [int] NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_tablamaestradetalle] PRIMARY KEY CLUSTERED 
(
	[tablamaestradetalle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 23/07/2017 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario_id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_nombre] [varchar](50) NULL,
	[usuario_contraseña] [varchar](50) NULL,
	[usuario_razonsocial] [varchar](50) NULL,
	[usuario_ruc] [varchar](12) NULL,
	[usuario_email] [varchar](50) NULL,
	[usuario_telefono] [varchar](12) NULL,
	[usuario_foto_url] [varchar](50) NULL,
	[usuario_presentacion] [varchar](500) NULL,
	[activo] [bit] NOT NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[cancha] ADD  CONSTRAINT [DF_cancha_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[tabla_maestra] ADD  CONSTRAINT [DF_tabla_maestra_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[tablamaestradetalle] ADD  CONSTRAINT [DF_tablamaestradetalle_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF_usuario_activo]  DEFAULT ((1)) FOR [activo]
GO
USE [master]
GO
ALTER DATABASE [reserva] SET  READ_WRITE 
GO
