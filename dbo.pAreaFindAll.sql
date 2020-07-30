CREATE PROCEDURE dbo.pAreaFindAll

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT      	  
		a.AreaID,
		a.AreaTypeID,
		a.AreaKey,
		a.[Description],
		a.StartDate,
		a.EndDate,
		a.ChangeDate
	FROM 
		Global.Area AS a;
     
    SET NOCOUNT OFF;
	
END;