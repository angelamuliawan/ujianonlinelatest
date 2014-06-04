-- =============================================
-- Author:		Angela Muliawan
-- Create date: 2 Juni 2014
-- Description:	Select Category in home
-- =============================================
CREATE PROCEDURE [dbo].[GetTopTest]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 10 LevelID, t.TestID, TestName, CategoryName, DegreeName, FullName, Count(ua.TestID) 'NumberOfPeople'
	FROM
	Test t
	JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	JOIN [User] u on u.UserID = t.UserID
	Join UserAnswer ua on ua.TestID = t.TestID
	WHERE t.TestID in (SELECT TOP 5 TestID From UserAnswer  GROUP BY TestID ORDER BY COUNT(TestID) )
	AND t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND ua.AuditedActivity <> 'D'
	 AND d.AuditedActivity <> 'D' AND u.AuditedActivity <> 'D'
	GROUP BY LevelID, t.TestID, TestName, CategoryName, DegreeName, FullName
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 2 Juni 2014
-- Description:	Get Creation Test
-- =============================================
ALTER PROCEDURE [dbo].[GetCreationTest]1 
@userid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT t.TestID, LevelName, CAST(CONVERT(VARCHAR(13),PublishStartDate,106) as varchar)+ ' - '+CAST(CONVERT(VARCHAR(13),PublishEndDate,106) as varchar) 'PublishDate', TestName, DegreeName, CategoryName, AccessType, COUNT(ua.TestID) 'NumberOfPeople'
    FROM Test t
    JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	LEFT Join UserAnswer ua on ua.TestID = t.TestID
	JOIN [Level] l on l.LevelID = t.LevelID
	WHERE t.UserID = @userid AND t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D'
	GROUP BY t.TestID, PublishStartDate, PublishEndDate, TestName, DegreeName, CategoryName, AccessType, LevelName
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 2 Juni 2014
-- Description:	Get Number Of People
-- =============================================
CREATE PROCEDURE [dbo].[GetNumberOfPeople]
@testid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT 'Name' = 
		CASE 
		  WHEN ua.UserID is NULL THEN UserEmail
		  ELSE CAST(u.UserName as varchar)
		 END,
		 'Type' = 
		 CASE
			WHEN AccessType = 1 THEN 'Private'
			ELSE 'Public'
		 END,
		 CAST(SUM(CASE WHEN tda.isAnswer = 1 THEN 1 ELSE 0 END) as varchar)
		  + '/'+
		 CAST(COUNT(td.TestID)as varchar) 'RightTotalAnswer'
    FROM UserAnswer ua
    LEFT JOIN [User] u on ua.UserID = u.UserID
    JOIN Test t on ua.TestID = t.TestID
    JOIN TestDetail td on td.TestID = t.TestID
    JOIN UserAnswerDetail uad on uad.UserAnswerID= ua.UserAnswerID AND uad.testDetailID = td.TestDetailID
    JOIN TestDetailAnswer tda on tda.TestDetailAnswerID = uad.TestDetailAnswerID
    WHERE ua.testid = @testid
	GROUP BY ua.UserID, UserEmail, AccessType, u.UserName
END
GO


-- =============================================
-- Author:		Angela Muliawan
-- Create date: 2 Juni 2014
-- Description:	Get Passed Test
-- =============================================
CREATE PROCEDURE [dbo].[GetPassedTest]
@userid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT t.TestID, CONVERT(VARCHAR(13),ua.AuditedTime,106) 'Date',
    TestName, DegreeName, CategoryName, LevelName,
    (CAST(SUM(CASE WHEN tda.isAnswer = 1 THEN 1 ELSE 0 END) as float)/
    CAST(COUNT(td.TestID)as float))*100 'Score'
    FROM Test t
    JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	Join UserAnswer ua on ua.TestID = t.TestID
	JOIN TestDetail td on td.TestID = t.TestID
	JOIN [Level] l on l.LevelID = t.LevelID
    JOIN UserAnswerDetail uad on uad.UserAnswerID= ua.UserAnswerID AND uad.testDetailID = td.TestDetailID
    JOIN TestDetailAnswer tda on tda.TestDetailAnswerID = uad.TestDetailAnswerID
	WHERE ua.UserID = @userid 
	AND t.AuditedActivity <> 'D' 
	AND c.AuditedActivity <> 'D' 
	AND d.AuditedActivity <> 'D'
	AND ua.AuditedActivity <> 'D'
	AND td.AuditedActivity <> 'D'
	AND uad.AuditedActivity <> 'D'
	AND tda.AuditedActivity <> 'D'
	AND l.AuditedActivity <> 'D'
	GROUP BY t.TestID, TestName, DegreeName, CategoryName, ua.AuditedTime, LevelName
END
GO

-- =============================================  
-- Author  : Brian Alexandro    
-- Create date : 04 May 2014  
-- Description : Get list item per category  
-- =============================================  
ALTER PROCEDURE GetListItemPerCategory  1
 -- Add the parameters for the stored procedure here  
 @CategoryID int  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 SELECT  
  t.TestID,  
  TestName,  
  TestDescription,  
  PassedBy = COUNT(ua.UserID)  
 FROM  
  Test t
 LEFT JOIN UserAnswer ua on ua.TestID = t.TestID
 WHERE  
  CategoryID = @CategoryID AND  
  t.AuditedActivity <> 'D'  
 GROUP BY  
  t.TestID,  
  TestName,  
  TestDescription  
END  