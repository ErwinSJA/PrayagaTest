USE [master]
GO

CREATE DATABASE DBFacultad
GO

USE DBFacultad
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Facultad]') AND type = (N'U'))
BEGIN
	DROP TABLE [dbo].[Facultad]
END;
GO

CREATE TABLE [dbo].[Facultad]
/*	-----------------------------------------------------------------------------------------------
    Sistema                 :	TechnicalTest Prayaga
    Objeto                  :	dbo.Facultad
    Descripción             :	Almacenará los datos de facultad
    Fecha de Creación       :	02/01/2024
    Autor                   :	Erwin Joao Sanchez Aranda (EJSA)
    Base de datos           :	DBFacultad
	-----------------------------------------------------------------------------------------------
	Bitácora de Revisiones :
	Nombre		Fecha			Descripción
--------------------------------------------------------------------------------------------- */
(
	intIdFacultad			INT IDENTITY(1,1)	NOT NULL,
	vchNombre				VARCHAR(100)		NOT NULL DEFAULT(''),
	vchCodigo				VARCHAR(6)			NOT NULL UNIQUE,
	bitActivo				BIT					NOT NULL DEFAULT((1)),
	dtmFechaCreacion		DATETIME			NOT NULL,
	dtmFechaActualizacion	DATETIME			NULL
 CONSTRAINT [PK_Facultad_intIdFacultad] PRIMARY KEY CLUSTERED 
(
	intIdFacultad ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX idn_Facultad_vchCodigo ON dbo.Facultad (vchCodigo)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena datos de facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'intIdFacultad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'vchNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de la Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'vchCodigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la facultad esta activa o fue desactivada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'bitActivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación de la facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'dtmFechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificacion de facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facultad', @level2type=N'COLUMN',@level2name=N'dtmFechaActualizacion'
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.Facultad TO [public]
GO


IF EXISTS (SELECT 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[FacultadHist]') AND type = (N'U'))
BEGIN
	DROP TABLE [dbo].[FacultadHist]
END;
GO

CREATE TABLE [dbo].[FacultadHist]
/*	-----------------------------------------------------------------------------------------------
    Sistema                 :	TechnicalTest Prayaga
    Objeto                  :	dbo.FacultadHist
    Descripción             :	Almacenará los cambios historicos de Facultad
    Fecha de Creación       :	02/01/2024
    Autor                   :	Erwin Joao Sanchez Aranda (EJSA)
    Base de datos           :	DBFacultad
	-----------------------------------------------------------------------------------------------
	Bitácora de Revisiones :
	Nombre		Fecha			Descripción
--------------------------------------------------------------------------------------------- */
(
	intIdFacultadHist		INT IDENTITY(1,1)	NOT NULL,
	intIdFacultad			INT					NOT NULL,
	vchNombre				VARCHAR(100)		NOT NULL DEFAULT(''),
	vchCodigo				VARCHAR(6)			NOT NULL,
	bitActivo				BIT					NOT NULL DEFAULT((1)),
	dtmFechaCreacion		DATETIME			NOT NULL,
	dtmFechaActualizacion	DATETIME			NULL
 CONSTRAINT [PK_FacultadHist_intIdFacultadHist] PRIMARY KEY CLUSTERED 
(
	intIdFacultadHist ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena datos historicos de Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.FacultadHist' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'intIdFacultadHist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'intIdFacultad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'vchNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de la Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'vchCodigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la facultad esta activa o fue desactivada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'bitActivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación de la facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'dtmFechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificacion de facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacultadHist', @level2type=N'COLUMN',@level2name=N'dtmFechaActualizacion'
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.FacultadHist TO [public]
GO


IF EXISTS (SELECT 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Carrera]') AND type = (N'U'))
BEGIN
	DROP TABLE [dbo].[Carrera]
END;
GO

CREATE TABLE [dbo].[Carrera]
/*	-----------------------------------------------------------------------------------------------
    Sistema                 :	TechnicalTest Prayaga
    Objeto                  :	dbo.Carrera
    Descripción             :	Almacenará los datos de la carrera
    Fecha de Creación       :	02/01/2024
    Autor                   :	Erwin Joao Sanchez Aranda (EJSA)
    Base de datos           :	DBFacultad
	-----------------------------------------------------------------------------------------------
	Bitácora de Revisiones :
	Nombre		Fecha			Descripción
--------------------------------------------------------------------------------------------- */
(
	intIdCarrera					INT IDENTITY(1,1)	NOT NULL,
	intIdFacultad					INT					NOT NULL,
	vchNombreCarrera				VARCHAR(100)		NOT NULL DEFAULT(''),
	vchCodigoCarrera				VARCHAR(6)			NOT NULL UNIQUE,
	bitActivoCarrera				BIT					NOT NULL DEFAULT((1)),
	dtmFechaCreacionCarrera			DATETIME			NOT NULL,
	dtmFechaActualizacionCarrera	DATETIME			NULL
 CONSTRAINT [PK_Carrera_intIdCarrera] PRIMARY KEY CLUSTERED 
(
	intIdCarrera ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena datos de Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'intIdCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'intIdFacultad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'vchNombreCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'vchCodigoCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la Carrera esta activa o fue desactivada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'bitActivoCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'dtmFechaCreacionCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificacion de Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carrera', @level2type=N'COLUMN',@level2name=N'dtmFechaActualizacionCarrera'
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.Carrera TO [public]
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CarreraHist]') AND type = (N'U'))
BEGIN
	DROP TABLE [dbo].[CarreraHist]
END;
GO

CREATE TABLE [dbo].[CarreraHist]
/*	-----------------------------------------------------------------------------------------------
    Sistema                 :	TechnicalTest Prayaga
    Objeto                  :	dbo.CarreraHist
    Descripción             :	Almacenará los datos historicos de la carrera
    Fecha de Creación       :	02/01/2024
    Autor                   :	Erwin Joao Sanchez Aranda (EJSA)
    Base de datos           :	DBFacultad
	-----------------------------------------------------------------------------------------------
	Bitácora de Revisiones :
	Nombre		Fecha			Descripción
--------------------------------------------------------------------------------------------- */
(
	intIdCarreraHist				INT IDENTITY(1,1)	NOT NULL,
	intIdCarrera					INT					NOT NULL,
	intIdFacultad					INT					NOT NULL,
	vchNombreCarrera				VARCHAR(100)		NOT NULL DEFAULT(''),
	vchCodigoCarrera				VARCHAR(6)			NOT NULL,
	bitActivoCarrera				BIT					NOT NULL DEFAULT((1)),
	dtmFechaCreacionCarrera			DATETIME			NOT NULL,
	dtmFechaActualizacionCarrera	DATETIME			NULL
 CONSTRAINT [PK_CarreraHist_intIdCarreraHist] PRIMARY KEY CLUSTERED 
(
	intIdCarreraHist ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena datos historicos de Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.CarreraHist' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'intIdCarreraHist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'intIdCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla DBFacultad.dbo.Facultad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'intIdFacultad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'vchNombreCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'vchCodigoCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la Carrera esta activa o fue desactivada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'bitActivoCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación de la Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'dtmFechaCreacionCarrera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificacion de Carrera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarreraHist', @level2type=N'COLUMN',@level2name=N'dtmFechaActualizacionCarrera'
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.CarreraHist TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadInsertar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadInsertar]
GO

CREATE PROCEDURE [dbo].[uspFacultadInsertar]
	@pevchNombre			VARCHAR(100),
	@pevchCodigo			VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadInsertar																
	Descripción			: Procedimiento para insertar datos de una facultad
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchNombre			VARCHAR(100)		Nombre de facultad
	@pevchCodigo			VARCHAR(6)			Código de facultad (Unico)
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspFacultadInsertar 'Facultad Ingenieria','255001'
	SELECT * FROM DBFacultad.dbo.Facultad
	SELECT * FROM DBFacultad.dbo.FacultadHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	DECLARE @vintIdFacultad INT = 0
		DECLARE @vbitTransaction BIT = 0

	BEGIN TRY		
		IF EXISTS(SELECT 1 FROM dbo.Facultad WHERE vchCodigo = @pevchCodigo)
			THROW 51000, 'Ya existe una facultad con el mismo codigo', 1;		
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_FacultadInsertar
			SET @vbitTransaction = 1

			INSERT INTO dbo.Facultad (vchNombre, vchCodigo, bitActivo, dtmFechaCreacion)
			VALUES (@pevchNombre, @pevchCodigo,	1,	GETDATE())

			SET @vintIdFacultad = CAST(SCOPE_IDENTITY() AS INT)

			INSERT INTO dbo.FacultadHist (intIdFacultad, vchNombre, vchCodigo, bitActivo, dtmFechaCreacion)
			SELECT @vintIdFacultad, @pevchNombre, @pevchCodigo, bitActivo, dtmFechaCreacion FROM dbo.Facultad WHERE intIdFacultad = @vintIdFacultad

			COMMIT TRANSACTION trx_FacultadInsertar

			SELECT @vintIdFacultad AS intIdFacultad

		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_FacultadInsertar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadInsertar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadDatosActualizar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadDatosActualizar]
GO

CREATE PROCEDURE [dbo].[uspFacultadDatosActualizar]
	@pevchCodigo		VARCHAR(6),
	@pevchNombre		VARCHAR(100)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadDatosActualizar																
	Descripción			: Procedimiento para actualizar datos generales de la Facultad
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigo			VARCHAR(6)			Código de facultad (Unico)
	@pevchNombre			VARCHAR(100)		Nombre de facultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspFacultadDatosActualizar '255001','Nombre nuevo'
	SELECT * FROM DBFacultad.dbo.Facultad
	SELECT * FROM DBFacultad.dbo.FacultadHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	DECLARE @vintIdFacultad INT = 0
	DECLARE @vbitTransaction BIT = 0

	BEGIN TRY		
		IF NOT EXISTS(SELECT 1 FROM dbo.Facultad WHERE vchCodigo = @pevchCodigo AND bitActivo = 1)
			THROW 51000, 'No existe Facultad activa con el código ingresado', 1;		
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_uspFacultadDatosActualizar
			SET @vbitTransaction = 1

			UPDATE dbo.Facultad SET @vintIdFacultad = intIdFacultad, vchNombre = @pevchNombre, dtmFechaActualizacion = GETDATE()
			WHERE vchCodigo = @pevchCodigo

			INSERT INTO dbo.FacultadHist(intIdFacultad, vchNombre, vchCodigo, bitActivo, dtmFechaCreacion, dtmFechaActualizacion)
			SELECT @vintIdFacultad, @pevchNombre, @pevchCodigo, bitActivo, dtmFechaCreacion, dtmFechaActualizacion FROM dbo.Facultad WHERE intIdFacultad = @vintIdFacultad

			COMMIT TRANSACTION trx_uspFacultadDatosActualizar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspFacultadDatosActualizar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadDatosActualizar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadEliminadaActualizar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadEliminadaActualizar]
GO

CREATE PROCEDURE [dbo].[uspFacultadEliminadaActualizar]
	@pevchCodigo		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadEliminadaActualizar																
	Descripción			: Procedimiento para recuperar una facultad eliminada
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBTransact
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre					Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBTransact.dbo.uspFacultadEliminadaActualizar '225001'
	SELECT * FROM DBTransact.dbo.Facultad
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	DECLARE @vbitTransaction BIT = 0

	BEGIN TRY
		IF NOT EXISTS(SELECT 1 FROM dbo.Facultad WHERE vchCodigo = @pevchCodigo AND bitActivo = 0)
			THROW 51000, 'No existe facultad inactiva con el código ingresado', 1;		
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_uspFacultadElimActualizar
			SET @vbitTransaction = 1

			UPDATE dbo.Facultad SET bitActivo = 1, dtmFechaActualizacion = GETDATE() WHERE vchCodigo = @pevchCodigo

			INSERT INTO dbo.FacultadHist(intIdFacultad, vchNombre, vchCodigo, bitActivo, dtmFechaCreacion, dtmFechaActualizacion)
			SELECT intIdFacultad, vchNombre, @pevchCodigo, bitActivo, dtmFechaCreacion, dtmFechaActualizacion FROM dbo.Facultad WHERE vchCodigo = @pevchCodigo

			COMMIT TRANSACTION trx_uspFacultadElimActualizar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspFacultadEliminar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadEliminadaActualizar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadEliminar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadEliminar]
GO

CREATE PROCEDURE [dbo].[uspFacultadEliminar]
	@pevchCodigoFacultad		VARCHAR(6),
	@pevchCodigoFacultadNueva	VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadEliminar																
	Descripción			: Procedimiento para eliminación lógica de una Facultad y traslado de sus carreras a otra
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigo			VARCHAR(6)			Código de facultad (Unico)
	@pevchNombre			VARCHAR(100)		Nombre de facultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspFacultadEliminar '255001','255002'
	SELECT * FROM DBFacultad.dbo.Facultad
	SELECT * FROM DBFacultad.dbo.FacultadHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	DECLARE @vintIdFacultad INT = 0
	DECLARE @vbitTransaction BIT = 0
	DECLARE @vintIdFacultadNueva INT = 0

	BEGIN TRY	
		SELECT @vintIdFacultad = intIdFacultad FROM dbo.Facultad WHERE vchCodigo = @pevchCodigoFacultad AND bitActivo = 1
		SELECT @vintIdFacultadNueva = intIdFacultad FROM dbo.Facultad WHERE vchCodigo = @pevchCodigoFacultadNueva AND bitActivo = 1
		IF @vintIdFacultad = 0
			THROW 51000, 'No existe Facultad activa con el código ingresado', 1;		
		ELSE IF @vintIdFacultadNueva = 0 AND @pevchCodigoFacultadNueva <> ''
			THROW 51000, 'La nueva Facultad no existe o no esta activa', 1;
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_uspFacultadEliminar
			SET @vbitTransaction = 1

			UPDATE dbo.Facultad SET bitActivo = 0, dtmFechaActualizacion = GETDATE()
			WHERE vchCodigo = @pevchCodigoFacultad

			INSERT INTO dbo.FacultadHist(intIdFacultad, vchNombre, vchCodigo, bitActivo, dtmFechaCreacion, dtmFechaActualizacion)
			SELECT @vintIdFacultad, vchNombre, @pevchCodigoFacultad, bitActivo, dtmFechaCreacion, dtmFechaActualizacion FROM dbo.Facultad WHERE intIdFacultad = @vintIdFacultad

			IF @vintIdFacultadNueva > 0
				UPDATE dbo.Carrera SET intIdFacultad = @vintIdFacultadNueva WHERE intIdFacultad = @vintIdFacultad

			COMMIT TRANSACTION trx_uspFacultadEliminar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspFacultadEliminar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadEliminar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadObtener]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadObtener]
GO

CREATE PROCEDURE [dbo].[uspFacultadObtener]
	@pevchCodigo		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadObtener																
	Descripción			: Procedimiento para obtener datos de una Facultad
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigo			VARCHAR(6)			Código de facultad (Unico)
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspFacultadObtener '49523412'
	SELECT * FROM DBFacultad.dbo.Facultad
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	BEGIN TRY
		DECLARE @vintIdFacultad INT = 0

		SELECT @vintIdFacultad = intIdFacultad FROM dbo.Facultad WHERE vchCodigo = @pevchCodigo AND bitActivo = 1
		IF @vintIdFacultad = 0
			THROW 51000, 'No existe una Facultad activa con el código ingresado', 1;
		ELSE
		BEGIN
			SELECT	intIdFacultad, vchNombre, vchCodigo, bitActivo, 
					FORMAT(dtmFechaCreacion, 'dd/MM/yyyy HH:mm:ss') vchFechaCreacion, 
					ISNULL(FORMAT(dtmFechaActualizacion, 'dd/MM/yyyy HH:mm:ss'),'') vchFechaActualizacion
			FROM dbo.Facultad
			WHERE intIdFacultad = @vintIdFacultad
		END
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadObtener TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspFacultadListar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspFacultadListar]
GO

CREATE PROCEDURE [dbo].[uspFacultadListar]
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspFacultadListar																
	Descripción			: Procedimiento para listar a todas las Facultades
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspFacultadListar
	SELECT * FROM DBFacultad.dbo.Facultad
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON

	SELECT intIdFacultad, vchNombre, vchCodigo, bitActivo, 
	FORMAT(dtmFechaCreacion, 'dd/MM/yyyy HH:mm:ss') vchFechaCreacion, 
	ISNULL(FORMAT(dtmFechaActualizacion, 'dd/MM/yyyy HH:mm:ss'),'') vchFechaActualizacion
	FROM dbo.Facultad

END
GO
GRANT EXECUTE ON dbo.uspFacultadListar TO [public]
GO

/*----------------------------------------------------------------------------------------*/


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraInsertar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraInsertar]
GO

