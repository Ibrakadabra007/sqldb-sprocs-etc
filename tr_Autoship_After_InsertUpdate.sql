USE [mySandbox]
GO

/****** Object:  Trigger [dbo].[tr_SoccerTeams_After_InsertUpdate]    Script Date: 1/19/2020 2:02:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[tr_TokenInfo_After_InsertUpdate] 
ON  [dbo].[TokenInfo]
FOR INSERT,UPDATE
AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM deleted)
UPDATE [dbo].TokenInfo
  SET 
     [CreateDate] = [deleted].[CreateDate],
     [ChangeDate] = sysdatetimeoffset()
   FROM [deleted] 
 WHERE [TokenInfo].TokenInfoID = [deleted].TokenInfoID;
ELSE
UPDATE [dbo].TokenInfo
  SET 
     [CreateDate] = sysdatetimeoffset(),
     [ChangeDate] = sysdatetimeoffset()
   FROM [inserted] 
  WHERE [TokenInfo].TokenInfoID = [inserted].TokenInfoID;

SET NOCOUNT OFF
GO

--ALTER TABLE [dbo].[Autoship] ENABLE TRIGGER [tr_Autoship_After_InsertUpdate]
--GO


