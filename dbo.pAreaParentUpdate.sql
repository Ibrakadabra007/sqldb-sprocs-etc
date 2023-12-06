CREATE PROCEDURE dbo.pAreaParentUpdate
(
	@areaParentID		int,		
	@childAreaID		int,
	@parentAreaID		int,  	
	@startdate		date, 
	@enddate		date = NULL,
	-- outputs		
	@changeDate		datetime  OUTPUT
)    
AS
BEGIN

	SET NOCOUNT ON;
	
	BEGIN TRY

		UPDATE 
			Global.AreaParent
		SET 
			ChildAreaID = @childAreaID,
			ParentAreaID = @parentAreaID,
			StartDate = @startdate,
			EndDate = @enddate
		WHERE 
			AreaParentID = @areaParentID AND ChangeDate = @changeDate;

		IF @@ROWCOUNT = 0
		BEGIN
			--Set Default values
			DECLARE	@id	   varchar(40) = CONVERT(varchar(40), @areaParentID),			
				@errMsg	   varchar(100)	= '',
				@errState   int	= 0;		
							
			SELECT 
				@id
			FROM 
				Global.AreaParent
			WHERE 
				AreaParentID = @areaParentID;

			IF @id IS NULL
				BEGIN
					SELECT	@errMsg = 'No AreaParentID exists for ID: %s%s',
						@errState = 3
				END
			ELSE
				BEGIN
					SELECT	@errMsg = 'AreaParentID: %s was updated at %s',
						@errState = 2							
				END
				
			RAISERROR(@errMsg, 16, @errState, @id);		
		END

		SELECT 
			@changeDate = ChangeDate
		FROM 
			Global.AreaParent
		WHERE 
			AreaParentID = @areaParentID;
	    
	END TRY

	BEGIN CATCH
		EXEC RethrowError;
	END CATCH	
		
	SET NOCOUNT OFF;	
	
END;
