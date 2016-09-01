USE [DDStudentPortal]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSurvey]    Script Date: 8/28/2013 7:09:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ramzan
-- Create date: 8/16/2013
-- Description:	Updates Survey
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSurvey] 
	-- Add the parameters for the stored procedure here
	@StudentIdsList nvarchar(max),
	@EnrolmentIdsList nvarchar(max),
	@SurveyId int,
	@SurveyName nvarchar(50),
	@QuestionGroupId int,
	@OpenDate datetime,
	@DaysOpen int,
	@Active nvarchar(1),
	@CourseOfferingNo int,
	@Submitted nvarchar(1)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
	DECLARE @ErrorCode varchar(200);
	BEGIN TRAN T1
	update Surveys set
	SurveyName=@SurveyName,
	QuestionGroupID=@QuestionGroupId,
	OpenDate=@OpenDate,
	DaysOpen=@DaysOpen,
	Active=@active,
	CourseOfferingNo=@CourseOfferingNo,
	Submitted=@Submitted
	where SurveyID=@SurveyId
	
	--select sw.StudentNo,sw.SurveyId,sw.StudentEnrollmentID
	--into NewTable
	--from
	--(select s.StudentNo,se.StudentEnrollmentID,@SurveyId as SurveyId
	--from Students as s
	--inner join StudentEnrollment as se on s.StudentNo=se.StudentNo
	--where s.StudentNo in (SELECT * FROM [dbo].[Split](@StudentIdsList,','))) as sw
	
	DELETE FROM SurveyStudents
	Where Not Exists(
	Select @SurveyId,temp.studentId,temp.EnrolmentId
	From [dbo].ParseStudentIdsEnrolmentIdsLists(@StudentIdsList,@EnrolmentIdsList,',') as temp
	where temp.EnrolmentId=SurveyStudents.EnrolmentID and temp.studentId=SurveyStudents.StudentID
	)
	--WHERE SurveyStudents.StudentID NOT IN(SELECT * from [dbo].[Split](@StudentIdsList,',')) and SurveyStudents.SurveyID=@SurveyId;
	
	INSERT INTO SurveyStudents (StudentID,EnrolmentID,SurveyID)
	SELECT temp.studentId as StudentNo,temp.EnrolmentId as StudentEnrollmentID,@SurveyId as SurveyId
	FROM [dbo].ParseStudentIdsEnrolmentIdsLists(@StudentIdsList,@EnrolmentIdsList,',') as temp
	EXCEPT (Select StudentId,EnrolmentID,SurveyID from SurveyStudents)

	COMMIT TRAN T1
	END TRY
	BEGIN CATCH
	BEGIN
	ROLLBACK TRAN T1
	END
    SELECT @ErrorCode = ERROR_NUMBER()
    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode
	END CATCH
END

GO

