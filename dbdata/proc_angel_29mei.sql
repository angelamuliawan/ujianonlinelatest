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

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 29 Mei 2014
-- Description:	Change User Profile
-- =============================================
ALTER PROCEDURE [dbo].[ChangeUserProfile]
@userid int,
@FullName varchar(100),
@Email varchar(100), 
@UserPhoto varchar(100),
@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE [User]
    SET FullName = @FullName, Email = @Email, UserPhoto = @UserPhoto, AuditedUser = @AuditedUser,
    AuditedActivity = 'E', AuditedTime = GETDATE()
	WHERE 
	UserID = @userid
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 29 Mei 2014
-- Description:	Change Password
-- =============================================
CREATE PROCEDURE [dbo].[ChangePassword]
@userid int,
@Password varchar(100),
@NewPassword varchar(100),
@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE [User]
    SET Password=@NewPassword, AuditedUser = @AuditedUser,
    AuditedActivity = 'E', AuditedTime = GETDATE()
	WHERE 
	UserID = @userid
	AND
	[Password]=@Password
END
GO