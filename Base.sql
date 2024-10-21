USE [master]
GO
/****** Object:  Database [Bibliotecas]    Script Date: 10/20/2024 9:40:18 AM ******/
CREATE DATABASE [Bibliotecas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bibliotecas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bibliotecas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bibliotecas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bibliotecas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bibliotecas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bibliotecas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bibliotecas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bibliotecas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bibliotecas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bibliotecas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bibliotecas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bibliotecas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bibliotecas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bibliotecas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bibliotecas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bibliotecas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bibliotecas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bibliotecas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bibliotecas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bibliotecas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bibliotecas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bibliotecas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bibliotecas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bibliotecas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bibliotecas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bibliotecas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bibliotecas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bibliotecas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bibliotecas] SET RECOVERY FULL 
GO
ALTER DATABASE [Bibliotecas] SET  MULTI_USER 
GO
ALTER DATABASE [Bibliotecas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bibliotecas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bibliotecas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bibliotecas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bibliotecas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bibliotecas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bibliotecas', N'ON'
GO
ALTER DATABASE [Bibliotecas] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bibliotecas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bibliotecas]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](60) NOT NULL,
	[apellidos] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoresRecursos]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoresRecursos](
	[IdAutorRecurso] [int] IDENTITY(1,1) NOT NULL,
	[IdRec] [int] NOT NULL,
	[IdAutor] [int] NOT NULL,
	[EsPrincipal] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutorRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEdit] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEdit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recurso]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recurso](
	[IdRec] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](90) NOT NULL,
	[annopulibc] [date] NULL,
	[IdEdit] [int] NOT NULL,
	[edicion] [varchar](30) NULL,
	[IdPais] [int] NULL,
	[unidades] [int] NULL,
	[precio] [float] NULL,
	[palabrasbusqueda] [varchar](50) NULL,
	[Data_Added] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Usuario] [varchar](45) NOT NULL,
	[Apellido_Usuario] [varchar](65) NOT NULL,
	[Correo_Usuario] [varchar](120) NOT NULL,
	[Telefono_Usuario] [varchar](12) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Password_Usuario] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Recurso] ADD  DEFAULT ((0)) FOR [unidades]
