
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 02/01/2012 12:17:37
-- Generated from EDMX file: D:\Work\My Documents\Visual Studio 2010\Projects\QTMVC\QTMVC\Models\Courses.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Courses];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_InstructorOrganization]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Organizations] DROP CONSTRAINT [FK_InstructorOrganization];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseCourseGroup]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseGroups] DROP CONSTRAINT [FK_CourseCourseGroup];
GO
IF OBJECT_ID(N'[dbo].[FK_InstructorCourseGroup]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseGroups] DROP CONSTRAINT [FK_InstructorCourseGroup];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizationEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_OrganizationEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursesEmployees_CourseGroup]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursesEmployees] DROP CONSTRAINT [FK_CoursesEmployees_CourseGroup];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursesEmployees_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursesEmployees] DROP CONSTRAINT [FK_CoursesEmployees_Employee];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Instructors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Instructors];
GO
IF OBJECT_ID(N'[dbo].[Organizations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Organizations];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[CourseGroups]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseGroups];
GO
IF OBJECT_ID(N'[dbo].[CoursesEmployees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CoursesEmployees];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Instructors'
CREATE TABLE [dbo].[Instructors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fio] nvarchar(150)  NOT NULL,
    [EMail] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Organizations'
CREATE TABLE [dbo].[Organizations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(150)  NOT NULL,
    [INN] nvarchar(10)  NOT NULL,
    [InstructorId] int  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fio] nvarchar(max)  NOT NULL,
    [OrganizationId] int  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CourseGroups'
CREATE TABLE [dbo].[CourseGroups] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseId] int  NOT NULL,
    [InstructorId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CoursesEmployees'
CREATE TABLE [dbo].[CoursesEmployees] (
    [CourseGroups_Id] int  NOT NULL,
    [Employees_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [PK_Instructors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Organizations'
ALTER TABLE [dbo].[Organizations]
ADD CONSTRAINT [PK_Organizations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CourseGroups'
ALTER TABLE [dbo].[CourseGroups]
ADD CONSTRAINT [PK_CourseGroups]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [CourseGroups_Id], [Employees_Id] in table 'CoursesEmployees'
ALTER TABLE [dbo].[CoursesEmployees]
ADD CONSTRAINT [PK_CoursesEmployees]
    PRIMARY KEY NONCLUSTERED ([CourseGroups_Id], [Employees_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [InstructorId] in table 'Organizations'
ALTER TABLE [dbo].[Organizations]
ADD CONSTRAINT [FK_InstructorOrganization]
    FOREIGN KEY ([InstructorId])
    REFERENCES [dbo].[Instructors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InstructorOrganization'
CREATE INDEX [IX_FK_InstructorOrganization]
ON [dbo].[Organizations]
    ([InstructorId]);
GO

-- Creating foreign key on [CourseId] in table 'CourseGroups'
ALTER TABLE [dbo].[CourseGroups]
ADD CONSTRAINT [FK_CourseCourseGroup]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseCourseGroup'
CREATE INDEX [IX_FK_CourseCourseGroup]
ON [dbo].[CourseGroups]
    ([CourseId]);
GO

-- Creating foreign key on [InstructorId] in table 'CourseGroups'
ALTER TABLE [dbo].[CourseGroups]
ADD CONSTRAINT [FK_InstructorCourseGroup]
    FOREIGN KEY ([InstructorId])
    REFERENCES [dbo].[Instructors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InstructorCourseGroup'
CREATE INDEX [IX_FK_InstructorCourseGroup]
ON [dbo].[CourseGroups]
    ([InstructorId]);
GO

-- Creating foreign key on [OrganizationId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_OrganizationEmployee]
    FOREIGN KEY ([OrganizationId])
    REFERENCES [dbo].[Organizations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizationEmployee'
CREATE INDEX [IX_FK_OrganizationEmployee]
ON [dbo].[Employees]
    ([OrganizationId]);
GO

-- Creating foreign key on [CourseGroups_Id] in table 'CoursesEmployees'
ALTER TABLE [dbo].[CoursesEmployees]
ADD CONSTRAINT [FK_CoursesEmployees_CourseGroup]
    FOREIGN KEY ([CourseGroups_Id])
    REFERENCES [dbo].[CourseGroups]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Employees_Id] in table 'CoursesEmployees'
ALTER TABLE [dbo].[CoursesEmployees]
ADD CONSTRAINT [FK_CoursesEmployees_Employee]
    FOREIGN KEY ([Employees_Id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursesEmployees_Employee'
CREATE INDEX [IX_FK_CoursesEmployees_Employee]
ON [dbo].[CoursesEmployees]
    ([Employees_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------