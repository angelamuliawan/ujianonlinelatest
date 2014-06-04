
-- =============================================
-- Author:		Angela Muliawan
-- Create date: 29 Mei 2014
-- Description:	Get Category Per Degree
-- =============================================
ALTER PROCEDURE [dbo].[GetCategoryPerDegree]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT c.DegreeID, DegreeName, CategoryID, CategoryName
    FROM
    Category c
    JOIN Degree d on c.DegreeID = d.DegreeID
    WHERE 
    c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D' 
    order by DegreeName
END
GO


alter proc [dbo].[GetUserAndAnswer]
as
begin
set nocount on;
	select u.UserID, UserName, FullName, Email, UserType, COUNT(t.UserID) 'CreateTest', COUNT(ua.UserID) 'PassedTest'
	from [User] u
	LEFT JOIN [Test] t on u.UserID = t.UserID
	LEFT JOIN [UserAnswer] ua on ua.UserID = u.UserID
	where role <> 1 --bukan admin 
	and u.auditedactivity <> 'D'
	group by u.UserID, UserName, FullName, Email, UserType
END
GO


alter proc [dbo].[GetAllTest]
as
begin
set nocount on;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT t.TestID, LevelName, CAST(CONVERT(VARCHAR(13),PublishStartDate,106) as varchar)+ ' - '+CAST(CONVERT(VARCHAR(13),PublishEndDate,106) as varchar) 'PublishDate', TestName, DegreeName, CategoryName, AccessType, COUNT(ua.TestID) 'NumberOfPeople'
    FROM Test t
    JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	LEFT Join UserAnswer ua on ua.TestID = t.TestID
	JOIN [Level] l on l.LevelID = t.LevelID
	WHERE t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D'
	GROUP BY t.TestID, PublishStartDate, PublishEndDate, TestName, DegreeName, CategoryName, AccessType, LevelName
end
go

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 4 Juni 2014
-- Description:	Delete User
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [User]
	SET AuditedUser = @AuditedUser,
	AuditedActivity = 'D',
	AuditedTime = GETDATE()
	WHERE UserID = @UserID
END
GO


-- =============================================
-- Author:		Angela Muliawan
-- Create date: 4 Juni 2014
-- Description:	Delete Test
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTest]
	-- Add the parameters for the stored procedure here
	@TestID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Test]
	SET AuditedUser = @AuditedUser,
	AuditedActivity = 'D',
	AuditedTime = GETDATE()
	WHERE TestID = @TestID
END
GO