---- ==================================================================
----  Inserts data into Global.ReportAnnotation - table 
---- ==================================================================

USE Petware
GO 

 --Delete all records 1st
DELETE FROM Global.ReportAnnotation;
GO

DECLARE	@dtCurrent			datetime = CAST(GETDATE() AS date);
DECLARE @vchWrkStationID	varchar(15) = 'A56589';	 

-- alternate would be to reset the Index (re-seed) 
SET IDENTITY_INSERT  Global.ReportAnnotation ON;

INSERT INTO Global.ReportAnnotation
    (
        ReportAnnotationID, 
        ReportBaseName, 
        Category, 
        PresentationOrder, 
        DisplayValue, 
        StartDate, 
        EndDate, 
        CreateDate, 
        ChangeDate, 
        CreateWorkstationID, 
        ChangeWorkstationID
    )
    VALUES
        -- Category = "Description"
        ( 1, 'OWPCompExam', 'WhatsNextDescription',      0, '',                                                                          @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        ( 2, 'OWPCompExam', 'WhatsNextDescription',      1, 'Recommend upgrading to <WP Level>L to match pet''s health stage needs',     @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        ( 3, 'OWPCompExam', 'WhatsNextDescription',      2, 'Please schedule an appointment',                                            @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        ( 4, 'OWPCompExam', 'WhatsNextDescription',      3, 'Return',                                                                    @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        ( 5, 'OWPCompExam', 'WhatsNextDescription',      4, 'Recommend adding options package',                                          @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        ( 6, 'OWPCompExam', 'WhatsNextDescription',      5, 'Schedule appointment with specialist',                                      @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        ( 7, 'OWPCompExam', 'WhatsNextDescription',      6, 'We will contact you',                                                       @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        --  Category = "When"               
        ( 8, 'OWPCompExam', 'WhatsNextWhen',             0, 'in 1 week',                                                                 @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        ( 9, 'OWPCompExam', 'WhatsNextWhen',             1, 'in 2 weeks',                                                                @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        (10, 'OWPCompExam', 'WhatsNextWhen',             2, 'in 3 weeks',                                                                @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        (11, 'OWPCompExam', 'WhatsNextWhen',             3, 'in 3 weeks',                                                                @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        (12, 'OWPCompExam', 'WhatsNextWhen',             4, 'in 1 month',                                                                @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        (13, 'OWPCompExam', 'WhatsNextWhen',             5, 'in 2 months',                                                               @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (14, 'OWPCompExam', 'WhatsNextWhen',             6, 'in 3 months',                                                               @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (15, 'OWPCompExam', 'WhatsNextWhen',             7, 'in 6 months',                                                               @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        -- Category = "Appointment Type"
        (16, 'OWPCompExam', 'WhatsNextAppointmentType',  0, '',                                                                          @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID), 
        (17, 'OWPCompExam', 'WhatsNextAppointmentType',  1, 'for recheck',                                                               @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (18, 'OWPCompExam', 'WhatsNextAppointmentType',  2, 'for additional tests',                                                      @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (19, 'OWPCompExam', 'WhatsNextAppointmentType',  3, 'for booster vaccination',                                                   @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (20, 'OWPCompExam', 'WhatsNextAppointmentType',  4, 'for surgery follow-up',                                                     @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (21, 'OWPCompExam', 'WhatsNextAppointmentType',  5, 'for additional care',                                                       @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID),
        (22, 'OWPCompExam', 'WhatsNextAppointmentType',  6, 'for medication refill',                                                     @dtCurrent, NULL, @dtCurrent, @dtCurrent, @vchWrkStationID, @vchWrkStationID);
GO

SET IDENTITY_INSERT  Global.ReportAnnotation OFF;
GO

