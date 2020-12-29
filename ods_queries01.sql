Use master
GO

----search for all tables.cols with the predicate below
Select top 100 * from INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME like('%order%') order by COLUMN_NAME desc

--------------------------------------------------------------------

Use WebAPIConsumer
GO

----fetch mock Ids,Names with the relevant roles
SELECT TOP (1000) [Id]
      ,[Name]
  FROM [WebAPIConsumer].[dbo].[AspNetRoles] where Id IN (
'f96e7d75-0fde-42d2-a42c-8dfa02cc376d',
'de39ce09-4114-48b8-83d2-deac0c226df7',
'0e26e4db-e8be-4bae-ac6b-2d813ed64d64'
)


select * from [dbo].[AspNetUsers]

select u.Email as 'User', ur.UserId, ur.RoleId, r.Name as 'Privs' from [WebAPIConsumer].[dbo].[AspNetUserRoles] ur
	inner join dbo.AspNetRoles r
		on r.Id = ur.RoleId
	inner join dbo.AspNetUsers u
		on u.Id = ur.UserId
where UserId IN('0317f08a-8fc7-46db-bfe1-ddf****')


--Missing these 2 Roles for SalesForce [ ApiConsumerProfiles :  "Salesforce	Integration" ]
--***NOT the Issue- compared to PROD***

/*
----sample guids to test with---------------------------------------
--	Id					Name
--	8abe6fe5-6f30-41c9-bb90-5f04c0fd15ad	UpdateClientAccount
--	7de1023a-2f03-45ec-83cf-f21925f7666e	Maintenance
*/



----[status codes and descriptions]---------------------------------

/*
              a. 10 = update successful
              b. 11 = update successful, new data
              c. 12 = zero records updated, new data
              d. 13 = not a owner hospital
              e. 14 = record doesn’t exists in hospital
              f. 15 = error
              g. 16 = zero records updated, no data
              h. 55 = error (messageinterface cannot be found)
              i. 1 = sent
              j. 2 = error (updated column not found in target schema.

*/


USE ODS
GO

select
c.FirstName
,c.LastName
,c.SourceCreateDate
,c.HospitalID
,l.*
from Messaging.MessageLog l
inner join ClientStage.ClientMessageLogLink lnk
on lnk.MessagelogID = l.MessageLogID
inner join Client.Client c
on c.ClientID = lnk.ClientID
where l.StatusCode in (1,2,10,12,13,14,16,55)
order by c.CreateDate desc;
--------------------------------------------------------------

select * from sys.transmission_queue with (nolock)
order by enqueue_time desc;


----Succeeded (10); MessageLogID = 126 on 02/12/2019
--<root>
--  <messageMetadata messageInterfaceID="1228" messageRecipient="source" orignateServerName="DEVXXX" isCheckConcurrency="0" />
--  <updated col1="E33EACBC-0E1E-EA11-80FF-0015***" col2="1069" col3="0" col5="0" col6="1" col11="Alexander" col13="Kovacic" col14="820 W Foothill Blvd" col17="Upland" col18="CA" col20="91786" col23="9094005633" col25="0" col27="1" col29="Alexander" col31="Kovacic" col32="820 W Foothill Blvd" col35="Upland" col36="CA" col38="91786" col41="9094005633" col43="0" col50="1" col52="1" col57="2019-12-13T17:12:04.200-08:00" col58="2019-12-13T17:12:04.200-08:00" col59="DEV04DMZ1" col60="DEV04DMZ1" col61="1069" col62="1069" col63="ODS004Q" col64="4" col65="4" col66="1" col67="0" col68="3" col69="10690" col70="4" col71="2019-02-13T00:00:00Z" col72="0" col45="2019-02-13T17:12:04.200" col46="2019-02-13T17:12:04.200" col51="2019-02-13T17:12:00" />
--</root>

----Sent (1); MessageLogID = 145 on 02/18/2019
--<root>
--  <messageMetadata messageInterfaceID="1228" messageRecipient="source" orignateServerName="DEVXXX" isCheckConcurrency="0" />
--  <updated col1="1CEE1702-DE21-EA11-80FF-0015****" col2="1069" col3="0" col5="0" col6="1" col11="Emil" col13="Forsberg" col14="1721 W 11th St" col17="Upland" col18="CA" col20="91786" col23="9099857901" col25="0" col27="1" col29="Emil" col31="Forsberg" col32="1721 W 11th St" col35="Upland" col36="CA" col38="91786" col41="9099857901" col43="0" col50="1" col52="1" col57="2019-12-18T13:33:19.980-08:00" col58="2019-12-18T13:33:19.980-08:00" col59="DEV04DMZ1" col60="DEV04DMZ1" col61="1069" col62="1069" col63="ODS004U" col64="4" col65="4" col66="1" col67="0" col68="3" col69="10690" col70="2" col71="2019-02-18T00:00:00Z" col72="0" col45="2019-02-18T13:33:19.980" col46="2019-02-18T13:33:19.980" col51="2019-02-18T13:33:00" />
--</root>
