USE [DDStudentPortal]
GO

/****** Object:  StoredProcedure [dbo].[CreateSurvey]    Script Date: 8/28/2013 7:09:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ramzan
-- Create date: 8/20/2013
-- Description:	Create Survey
-- =============================================
CREATE PROCEDURE [dbo].[CreateSurvey] 
	-- Add the parameters for the stored procedure here
	@StudentIdsList nvarchar(max),
	@EnrolmentIdsList nvarchar(max),
	@SurveyName nvarchar(50),
	@QuestionGroupId int,
	@OpenDate datetime,
	@DaysOpen int,
	@Active nvarchar(1),
	@CourseOfferingNo int,
	@Submitted nvarchar(1)
AS
BEGIN
	DECLARE     @ErrorCode  int
	DECLARE     @ErrorStep  varchar(200)
	DeCLARE		@SurveyId int
	BEGIN TRY
		BEGIN TRAN T1
		insert into Surveys(SurveyName,QuestionGroupID,OpenDate,DaysOpen,Active,Submitted,CourseOfferingNo) 
					values(@SurveyName,@QuestionGroupId,@OpenDate,@DaysOpen,@Active,@Submitted,@CourseOfferingNo)

		SET @SurveyId=SCOPE_IDENTITY()

		insert into SurveyStudents
		select @SurveyId as SurveyId, studentId,EnrolmentId
		from dbo.ParseStudentIdsEnrolmentIdsLists(@StudentIdsList,@EnrolmentIdsList,',')

		--select @SurveyId as SurveyId,se.StudentNo as StudentId,se.StudentEnrollmentID as EnrollmentId
		--FROM [dbo].[Split](@StudentIdsList,',') as Ids
		--inner join Students as s on Ids.items=s.StudentNo
		--inner join StudentEnrollment as se on Ids.items=se.StudentNo
		--where s.StudentStatusID=@StudentStatusId and s.ProgramNo=@ProgramId and se.EnrollmentFirstTermID=@TermId and s.StudentGroupID=@groupId and s.Session=@sessionId
		
		COMMIT TRAN T1
	End TRY
	
	BEGIN CATCH
	Begin
	ROLLBACK Tran T1
	End
    SELECT @ErrorCode = ERROR_NUMBER()+ERROR_MESSAGE()
    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode  
	END CATCH
END

GO

