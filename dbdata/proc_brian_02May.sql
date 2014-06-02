-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertTestDetail
	-- Add the parameters for the stored procedure here
	@TestQuestion varchar(200),
	@TestURL varchar(100),
	@TestID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID TABLE(ID INT)
	INSERT INTO
		TestDetail
	OUTPUT INSERTED.TestDetailID INTO @ID(ID)
	VALUES
	(
		@TestQuestion,
		@TestURL,
		@TestID,
		@AuditedUser,
		'A',
		GETDATE()
	)
	
	SELECT * FROM @ID;
END
GO
------------------------------------------------

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE InsertTestDetailAnswer
	-- Add the parameters for the stored procedure here
	@TestDetailAnswerName varchar(100),
	@TestDetailURL varchar(100),
	@isAnswer int,
	@TestDetailID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID TABLE(ID INT)
	INSERT INTO
		TestDetailAnswer
	OUTPUT INSERTED.TestDetailAnswerID INTO @ID(ID)
	VALUES
	(
		@TestDetailAnswerName,
		@TestDetailURL,
		@isAnswer,
		@TestDetailID,
		@AuditedUser,
		'A',
		GETDATE()
	)
END
GO

--------------------------------------------------

-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE InsertTest --'asdfasdf','asdfadfasd',1,1,1,5,'2012-12-12','2012-12-12','','admin'  
 -- Add the parameters for the stored procedure here  
 @TestName varchar(30),  
 @TestDescription varchar(100),  
 @CategoryID int,  
 @LevelID int,  
 @AccessType int, -- 0 private, 1 public  
 @UserID int,  
 @PublishStartDate datetime,  
 @PublishEndDate datetime,  
 @UploadTutorial varchar(100),  
 @AuditedUser varchar(100)  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
    DECLARE @ID TABLE(ID INT)  
 INSERT INTO  
  TEST  
 OUTPUT INSERTED.TestID INTO @ID(ID)  
 VALUES  
 (  
  @TestName,  
  @TestDescription,  
  @CategoryID,  
  @LevelID ,  
  @AccessType,  
  @UserID,  
  @PublishStartDate,  
  @PublishEndDate,  
  @UploadTutorial,  
  @AuditedUser,  
  'A',  
  GETDATE()  
 )  
   
 SELECT * FROM @ID;  
END  