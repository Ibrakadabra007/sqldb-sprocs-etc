USE [sfAzureDb01]	--[mySandbox]  
GO


--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF_Subscription_ChangeDate]
--GO

--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF_Subscription_CreateDate]
--GO

--ALTER TABLE [dbo].[Subscription] DROP CONSTRAINT [DF__Subscript__Subsc__49C3F6B7]
--GO


----/****** Object:  Table [dbo].[Subscription]    Script Date: 1/19/2020 8:54:38 PM ******/
--DROP TABLE [dbo].[Subscription]
--GO




/****** Object:  Table [dbo].[Subscription]    Script Date: 1/19/2020 8:54:38 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[Subscription](
--	[SubscriptionID] [uniqueidentifier] NOT NULL,
--	[ExternalClientID] [uniqueidentifier] NOT NULL,
--	[TokenInfoID] [uniqueidentifier] NOT NULL,
--	[OrderID] [varchar](256) NOT NULL,
--	[DatePlaced] [datetimeoffset](3) NOT NULL,
--	[Duration] [varchar](50) NOT NULL,
--	[Frequency] [varchar](50) NOT NULL,
--	[EstimatedShipDate] [date] NOT NULL,
--	[Products] [xml] NOT NULL,
--	[OtherSubTotal] [varchar](50) NOT NULL,
--	[SalesTax] [varchar](50) NOT NULL,
--	[ShippingName] [varchar](50) NOT NULL,
--	[ShippingAddress] [varchar](40) NOT NULL,
--	[ShippingCity] [varchar](40) NOT NULL,
--	[ShippingState] [varchar](2) NOT NULL,
--	[ShippingZip] [varchar](10) NOT NULL,
--	[Email] [varchar](50) NOT NULL,
--	[ShippingAndHandling] [varchar](50) NOT NULL,
--	[ShippingTax] [varchar](50) NOT NULL,
--	[OrderTotal] [varchar](50) NOT NULL,
--	[IsVerified] [bit] NOT NULL,
--	[AccountLast4] [varchar](4) NULL,
--	[ExpirationMonth] [tinyint] NULL,
--	[ExpirationYear] [tinyint] NULL,
--	[CardTypeCode] [tinyint] NULL,
--	[CreateApplicationID] [smallint] NOT NULL,
--	[CreateUser] [varchar](50) NOT NULL,
--	[CreateDate] [datetimeoffset](3) NOT NULL,
--	[ChangeApplicationID] [smallint] NOT NULL,
--	[ChangeUser] [varchar](50) NOT NULL,
--	[ChangeDate] [datetimeoffset](3) NOT NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[SubscriptionID] ASC
--)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO



--ALTER TABLE [dbo].[Subscription] ADD  DEFAULT (newsequentialid()) FOR [SubscriptionID]
--GO

--ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_CreateDate]  DEFAULT (sysdatetimeoffset()) FOR [CreateDate]
--GO

--ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_ChangeDate]  DEFAULT (sysdatetimeoffset()) FOR [ChangeDate]
--GO

------ALTER TABLE dbo.[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_TokenInfoID] FOREIGN KEY([TokenInfoID])
------REFERENCES [dbo].[TokenInfo] ([TokenInfoID])
------GO

------ALTER TABLE dbo.[Subscription] CHECK CONSTRAINT [FK_Subscription_TokenInfoID]
------GO




----Data----

USE mySandbox --  sfAzureDb01
GO

--delete from [dbo].[Subscription]

--update [dbo].[Subscription] 
--set ExternalClientID = '9774F4B2-9D80-E911-8016-E0071B1B416D' 
--where SubscriptionID = '75C98BF1-E332-EA11-90F7-00155D9B7C97'

INSERT INTO [dbo].[Subscription]
           (
		    [ExternalClientID]
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
		   ,[AccountLast4]
		   ,[ExpirationMonth]
		   ,[ExpirationYear]
		   ,[CardTypeCode]
           ,[CreateApplicationID]
           ,[CreateUser]
           ,[ChangeApplicationID]
           ,[ChangeUser]
		   )
     VALUES
            (
			'CBDE087C-EF21-EA11-80FF-00155D9B7C88'
           ,'6DA6D266-8904-4F6B-9606-36B710C06453'
           ,'8010j000000LFI5AAO'
           ,'2020-01-18 00:00:00.000 -08:00'
           ,'N/A'
           ,'2 Weeks'
           ,'2020-01-01'
           ,'<Products><Product><Description>HD SHIP RC CANINE GASTROINTESTINAL TREATS 17.6OZ BAG</Description><Quantity>1</Quantity><ProductCode>ROYAL CANIN</ProductCode><Price>8.99</Price><Discount>0.00</Discount><Tax>0.70</Tax><Total>9.69</Total></Product></Products>'
           ,'64.99'
           ,'0'
           ,'Peter Forsberg'
           ,'1939 W. 11th St'
           ,'Upland'
           ,'CA'
           ,'91786'
           ,'klas.campbell@banfield.com'
           ,'0'
           ,'0'
           ,'9.69'
           ,0
		   ,'1111'
           ,'2'
           ,'20'
           ,1
           ,4
           ,'true'
           ,4
           ,'true'
		   )


select * from [dbo].[Subscription]


--		   --SubscriptionID							ExternalClientID								TokenInfoID								OrderID				DatePlaced						Duration	Frequency	EstimatedShipDate	
--			--93D75A17-331D-EA11-90F6-00155D9B7C97	10EBB3EF-1197-E711-9BD9-E0071B1B416D	469517C0-4948-497C-999A-7FCF4DC792BF	8010j000000LFI5AAO	2019-12-12 00:00:00.000 -08:00	N/A			1 Month		2020-01-12	
			
--			--Products				
--			--	
--			--
--			--OtherSubTotal	SalesTax	ShippingName	ShippingAddress	ShippingCity	ShippingState	ShippingZip	
--			--17.99			1.71		Sandy Antillon	klas.campbell@banfield.net		


			--Email		ShippingAndHandling		ShippingTax	OrderTotal	IsVerified	CreateApplicationID	CreateUser	CreateDate		ChangeApplicationID	ChangeUser	ChangeDate
			--			6.95					0			26.65		0			4	true									2019-12-12 14:59:47.231 -08:00	4					true		2019-12-12 14:59:47.231 -08:00


--GO


--ALTER TABLE [dbo].[TokenInfo] DROP CONSTRAINT [DF_TokenInfo_TokenInfoID]
--GO


--ALTER TABLE [dbo].[TokenInfo] DROP  CONSTRAINT [DF_TokenInfo_TokenCaptureDate]  
--GO

--ALTER TABLE [dbo].[TokenInfo] DROP  CONSTRAINT [DF_TokenInfo_CreateDate]  
--GO

--ALTER TABLE [dbo].[TokenInfo] DROP  CONSTRAINT [DF_TokenInfo_ChangeDate]  
--GO



--DROP TABLE [dbo].[TokenInfo];


--CREATE TABLE [dbo].[TokenInfo](
--	[TokenInfoID] [uniqueidentifier] NOT NULL,
--	[ExternalClientID] [uniqueidentifier] NOT NULL,
--	[Token] [varchar](19) NULL,
--	[AccountHolderName] [varchar](60) NULL,
--	[AccountLast4] [varchar](4) NULL,
--	[ExpirationMonth] [tinyint] NULL,
--	[ExpirationYear] [tinyint] NULL,
--	[CardTypeCode] [tinyint] NOT NULL,
--	[IsCardOnFile] [bit] NULL,
--	[CardOnFileDate] [datetimeoffset](3) NULL,
--	[TokenCaptureDate] [datetimeoffset](3) NULL,
--	[CreateApplicationID] [smallint] NOT NULL,
--	[ChangeApplicationID] [smallint] NOT NULL,
--	[CreateDate] [datetimeoffset](3) NOT NULL,
--	[ChangeDate] [datetimeoffset](3) NOT NULL
-- CONSTRAINT [PK_TokenInfo] PRIMARY KEY CLUSTERED 
--(
--	[TokenInfoID] ASC
--)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]
--) ON [PRIMARY]
--GO

--ALTER TABLE [dbo].[TokenInfo] ADD  CONSTRAINT [DF_TokenInfo_TokenInfoID]  DEFAULT (newsequentialid()) FOR [TokenInfoID]
--GO

--ALTER TABLE [dbo].[TokenInfo] ADD  CONSTRAINT [DF_TokenInfo_TokenCaptureDate]  DEFAULT (sysdatetimeoffset()) FOR [TokenCaptureDate]
--GO

--ALTER TABLE [dbo].[TokenInfo] ADD  CONSTRAINT [DF_TokenInfo_CreateDate]  DEFAULT (sysdatetimeoffset()) FOR [CreateDate]
--GO

--ALTER TABLE [dbo].[TokenInfo] ADD  CONSTRAINT [DF_TokenInfo_ChangeDate]  DEFAULT (sysdatetimeoffset()) FOR [ChangeDate]
--GO

------ALTER TABLE [dbo].[TokenInfo] CHECK CONSTRAINT [FK_TokenInfo_ChangeApplicationID]
------GO

------ALTER TABLE [dbo].[TokenInfo] CHECK CONSTRAINT [FK_TokenInfo_CreateApplicationID]
------GO



----[Data]----

--INSERT INTO [dbo].[TokenInfo]
--           (
--		      [ExternalClientID]
--           ,[Token]
--           ,[AccountHolderName]
--           ,[AccountLast4]				--*
--           ,[ExpirationMonth]				--*
--           ,[ExpirationYear]				--*
--           ,[CardEntryCode]
--           ,[PaymentTypeCode]				--*
--           ,[CardTypeCode]				--*
--           ,[IsCardOnFile]
--           ,[CardOnFileDate]
--           ,[TokenCaptureDate]        
--           ,[CreateApplicationID]
--           ,[ChangeApplicationID]
--		   )
--     VALUES
--           (
--           'B76AAC3A-DC37-EA11-8100-00155D9B7C88'
--           ,NULL
--           ,'JBond regressionIVRTest  '
--           ,'1111'
--           ,'2'
--           ,'20'
--           ,NULL
--           ,NULL
--           ,1
--           ,1  
--		   ,'2020-01-17 10:29:52.393 -08:00'
--		   ,NULL
--           ,9
--           ,9
--		   )
--GO

--Audit

--CardTypeCode   Description
------------------------------

--1				Visa
--2				MasterCard
--3				Discovery
--4`			Amex



select * from [dbo].[TokenInfo]