CREATE PROCEDURE [dbo].[uspCarreraInsertar]	
	@peintIdFacultad		INT,
	@pevchNombreCarrera		VARCHAR(100),
	@pevchCodigoCarrera		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraInsertar																
	Descripción			: Procedimiento para insertar datos de una Carrera
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchNombre			VARCHAR(100)		Nombre de Carrera
	@pevchCodigo			VARCHAR(6)			Código de Carrera (Unico)
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspCarreraInsertar 'Carrera Ingenieria','255001'
	SELECT * FROM DBFacultad.dbo.Carrera
	SELECT * FROM DBFacultad.dbo.CarreraHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON

	DECLARE @vintIdCarrera INT = 0
	DECLARE @vbitTransaction BIT = 0
	DECLARE @vbitEstadoCarrera BIT = 0

	BEGIN TRY

		SELECT @vintIdCarrera = intIdCarrera, @vbitEstadoCarrera = bitActivoCarrera FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigoCarrera

		IF @vintIdCarrera> 0 AND @vbitEstadoCarrera = 1
			THROW 51000, 'Ya existe una carrera con el mismo codigo', 1;
		ELSE IF @vintIdCarrera> 0 AND @vbitEstadoCarrera = 0
			THROW 51000, 'Ya existe una carrera pero no se encuentra activa', 1;	
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_CarreraInsertar
			SET @vbitTransaction = 1

			INSERT INTO dbo.Carrera (intIdFacultad, vchNombreCarrera, vchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera)
			VALUES (@peintIdFacultad, @pevchNombreCarrera, @pevchCodigoCarrera, 1, GETDATE())

			SET @vintIdCarrera = CAST(SCOPE_IDENTITY() AS INT)

			INSERT INTO dbo.CarreraHist (intIdFacultad, intIdCarrera, vchNombreCarrera, vchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera)
			SELECT @peintIdFacultad, @vintIdCarrera, @pevchNombreCarrera, @pevchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera FROM dbo.Carrera WHERE intIdCarrera = @vintIdCarrera

			COMMIT TRANSACTION trx_CarreraInsertar

			SELECT @vintIdCarrera AS intIdCarrera

		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_CarreraInsertar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspCarreraInsertar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraDatosActualizar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraDatosActualizar]
