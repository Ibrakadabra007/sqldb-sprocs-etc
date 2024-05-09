
USE [mySandbox]
GO

--/****** Object:  Table [dbo].[Autoship]    Script Date: 12/27/2019 6:02:53 PM ******/
--IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autoship]') AND type in (N'U')) 
-- DROP TABLE [dbo].[Autoship]
--GO

--/****** Object:  Table [dbo].[Autoship]    Script Date: 12/27/2019 6:02:53 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[Autoship](
--	AutoshipID [uniqueidentifier] NOT NULL,
--	[Description] [nvarchar](max) NULL,
--	IsAutoShip [bit] NOT NULL,
--	OrderNumber nvarchar(20) NOT NULL,
--	SubscriptionToken nvarchar(50) NULL,
--	CreatedDate [datetimeoffset](3) NOT NULL,
--	ChangedDate [datetimeoffset](3) NOT NULL,
--	PRIMARY KEY CLUSTERED 
--	(
--		[AutoshipID] ASC
--	)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO


--ALTER TABLE [dbo].[Autoship] ADD  DEFAULT (newsequentialid()) FOR [AutoshipID]
--GO

--ALTER TABLE [dbo].[Autoship] ADD  CONSTRAINT [DF_Autoship_CreatedDate]  DEFAULT (sysdatetimeoffset()) FOR [CreatedDate]
--GO

--ALTER TABLE [dbo].[Autoship] ADD  CONSTRAINT [DF_Autoship_ChangedDate]  DEFAULT (sysdatetimeoffset()) FOR [ChangedDate]
--GO

----Triggers for CreatedDate & ChangedDate
----

--CREATE TRIGGER [dbo].[tr_Autoship_After_InsertUpdate] 
--ON [dbo].[Autoship]
--FOR INSERT,UPDATE
--AS
--SET NOCOUNT ON

--IF EXISTS (SELECT * FROM deleted)
--BEGIN

--UPDATE [dbo].[Autoship]
--  SET 
--     [CreatedDate] = [deleted].[CreatedDate],
--     [ChangedDate] = sysdatetimeoffset()
--     FROM [deleted] 
-- WHERE  Autoship.AutoshipID = [deleted].[AutoshipID];
--END
--ELSE
--BEGIN
--UPDATE [dbo].[Autoship]
--  SET 
--     [CreatedDate] = sysdatetimeoffset(),
--     [ChangedDate] = sysdatetimeoffset()
--   FROM [inserted] 
--  WHERE  Autoship.AutoshipID = [inserted].AutoshipID;
--END
--SET NOCOUNT OFF
--GO

--ALTER TABLE [dbo].[Autoship] ENABLE TRIGGER [tr_Autoship_After_InsertUpdate]
--GO


select * from [mySandbox].[dbo].[Autoship]

select Len(AutoshipID) from [mySandbox].[dbo].[Autoship] where Description LIKE('Dog%');

--  ID	CreatedDate	Description	OrderNumber IsAutoShip
----------------------------------------------------------
--1	2019-12-24 17:14:00.0000000	1-617895803 Special DogFood	1
--2	2019-12-24 17:30:00.0000000	1-617895806 Special CatFood	1
--3	2019-12-27 00:00:00.0000000	1-617895807 Flea-Tick single dose	1
--4	2019-12-29 12:32:00.0000000 1-617895814	Dog treats (5lbs)	1

INSERT INTO [dbo].[Autoship]
		   ([AutoshipID]
           ,[Description]
           ,[IsAutoShip]
           ,[OrderNumber]
           ,[SubscriptionToken]
           ,[CreatedDate]
           ,[ChangedDate])
     VALUES
           ('C222D965-F10E-DF17-AD61-000D6083B985'
           ,'Special CatFood'
           ,1
		   ,'1-618016362'
		   ,'f49726b7-3vf3-dc12-fg61-000e95833642'
		   ,''
		   ,'')
GO


-- Test sproc for Insert & Update
--
Declare 
	@return_value		int,
	@description		nvarchar(max) = 'Special DogFood',
	@isAutoShip			bit = 0,
	@OrderNumber		nvarchar(20) = '1-617895803',
	@subscriptionToken	nvarchar(50) = 'a49726c7-9xf3-dc19-fg44-000e95833594',
	@autoshipID			uniqueidentifier = 'C550E0D5-2507-EF42-840C-002B67F50296',	--For INSERT, do not set this
	@changedDate		datetimeoffset(3) = '2024-04-30 12:14:16.528 -07:00';		--For INSERT, do not set this

--exec @return_value = dbo.pAutoshipInsert @description, @isAutoShip, @OrderNumber, @subscriptionToken, @autoshipID, @changedDate
--print @return_value 

exec @return_value = dbo.pAutoshipUpdate @autoshipID, @description, @isAutoShip, @OrderNumber, @subscriptionToken, @changedDate
print @return_value 
--
--
--B022D965-F10E-DF11-AD61-000D6083B998
