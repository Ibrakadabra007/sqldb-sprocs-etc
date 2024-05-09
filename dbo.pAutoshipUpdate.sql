CREATE PROCEDURE dbo.pAutoshipUpdate
(		
	@autoshipID				uniqueidentifier,
	@description			nvarchar(max),
	@isAutoShip				bit,
	@OrderNumber			nvarchar(20),
	@subscriptionToken		nvarchar(50) = NULL,
	---- outputs	
	@changedDate			datetimeoffset(3)	OUTPUT
)
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
	----TODO
	UPDATE 
			dbo.Autoship
		SET 
			[Description] = @description,
			IsAutoShip = @isAutoShip,
			OrderNumber = @OrderNumber,
			SubscriptionToken = @subscriptionToken
		WHERE 
			AutoshipID = @autoshipID AND ChangedDate = @changedDate;

		IF @@ROWCOUNT = 0
		BEGIN
			--Set Default values
			DECLARE	@id				varchar(40)		= CONVERT(varchar(40), @autoshipID),			
					@errMsg			varchar(100)	= '',
					@errState		int				= 0;		
							
			SELECT 
				@id
			FROM 
				dbo.Autoship
			WHERE 
				AutoshipID = @autoshipID;

			IF @id IS NULL
				BEGIN
					SELECT	@errMsg = '-AutoshipID was NULL',
							@errState = 3
				END
			ELSE
				BEGIN
					--NOT found
					SELECT	@errMsg = '-No AutoshipID exists for ID: %s%s',		--'AutoshipID: %s was updated at %s',
							@errState = 2							
				END
				
			RAISERROR(@errMsg, 16, @errState, @id);		
		END

		SELECT 
			@changedDate = ChangedDate
		FROM 
			dbo.Autoship
		WHERE 
			AutoshipID = @autoshipID;

    END TRY

    BEGIN CATCH
		EXEC sp_replrethrow;
	END CATCH;

	SET NOCOUNT OFF;

END;