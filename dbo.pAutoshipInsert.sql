CREATE PROCEDURE dbo.pAutoshipInsert
(		
	--@autoshipID				uniqueidentifier,
	@description			nvarchar(max),
	@isAutoShip				bit,
	@OrderNumber			nvarchar(20),
	@subscriptionToken		nvarchar(50) = NULL,
	---- outputs
	@autoshipID				uniqueidentifier	OUTPUT,			
	@changedDate			datetimeoffset(3)	OUTPUT
)
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
	----TODO
		DECLARE @IDTable table
		(
			ID uniqueidentifier
		)   

		INSERT INTO dbo.Autoship
		(
			[Description],
			IsAutoShip,
			OrderNumber,
			SubscriptionToken
		)
		OUTPUT INSERTED.AutoshipID
			INTO @IDTable
		VALUES 
		(
			@description,			
			@isAutoShip,			
			@OrderNumber,
			@subscriptionToken
		);
		
		SELECT TOP (1) @autoshipID = ID, @changedDate = ChangedDate
		FROM dbo.Autoship AS a 
		INNER JOIN	@IDTable AS id
			ON	id.ID = a.AutoshipID;

    END TRY

    BEGIN CATCH
		EXEC sp_replrethrow;
	END CATCH;

END;

GO