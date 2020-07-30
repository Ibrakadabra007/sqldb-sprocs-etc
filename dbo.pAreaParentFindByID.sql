CREATE PROCEDURE dbo.pAreaParentFindByID
(
@areaParentID int
)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT  
		ap.AreaParentID,	  
		ap.ChildAreaID,
		ap.ParentAreaID,
		ap.StartDate,
		ap.EndDate,
		ap.ChangeDate
	FROM 
		Global.AreaParent AS ap
	WHERE 
		ap.AreaParentID = @areaParentID
     
    SET NOCOUNT OFF;
	
END;