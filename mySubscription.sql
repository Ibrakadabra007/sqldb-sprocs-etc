USE [MySandbox]
GO

--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF_Subscription_ChangedDate]
--GO

--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF_Subscription_CreatedDate]
--GO

--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF__Subscript__Subsc__267ABA7A]
--GO

--/****** Object:  Table [dbo].[Subscription]    Script Date: 4/29/2024 2:25:42 PM ******/
--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscription]') AND type in (N'U'))
--DROP TABLE [dbo].[Subscription]
--GO


--/****** Object:  Table [dbo].[Subscription]    Script Date: 4/29/2024 2:25:42 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[Subscription](
--	[SubscriptionID] [uniqueidentifier] NOT NULL,
--	[ClientID] [uniqueidentifier] NULL,
--	[TokenInfoID] [uniqueidentifier] NOT NULL,
--	[OrderID] [varchar](256) NOT NULL,
--	[DatePlaced] [datetimeoffset](3) NOT NULL,
--	[Duration] [varchar](50) NULL,
--	[Frequency] [varchar](50) NULL,
--	[EstimatedShipDate] [date] NOT NULL,
--	[Products] [xml] NOT NULL,
--	[OtherSubTotal] [varchar](50) NOT NULL,
--	[SalesTax] [money] NULL,
--	[ShippingName] [varchar](50) NOT NULL,
--	[ShippingAddress] [varchar](40) NOT NULL,
--	[ShippingCity] [varchar](40) NOT NULL,
--	[ShippingState] [varchar](2) NOT NULL,
--	[ShippingZip] [varchar](10) NOT NULL,
--	[Email] [varchar](80) NULL,
--	[ShippingAndHandling] [varchar](50) NOT NULL,
--	[ShippingTax] [money] NULL,
--	[OrderTotal] [varchar](50) NOT NULL,
--	[IsVerified] [bit] NOT NULL,
--	[CreatedApplicationID] [smallint] NULL,
--	[CreatedDate] [datetimeoffset](3) NOT NULL,
--	[ChangedApplicationID] [smallint] NULL,
--	[ChangedDate] [datetimeoffset](3) NOT NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[SubscriptionID] ASC
--)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO

--ALTER TABLE [dbo].[Subscription] ADD  DEFAULT (newsequentialid()) FOR [SubscriptionID]
--GO

--ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_CreatedDate]  DEFAULT (sysdatetimeoffset()) FOR [CreatedDate]
--GO

--ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_ChangedDate]  DEFAULT (sysdatetimeoffset()) FOR [ChangedDate]
--GO



----Triggers for CreatedDate & ChangedDate
----

--CREATE TRIGGER [dbo].[tr_Subscription_After_InsertUpdate] 
--ON [dbo].[Subscription]
--FOR INSERT,UPDATE
--AS
--SET NOCOUNT ON

--IF EXISTS (SELECT * FROM deleted)
--BEGIN

--UPDATE [dbo].[Subscription]
--  SET 
--     [CreatedDate] = [deleted].[CreatedDate],
--     [ChangedDate] = sysdatetimeoffset()
--     FROM [deleted] 
-- WHERE  [Subscription].[SubscriptionID]= [deleted].[SubscriptionID];
--END
--ELSE
--BEGIN
--UPDATE [dbo].[Subscription]
--  SET 
--     [CreatedDate] = sysdatetimeoffset(),
--     [ChangedDate] = sysdatetimeoffset()
--   FROM [inserted] 
--  WHERE  [Subscription].[SubscriptionID]= [inserted].[SubscriptionID];
--END
--SET NOCOUNT OFF
--GO

--ALTER TABLE [dbo].[Subscription] ENABLE TRIGGER [tr_Subscription_After_InsertUpdate]
--GO



select * from dbo.Subscription



INSERT INTO [dbo].[Subscription]
           ([SubscriptionID]
           ,[ClientID]
           ,[TokenInfoID]
           ,[OrderID]
           ,[DatePlaced]
           ,[Duration]
           ,[Frequency]
           ,[EstimatedShipDate]
           ,[Products]
           ,[OtherSubTotal]
           ,[SalesTax]
           ,[ShippingName]
           ,[ShippingAddress]
           ,[ShippingCity]
           ,[ShippingState]
           ,[ShippingZip]
           ,[Email]
           ,[ShippingAndHandling]
           ,[ShippingTax]
           ,[OrderTotal]
           ,[IsVerified]
           ,[CreatedApplicationID]
           ,[CreatedDate]
           ,[ChangedApplicationID]
           ,[ChangedDate])
     VALUES
           ('B022D965-F10E-DF11-AD61-000D6083B998'
           ,null
           ,'FA7F3D49-8947-E511-8282-7C7A9179D212'
           ,'68755'
           ,SYSDATETIMEOFFSET()
           ,null
           ,null
           ,'2019-12-29'
           ,'<Products></Products>'
           ,''
           ,1.90
           ,''
           ,'926 NW 13th Ave'
           ,'Portland'
           ,'OR'
           ,'97209'
           ,'kjones@gmail.com'
           ,'9.50'
           ,0.04
           ,'104.50'
           ,1
           ,null
           ,''
           ,null
           ,'')
GO