GO

CREATE PROCEDURE [dbo].[uspCarreraDatosActualizar]
	@pevchCodigo		VARCHAR(6),
	@pevchNombre		VARCHAR(100)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraDatosActualizar																
	Descripción			: Procedimiento para actualizar datos generales de la Carrera
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigo			VARCHAR(6)			Código de Carrera (Unico)
	@pevchNombre			VARCHAR(100)		Nombre de Carrera
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspCarreraDatosActualizar '112002','Nombre nuevo'
	SELECT * FROM DBFacultad.dbo.Carrera
	SELECT * FROM DBFacultad.dbo.CarreraHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	DECLARE @vintIdCarrera INT = 0
	DECLARE @vbitTransaction BIT = 0

	BEGIN TRY		
		IF NOT EXISTS(SELECT 1 FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigo AND bitActivoCarrera = 1)
			THROW 51000, 'No existe Carrera activa con el código ingresado', 1;		
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_uspCarreraDatosActualizar
			SET @vbitTransaction = 1

			UPDATE dbo.Carrera SET @vintIdCarrera = intIdCarrera, vchNombreCarrera = @pevchNombre, dtmFechaActualizacionCarrera = GETDATE()
			WHERE vchCodigoCarrera = @pevchCodigo

			INSERT INTO dbo.CarreraHist(intIdFacultad, intIdCarrera, vchNombreCarrera, vchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera)
			SELECT intIdFacultad, @vintIdCarrera, @pevchNombre, @pevchCodigo, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera FROM dbo.Carrera WHERE intIdCarrera = @vintIdCarrera

			COMMIT TRANSACTION trx_uspCarreraDatosActualizar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspCarreraDatosActualizar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspCarreraDatosActualizar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraEliminadaActualizar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraEliminadaActualizar]
