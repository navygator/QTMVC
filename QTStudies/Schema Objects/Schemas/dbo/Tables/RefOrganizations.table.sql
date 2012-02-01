CREATE TABLE [dbo].[RefOrganizations]
(
	Id uniqueidentifier NOT NULL,
	TeacherId uniqueidentifier NOT NULL,
	Name nvarchar(150) NOT NULL, 
	INN int NOT NULL
)
