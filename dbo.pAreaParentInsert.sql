CREATE PROCEDURE dbo.pAreaParentInsert
(		
	@childAreaID			int,
	@parentAreaID			int,
	@startdate				date,
	@enddate				date = NULL,
	-- outputs
	@areaParentID			int			OUTPUT,
	@changeDate				datetime	OUTPUT	
)

AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
	
		DECLARE @IDTable table
		(
			ID int
		)   

		INSERT INTO Global.AreaParent
		(			
			ChildAreaID,
			ParentAreaID,
			StartDate,
			EndDate
		)
		OUTPUT INSERTED.AreaParentID
			INTO @IDTable
		VALUES 
		(
			@childAreaID,
			@parentAreaID,
			@startdate,
			@enddate
		);

		-- NOTE:	-Can't get Change/Create info from @OutTable because the trigger on this table 
		--			 may change values after the OUTPUT clause is processed.		
		SELECT TOP (1) @areaParentID = ID, @changeDate = ChangeDate
		FROM Global.AreaParent  AS ap 
		INNER JOIN	@IDTable AS id
			ON	id.ID = ap.AreaParentID;

    END TRY

    BEGIN CATCH
		EXEC RethrowError;
	END CATCH;

END;

GO