GO

CREATE PROCEDURE [dbo].[uspCarreraEliminadaActualizar]
	@pevchCodigo		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraEliminadaActualizar																
	Descripción			: Procedimiento para recuperar una carrera eliminada
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBTransact
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre					Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBTransact.dbo.uspCarreraEliminadaActualizar '225001'
	SELECT * FROM DBTransact.dbo.Carrera
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON

	DECLARE @vbitTransaction BIT = 0

	BEGIN TRY
		IF NOT EXISTS(SELECT 1 FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigo AND bitActivoCarrera = 0)
			THROW 51000, 'No existe carrera inactiva con el código ingresado', 1;		
		ELSE
		BEGIN
			BEGIN TRANSACTION trx_uspCarreraElimActualizar

			SET @vbitTransaction = 1

			UPDATE dbo.Carrera SET bitActivoCarrera = 1, dtmFechaActualizacionCarrera = GETDATE() WHERE vchCodigoCarrera = @pevchCodigo

			INSERT INTO dbo.CarreraHist(intIdFacultad, intIdCarrera, vchNombreCarrera, vchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera)
			SELECT intIdFacultad, intIdCarrera, vchNombreCarrera, @pevchCodigo, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigo

			COMMIT TRANSACTION trx_uspCarreraElimActualizar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspCarreraElimActualizar;
		THROW;
	END CATCH
	
