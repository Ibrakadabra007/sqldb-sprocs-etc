CREATE PROCEDURE dbo.pAreaParentDelete
(
@areaParentID int
)

AS
BEGIN

	SET NOCOUNT ON;

	DELETE
	FROM 
		Global.AreaParent
	WHERE 
		AreaParentID = @areaParentID;

	SET NOCOUNT OFF;
	
END;