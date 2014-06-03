-- =============================================
-- Author:		Angela Muliawan
-- Create date: 2 Juni 2014
-- Description:	Select Category in home
-- =============================================
ALTER PROCEDURE [dbo].[GetTopTest]
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
	GROUP BY LevelID, t.TestID, TestName, CategoryName, DegreeName, FullName
END
GO

