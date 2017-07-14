USE [master]
GO
/****** Object:  Database [reserva]    Script Date: 12/07/2017 18:09:33 ******/
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
/****** Object:  StoredProcedure [dbo].[deleteUsuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteUsuario](@usuario_id int)
as
delete from dbo.usuario
where usuario_id = @usuario_id

GO
/****** Object:  StoredProcedure [dbo].[insertCancha]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertCancha] 
	@cancha_id int, @cancha_usuario_id int, @cancha_nombre varchar(100),
	@cancha_descripcion varchar(200), @cancha_tipo_id int, @activo bit, @usuario_creacion varchar(50),
	@usuario_modificacion varchar(50), @fecha_creacion datetime, @fecha_modificacion datetime

As
INSERT INTO dbo.cancha
           (cancha_id           ,cancha_usuario_id           ,cancha_nombre
           ,cancha_descripcion           ,cancha_tipo_id           ,activo
           ,usuario_creacion           ,usuario_modificacion           ,fecha_creacion
           ,fecha_modificacion)
     VALUES
           (@cancha_id           ,@cancha_usuario_id           ,@cancha_nombre
           ,@cancha_descripcion           ,@cancha_tipo_id           ,@activo
           ,@usuario_creacion           ,@usuario_modificacion           ,@fecha_creacion
           ,@fecha_modificacion)

GO
/****** Object:  StoredProcedure [dbo].[insertUsuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertUsuario]
			@usuario_id int           ,@usuario_nombre varchar(50)
           ,@usuario_contraseña varchar(50)           ,@usuario_razonsocial varchar(50)
           ,@usuario_ruc varchar(12)           ,@usuario_email varchar(50)
           ,@usuario_telefono varchar(12)           ,@usuario_foto_url varchar(50)
           ,@usuario_presentacion varchar(500)           ,@activo bit
           ,@usuario_creacion varchar(50)           ,@usuario_modificacion varchar(50)
           ,@fecha_creacion datetime           ,@fecha_modificacion datetime
as
insert into dbo.usuario
		(
			usuario_id            ,usuario_nombre 
           ,usuario_contraseña            ,usuario_razonsocial 
           ,usuario_ruc           ,usuario_email
           ,usuario_telefono            ,usuario_foto_url 
           ,usuario_presentacion           ,activo 
           ,usuario_creacion           ,usuario_modificacion 
           ,fecha_creacion            ,fecha_modificacion
		   )
values(
			@usuario_id           ,@usuario_nombre
           ,@usuario_contraseña           ,@usuario_razonsocial
           ,@usuario_ruc           ,@usuario_email
           ,@usuario_telefono           ,@usuario_foto_url
           ,@usuario_presentacion           ,@activo
           ,@usuario_creacion           ,@usuario_modificacion
           ,@fecha_creacion           ,@fecha_modificacion
)

GO
/****** Object:  StoredProcedure [dbo].[selectAllCancha]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllCancha]
as
select * from dbo.cancha

GO
/****** Object:  StoredProcedure [dbo].[selectAllUsuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllUsuario]
as
select * from dbo.usuario

GO
/****** Object:  StoredProcedure [dbo].[selectCancha]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectCancha] @cancha_id int
as
select * from dbo.cancha 
where cancha_id = @cancha_id

GO
/****** Object:  StoredProcedure [dbo].[selectUsuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectUsuario] (@usuario_nombre int)
as
select * from dbo.usuario
where usuario_nombre = @usuario_nombre

GO
/****** Object:  StoredProcedure [dbo].[updateCancha]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[updateCancha](
	@cancha_id int, @cancha_usuario_id int, @cancha_nombre varchar(100),
	@cancha_descripcion varchar(200), @cancha_tipo_id int, @activo bit, @usuario_creacion varchar(50),
	@usuario_modificacion varchar(50), @fecha_creacion datetime, @fecha_modificacion datetime)
As
update cancha
set 		
            cancha_usuario_id = @cancha_usuario_id           ,cancha_nombre = @cancha_nombre
           ,cancha_descripcion = @cancha_descripcion           ,cancha_tipo_id = @cancha_tipo_id
           ,activo = @activo           ,usuario_creacion = @usuario_creacion
           ,usuario_modificacion = @usuario_modificacion           ,fecha_creacion = @fecha_creacion
           ,fecha_modificacion = @fecha_modificacion		   
where cancha_id = @cancha_id

GO
/****** Object:  StoredProcedure [dbo].[updateUsuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateUsuario]
			@usuario_id int           ,@usuario_nombre varchar(50)
           ,@usuario_contraseña varchar(50)           ,@usuario_razonsocial varchar(50)
           ,@usuario_ruc varchar(12)           ,@usuario_email varchar(50)
           ,@usuario_telefono varchar(12)           ,@usuario_foto_url varchar(50)
           ,@usuario_presentacion varchar(500)           ,@activo bit
           ,@usuario_creacion varchar(50)           ,@usuario_modificacion varchar(50)
           ,@fecha_creacion datetime           ,@fecha_modificacion datetime
as
update usuario
set
			usuario_nombre =@usuario_nombre
           ,usuario_contraseña =@usuario_contraseña           ,usuario_razonsocial =@usuario_razonsocial
           ,usuario_ruc =@usuario_ruc          ,usuario_email =@usuario_email
           ,usuario_telefono =@usuario_telefono           ,usuario_foto_url =@usuario_foto_url
           ,usuario_presentacion =@usuario_presentacion          ,activo =@activo
           ,usuario_creacion =@usuario_creacion          ,usuario_modificacion =@usuario_modificacion
           ,fecha_creacion =@fecha_creacion           ,fecha_modificacion =@fecha_modificacion
where
usuario_id  = @usuario_id

GO
/****** Object:  Table [dbo].[cancha]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cancha](
	[cancha_id] [int] NOT NULL,
	[cancha_usuario_id] [int] NOT NULL,
	[cancha_nombre] [varchar](100) NULL,
	[cancha_descripcion] [varchar](200) NULL,
	[cancha_tipo_id] [int] NULL,
	[activo] [bit] NOT NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reserva](
	[reserva_id] [int] NOT NULL,
	[reserva_fecha] [datetime] NULL,
	[reserva_horainicio] [time](7) NULL,
	[reserva_horafin] [time](7) NULL,
	[reserva_canchaid] [int] NULL,
	[reserva_cliente_dni] [varchar](10) NOT NULL,
	[reserva_cliente_nombre] [varchar](50) NULL,
	[reserva_cliente_apellido] [varchar](50) NULL,
	[reserva_cliente_email] [varchar](50) NULL,
	[reserva_cliente_telefono] [varchar](12) NULL,
	[reserva_cliente_celular] [varchar](12) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tabla_maestra]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tabla_maestra](
	[tablamaestra_id] [int] NOT NULL,
	[tablamaestra_descripcion] [varchar](100) NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tablamaestradetalle]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tablamaestradetalle](
	[tablamaestradetalle_id] [int] NOT NULL,
	[tablamaestra_id] [int] NOT NULL,
	[tablamaestradetalle_descripcion] [varchar](100) NULL,
	[tablamaestradetalle_orden] [int] NULL,
	[usuario_creacion] [varchar](50) NULL,
	[usuario_modificacion] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 12/07/2017 18:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario_id] [int] NOT NULL,
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
	[fecha_modificacion] [datetime] NULL
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

USE [reserva]
GO

INSERT INTO [dbo].[usuario]
           ([usuario_id]
           ,[usuario_nombre]
           ,[usuario_contraseña]
           ,[usuario_razonsocial]
           ,[usuario_ruc]
           ,[usuario_email]
           ,[usuario_telefono]
           ,[usuario_foto_url]
           ,[usuario_presentacion]
           ,[activo]
           ,[usuario_creacion]
           ,[usuario_modificacion]
           ,[fecha_creacion]
           ,[fecha_modificacion])
     VALUES
           (123
           ,'asd'
           ,'asd'
           ,'asd'
           ,'asd'
           ,'asd'
           ,'asd'
           ,'asd'
           ,'asd'
           ,1
           ,'asd'
           ,'asd'
           ,'12/07/2017 00:00:00'
           ,'12/07/2017 00:00:00')
GO