END
GO
GRANT EXECUTE ON dbo.uspCarreraEliminadaActualizar TO [public]
GO



IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraObtener]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraObtener]
GO

CREATE PROCEDURE [dbo].[uspCarreraObtener]
	@pevchCodigo		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraObtener																
	Descripción			: Procedimiento para obtener datos de una Carrera
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigo			VARCHAR(6)			Código de Carrera (Unico)
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspCarreraObtener '49523412'
	SELECT * FROM DBFacultad.dbo.Carrera
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	BEGIN TRY
		DECLARE @vintIdCarrera INT = 0

		SELECT @vintIdCarrera = intIdCarrera FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigo AND bitActivoCarrera = 1
		IF @vintIdCarrera = 0
			THROW 51000, 'No existe una Carrera activa con el código ingresado', 1;
		ELSE
		BEGIN
			SELECT	CAR.intIdCarrera, CAR.vchNombreCarrera, CAR.vchCodigoCarrera, CAR.bitActivoCarrera, CAR.intIdFacultad, FAC.vchNombre, FAC.vchCodigo,
					FORMAT(CAR.dtmFechaCreacionCarrera, 'dd/MM/yyyy HH:mm:ss') vchFechaCreacionCarrera, 
					ISNULL(FORMAT(CAR.dtmFechaActualizacionCarrera, 'dd/MM/yyyy HH:mm:ss'),'') vchFechaActualizacionCarrera
			FROM dbo.Carrera CAR
			INNER JOIN dbo.Facultad FAC ON FAC.intIdFacultad = CAR.intIdFacultad
			WHERE intIdCarrera = @vintIdCarrera
		END
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspCarreraObtener TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraListar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraListar]
GO