GO
ALTER TABLE [dbo].[AutoresRecursos]  WITH CHECK ADD  CONSTRAINT [FK_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[AutoresRecursos] CHECK CONSTRAINT [FK_Autor]
GO
ALTER TABLE [dbo].[AutoresRecursos]  WITH CHECK ADD  CONSTRAINT [FK_Recurso] FOREIGN KEY([IdRec])
REFERENCES [dbo].[Recurso] ([IdRec])
GO
ALTER TABLE [dbo].[AutoresRecursos] CHECK CONSTRAINT [FK_Recurso]
GO
ALTER TABLE [dbo].[Recurso]  WITH CHECK ADD  CONSTRAINT [FK_Editorial] FOREIGN KEY([IdEdit])
REFERENCES [dbo].[Editorial] ([IdEdit])
GO
ALTER TABLE [dbo].[Recurso] CHECK CONSTRAINT [FK_Editorial]
GO
ALTER TABLE [dbo].[Recurso]  WITH CHECK ADD  CONSTRAINT [FK_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Recurso] CHECK CONSTRAINT [FK_Pais]
GO
/****** Object:  StoredProcedure [dbo].[DeleteRecurso]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRecurso]
    @IdRec INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.Recurso
    WHERE IdRec = @IdRec;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
    -- Select all columns from the Usuarios table
    SELECT 
        ID_Usuario AS ID,
        Nombre_Usuario AS Nombre,
        Apellido_Usuario AS Apellido,
        Correo_Usuario AS Email,
        Telefono_Usuario AS Telefono,
        Usuario AS Usuario
    FROM 
        Usuarios;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetRecursos]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecursos]
AS
BEGIN
    SET NOCOUNT ON;

    -- Consulta para obtener todos los registros de la tabla Recurso
		SELECT 
        IdRec AS Recurso,
        titulo AS Titulo,
		CONVERT(VARCHAR, annopulibc, 23) AS 'Publicación',
        -- CAST (annopulibc AS DATE) AS 'Publicación',
        E.Nombre AS 'Editorial',
        edicion AS Edicion,
        P.nombre AS 'País',
		unidades AS Unidades,
		CONCAT ('$', precio) AS Precio
    FROM 
        dbo.Recurso R
	INNER JOIN [dbo].[Pais] P ON R.IdPais = p.IdPais
	INNER JOIN [dbo].[Editorial] E ON R.IdEdit = E.IdEdit;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecursosByID]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecursosByID]
	@Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Consulta para obtener todos los registros de la tabla Recurso
    SELECT 
        IdRec AS Recurso,
        titulo AS Titulo,
        CAST (annopulibc AS DATE) AS 'Publicación',
        E.Nombre AS 'Editorial',
        edicion AS Edicion,
        P.nombre AS 'País',
		unidades AS Unidades,
		precio AS Precio,
		palabrasbusqueda AS Busqueda
    FROM 
        dbo.Recurso R
	INNER JOIN [dbo].[Pais] P ON R.IdPais = p.IdPais
	INNER JOIN [dbo].[Editorial] E ON R.IdEdit = E.IdEdit
	WHERE IdRec = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTitlesAndPrices]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTitlesAndPrices]
AS
BEGIN
    -- Select title and price from the Recurso table
    SELECT TOP 12
        titulo AS Title,         -- Renaming the column to Title
        precio AS Price          -- Renaming the column to Price
    FROM 
        dbo.Recurso
    WHERE 
        precio IS NOT NULL;      -- Ensuring that only records with a price are returned
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUnitsByDate]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnitsByDate]
AS
BEGIN
    -- Select date and total units for each date
    SELECT 
        CONVERT(varchar, Data_Added, 103) AS [Fecha de Ingreso],  -- Casting to DATE to remove time
        unidades AS Unidades
    FROM 
        dbo.Recurso
    WHERE 
        unidades IS NOT NULL
    ORDER BY 
        Data_Added;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertRecurso]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRecurso]
    @titulo VARCHAR(90),
    @annopulibc DATE,
    @IdEdit INT,
    @edicion VARCHAR(30),
    @IdPais INT,
	@unidades INT,
	@precio FLOAT,
	@palabra VARCHAR (25)
AS
	BEGIN
		SET NOCOUNT ON;

		INSERT INTO dbo.Recurso (titulo, annopulibc, IdEdit, edicion, IdPais, unidades, precio, palabrasbusqueda)
		VALUES (@titulo, @annopulibc, @IdEdit, @edicion, @IdPais, @unidades, @precio, @palabra);
	END
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchProduct]
    @Busqueda VARCHAR(30)
    -- @Autor VARCHAR(30), -- Descomentarlo cuando sea necesario
    -- @Editorial VARCHAR(30),
    -- @Palabra VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    -- Consulta para obtener todos los registros de la tabla Recurso
    SELECT 
        R.IdRec AS Recurso,
        titulo AS Titulo,
        CAST(annopulibc AS DATE) AS 'Publicación',
        E.Nombre AS 'Editorial',
        edicion AS Edicion,
        P.nombre AS 'País',
        unidades AS Unidades,
        precio AS Precio,
        palabrasbusqueda AS Busqueda,
		nombres,
		apellidos,
        CONCAT(nombres, ' ', apellidos) AS 'Autor'
    FROM 
        dbo.Recurso R
        INNER JOIN [dbo].[Pais] P ON R.IdPais = P.IdPais
        INNER JOIN [dbo].[Editorial] E ON R.IdEdit = E.IdEdit
        INNER JOIN [dbo].[AutoresRecursos] AR ON R.IdRec = AR.IdRec -- Conecta la tabla Recurso con AutoresRecurso
        INNER JOIN [dbo].[Autor] A ON AR.IdAutor = A.IdAutor -- Conecta la tabla Autor con AutoresRecurso
    WHERE 
        titulo LIKE '%' + @Busqueda + '%' 
        OR E.Nombre LIKE '%' + @Busqueda + '%' 
        OR palabrasbusqueda LIKE '%' + @Busqueda + '%'
		OR 'Autor' LIKE '%' + @Busqueda + '%'
		OR apellidos LIKE '%' + @Busqueda + '%'
		OR nombres LIKE '%' + @Busqueda + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecurso]    Script Date: 10/20/2024 9:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRecurso]
    @IdRec INT,
    @titulo VARCHAR(90),
    @annopulibc DATE,
    @IdEdit INT,
    @edicion VARCHAR(30),
    @IdPais INT,
	@unidades INT,
	@precio FLOAT,
	@palabra VARCHAR (30)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Recurso
    SET 
        titulo = @titulo,
        annopulibc = @annopulibc,
        IdEdit = @IdEdit,
        edicion = @edicion,
        IdPais = @IdPais,
		unidades = @unidades,
		precio = @precio,
		palabrasbusqueda = @palabra
    WHERE 
        IdRec = @IdRec;
END
GO
USE [master]
GO
ALTER DATABASE [Bibliotecas] SET  READ_WRITE 
GO
