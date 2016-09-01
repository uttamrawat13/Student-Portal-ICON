USE [DDStudentPortal]
GO

/****** Object:  UserDefinedFunction [dbo].[ParseStudentIdsEnrolmentIdsLists]    Script Date: 8/28/2013 7:11:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[ParseStudentIdsEnrolmentIdsLists](@StudentIds varchar(MAX),@EnrolmentIds varchar(MAX), @Delimiter char(1))
returns @temptable TABLE (studentId int,EnrolmentId int)
AS
begin      
    declare @studentidx int       
	declare @Enrolmentidx int       
    declare @studentslice varchar(8000)       
	declare @enrolmentslice varchar(8000)

    select @studentidx = 1       
        if len(@StudentIds)<1 or @StudentIds is null  return       
		if len(@EnrolmentIds)<1 or @EnrolmentIds is null  return  
		 
    while @studentidx!= 0 or @Enrolmentidx!=0
    begin       
        set @studentidx = charindex(@Delimiter,@StudentIds) 
		set @Enrolmentidx = charindex(@Delimiter,@EnrolmentIds) 

        if @studentidx!=0       
            set @studentslice = left(@StudentIds,@studentidx - 1)       
        else       
            set @studentslice = @StudentIds       

		if @Enrolmentidx!=0       
            set @enrolmentslice = left(@EnrolmentIds,@Enrolmentidx - 1)       
        else       
            set @enrolmentslice = @EnrolmentIds       


        if(len(@studentslice)>0 and len(@enrolmentslice)>0)  
            insert into @temptable(studentId,EnrolmentId) values(@studentslice,@enrolmentslice)       

        set @StudentIds = right(@StudentIds,len(@StudentIds) - @studentidx)
		set @EnrolmentIds = right(@EnrolmentIds,len(@EnrolmentIds) - @Enrolmentidx)       
        if len(@StudentIds) = 0 break       
    end   
return 
end

GO