CREATE PROCEDURE [dbo].[uspCarreraListar]
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraListar																
	Descripción			: Procedimiento para listar a todas las Carreras
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspCarreraListar
	SELECT * FROM DBFacultad.dbo.Carrera
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON

	SELECT CAR.intIdCarrera, CAR.vchNombreCarrera, CAR.vchCodigoCarrera, CAR.bitActivoCarrera, CAR.intIdFacultad, FAC.vchNombre, FAC.vchCodigo,
	FORMAT(CAR.dtmFechaCreacionCarrera, 'dd/MM/yyyy HH:mm:ss') vchFechaCreacionCarrera, 
	ISNULL(FORMAT(CAR.dtmFechaActualizacionCarrera, 'dd/MM/yyyy HH:mm:ss'),'') vchFechaActualizacionCarrera
	FROM dbo.Carrera CAR
	INNER JOIN dbo.Facultad FAC ON FAC.intIdFacultad = CAR.intIdFacultad

END
GO
GRANT EXECUTE ON dbo.uspCarreraListar TO [public]
GO


IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[uspCarreraEliminar]') AND Type IN (N'P', N'PC'))
	DROP PROCEDURE  [dbo].[uspCarreraEliminar]
GO

CREATE PROCEDURE [dbo].[uspCarreraEliminar]
	@pevchCodigo		VARCHAR(6)
