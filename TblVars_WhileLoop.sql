

DECLARE @Ids Table (id integer primary Key not null)   

Insert @Ids(id) values(4)   
Insert @Ids(id) values(7)   
Insert @Ids(id) values(12)   
Insert @Ids(id) values(22)   
Insert @Ids(id) values(19) -- (or call another table valued function to generate this table)

----Then loop based on the rows in this table

--  DECLARE 
--	@Id Integer,
--	@iCnt Integer,
--	@strSelect1 NVARCHAR(4000)
	  
--  While exists (Select * From @Ids)     
--    Begin 
--		SET @iCnt += 1     
--		Select @Id = Min(@Id) from @Ids       
--		 --exec p_MyInnerProcedure @Id        
--		Delete @Ids Where id = @Id     
--    End 
    
----[Another alternative is to use a temporary table: ]

--IF EXISTS (SELECT * FROM #Temp)
--	DROP TABLE #Temp
	
Select * Into  #Temp 
From   @Ids  

Declare @Id integer  

--While (Select Count(*) From #Temp) > 0
While Exists (Select * From #Temp) 
Begin      
	Select Top 1 @Id = Id From #Temp
	Print @Id      
	--Do some processing here      
	Delete #Temp Where Id = @Id  
End

 
	
	
		--SET @strSelect1 = 
  --          CASE WHEN @homeHospitals IS NULL
  --                THEN @strSelect1 + ' '
  --          ELSE  
  --                @strSelect1 + 
		--			While exists (Select * From @homeHospitals)     
		--				Begin
		--				Set iCnt +=1
		--				Select @homeHospital = Min(homeHospitalId) from homeHospitals
		--				If iCnt = 1     
		--					Begin  
		--						@strSelect1 + N'AND h.HospitalID = @homeHospital '
		--					End
		--				Else
		--					Begin
		--						@strSelect1 + N'OR h.HospitalID = @homeHospital '
		--					End
		--				End
		--	END;
