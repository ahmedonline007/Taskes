 CREATE DATABASE  Inventory

 use [Inventory]
 GO
 CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Category] [nvarchar](100) NULL,
	[Color] [nvarchar](20) NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[AvailableQuantity] [int] NULL
)
 