AS
/*	------------------------------------------------------------------------------------------------------
	Sistema				: TechnicalTest Prayaga																		
	Objeto				: uspCarreraEliminar																
	Descripción			: Procedimiento para eliminación lógica de una carrera
	Fecha de Creación	: 02/01/2024								
	Autor				: Erwin Joao Sanchez Aranda (EJSA)
	Base de Datos		: DBFacultad
	------------------------------------------------------------------------------------------------------
	Parámetros de Entrada																				
	Nombre					Tipo				Descripción
	@pevchCodigoCarrera			VARCHAR(6)		Código de carrera (Unico)
	------------------------------------------------------------------------------------------------------
	Parámetros de Salida																				
	Nombre						Tipo				Descripción
	-----------------------------------------------------------------------------------------------------
	EXEC DBFacultad.dbo.uspCarreraEliminar '255001','255002'
	SELECT * FROM DBFacultad.dbo.Carrera
	SELECT * FROM DBFacultad.dbo.CarreraHist
	-----------------------------------------------------------------------------------------------------*/
BEGIN

	SET NOCOUNT ON
	
	DECLARE @vintIdCarrera INT = 0
	DECLARE @vbitTransaction BIT = 0

	BEGIN TRY	
		SELECT @vintIdCarrera = intIdCarrera FROM dbo.Carrera WHERE vchCodigoCarrera = @pevchCodigo AND bitActivoCarrera = 1

		IF @vintIdCarrera = 0
			THROW 51000, 'No existe carrera activa con el código ingresado', 1;
		BEGIN
			BEGIN TRANSACTION trx_uspCarreraEliminar
			SET @vbitTransaction = 1

			UPDATE dbo.Carrera SET bitActivoCarrera = 0, dtmFechaActualizacionCarrera = GETDATE()
			WHERE vchCodigoCarrera = @pevchCodigo

			INSERT INTO dbo.CarreraHist(intIdFacultad, intIdCarrera, vchNombreCarrera, vchCodigoCarrera, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera)
			SELECT intIdFacultad, @vintIdCarrera, vchNombreCarrera, @pevchCodigo, bitActivoCarrera, dtmFechaCreacionCarrera, dtmFechaActualizacionCarrera FROM dbo.Carrera WHERE intIdCarrera = @vintIdCarrera

			COMMIT TRANSACTION trx_uspFacultadEliminar
		END
	END TRY
	BEGIN CATCH
		IF @vbitTransaction = 1	ROLLBACK TRANSACTION trx_uspCarreraEliminar;
		THROW;
	END CATCH
END
GO
GRANT EXECUTE ON dbo.uspFacultadEliminar TO [public]
GO