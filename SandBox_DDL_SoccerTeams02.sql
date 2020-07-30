-- Create Tables and Insert Data - [dbo].[SoccerTeams] --

USE mySandbox
GO

--exec sp_who

--select * from sys.dm_exec_connections c where c.session_id = @@SPID 


--DROP Table [mySandbox].[dbo].[SoccerTeams]


--ALTER DATABASE mySandbox SET OFFLINE WITH ROLLBACK IMMEDIATE			
--GO


------[From AZURE for initial setup of Price-Tier;  Can modify via SSMS]----
-- Db Instance Name:  [ mycloudsqlserver-swede007.database.windows.net ]
-- SQL login creds:  [sqlVMLogin/****]
----------------------------------------------------------------------------


--ALTER DATABASE mySandbox 
--MODIFY 
--    (
--    EDITION = 'Standard'
--    , MAXSIZE = 100 GB
--    , SERVICE_OBJECTIVE = 'S0'
--);



--CREATE TABLE SoccerTeams 
--	(
--		SoccerTeamsId int IDENTITY(1,1) NOT NULL, Name varchar(50), League varchar(50), PlaysTheBeautifulGame bit, Founded date,
--		Revenue decimal(18,2), GamesPlayed int, Points int, URI varchar(100), PintsOfBeerConsumed decimal(18,2), CreateDate datetimeoffset(3), ChangeDate datetimeoffset(3)
--		CONSTRAINT [PK_SoccerTeams_SoccerTeamsId] PRIMARY KEY CLUSTERED
--		(
--		 [SoccerTeamsId] ASC
--		) WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 95) ON [PRIMARY]
--	) ON [PRIMARY]
--GO


----[Logical structure]----	

--CREATE TABLE CurrentPWLexicon 
--	(
--		LexItemsId int IDENTITY(1,1) NOT NULL, LexWord varchar(100), IsMedicalTerm bit
--		CONSTRAINT [PK_CurrentPWLexicon_LexItemsId] PRIMARY KEY CLUSTERED
--		(
--		 [LexItemsId] ASC
--		) WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 95) ON [PRIMARY]
--	) ON [PRIMARY]
--GO


----[some data, Physical Structure]----

--INSERT INTO SoccerTeams 
--	(Name, League, PlaysTheBeautifulGame, Founded,
--	 Revenue, GamesPlayed, Points, URI, PintsOfBeerConsumed, CreateDate, ChangeDate )
--	 VALUES

--	 ('PSG','LigueUn', 1, '1970-01-01', 2000000, 20, 54, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg', 600, SYSDATETIMEOFFSET(), null),
--	 ('Hammarby','AllSvenskan', 1, '1910-01-01', 100000, 20, 18, 'http://upload.wikimedia.org/wikipedia/en/a/a9/Hammarby_IF.png', 6000, SYSDATETIMEOFFSET(), null),
--	 ('AC Milan','SerieA', 0, '1899-01-01', 40000000, 20, 27, 'http://img2.wikia.nocookie.net/__cb20090822180417/scratchpad/images/8/84/Milan_logo.png', 400, SYSDATETIMEOFFSET(), null),
--	 ('Chelsea','EPL', 1, '1904-01-01', 80000000, 20, 34, 'http://upload.wikimedia.org/wikipedia/it/0/0d/Chelsea_FC.png', 20000, SYSDATETIMEOFFSET(), null),
--	 ('Timbers',	'MLS', 1, '1975-01-01', 80000,	15, 22, 'http://portlandwiki.org/images/c/c8/PortlandTimbers-logo.png', 20000000, SYSDATETIMEOFFSET(), null),
--	 ('Galatasaray','Süper Lig', 1, '1905-01-01', 600000, 34, 64, 'http://upload.wikimedia.org/wikipedia/commons/f/f6/Galatasaray_Sports_Club_Logo.png', 5, SYSDATETIMEOFFSET(), null),
--	 ('LA Galaxy','MLS', 1, '1996-01-01', 20000000, 10, 10, 'https://logos-download.com/wp-content/uploads/2016/05/LA_Galaxy_logo_small.png', 4100, SYSDATETIMEOFFSET(), null),
--	 ('Manchester United','EPL', 1, '1878-01-01', 802000000.00, 36, 85, 'https://www.monkeytree.co.nz/wp-content/uploads/2016/06/man-united-circle-2.jpg', 44000.00, SYSDATETIMEOFFSET(), null);
--GO

--INSERT INTO [dbo].[SoccerTeams]
--           ([Name]
--           ,[League]
--           ,[PlaysTheBeautifulGame]
--           ,[Founded]
--           ,[Revenue]
--           ,[GamesPlayed]
--           ,[Points]
--           ,[URI]
--           ,[PintsOfBeerConsumed]
--           ,[CreateDate]
--		   ,[ChangeDate])
--VALUES
--           ('Manchester United','EPL', 1, '1878-01-01', 802000000, 36, 85, 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg', 44000, SYSDATETIMEOFFSET(), null)

----Audit
--select * from dbo.SoccerTeams




----sproc

--CREATE PROCEDURE [dbo].[pSoccerTeamsSelect]
--AS
--BEGIN

--	SET NOCOUNT ON;
	
--	SELECT 
--		[SoccerTeamsId]
--		,[Name]
--		,[League]
--		,[PlaysTheBeautifulGame]
--		,[Founded]
--		,[Revenue]
--		,[GamesPlayed]
--		,[Points]
--		,[URI]
--		,[PintsOfBeerConsumed]
--		,[CreatedDate]
--	FROM [dbo].[SoccerTeams]

--	SET NOCOUNT OFF;

--END




----[Misc. ddl stuff]-------------------------------

---->add general column
--alter table table1 add col3 varchar(30) 
--GO
	
---->add identity column
--alter table table1 add col3 int identity(1,1)
--GO
 
---->rename or remove old column
--exec sp_rename 'table1.col1', 'oldcol1', 'column'

---->drop ; create After trigger(s)

--DROP TRIGGER [dbo].[tr_SoccerTeams_After_InsertUpdate]
--GO


--CREATE TRIGGER [dbo].[tr_SoccerTeams_After_Update] 
--ON [dbo].[SoccerTeams]
--FOR INSERT,UPDATE
--AS
--SET NOCOUNT ON


--IF EXISTS (SELECT * FROM deleted)
--UPDATE [dbo].[SoccerTeams]
--  SET 
--     [CreateDate] = [deleted].[CreateDate],
--     [ChangeDate] = sysdatetimeoffset() 
--   FROM [deleted] 
-- WHERE  [SoccerTeams].[SoccerTeamsId]= [deleted].[SoccerTeamsId];

--SET NOCOUNT OFF
--GO

--ALTER TABLE [dbo].[SoccerTeams] ENABLE TRIGGER tr_SoccerTeams_After_Update 
--GO
