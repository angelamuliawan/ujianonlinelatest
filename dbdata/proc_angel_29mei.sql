-- =============================================
-- Author:		Angela Muliawan
-- Create date: 29 Mei 2014
-- Description:	Get Category
-- =============================================
CREATE PROCEDURE [dbo].[GetCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryID, CategoryName, DegreeID From [Category]
	WHERE AuditedActivity <> 'D'
END
GO

INSERT INTO Category VALUES ('Web Database', 2, 'admin', 'A', GETDATE())

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 29 Mei 2014
-- Description:	Get User Profile
-- =============================================
CREATE PROCEDURE [dbo].[GetUserProfile] --1
@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT UserName,UserPhoto, FullName,Email,UserType
	From [User]
	WHERE 
	UserID = @userid
	AND
	AuditedActivity <> 'D'
END
GO