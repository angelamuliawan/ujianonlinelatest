-- =============================================
-- Author:		Angela Muliawan
-- Create date: 21 Mei 2014
-- Description:	Insert User
-- =============================================
CREATE PROCEDURE [dbo].[InsertUser]
	-- Add the parameters for the stored procedure here
	@UserName varchar(20), 
	@FullName varchar(100),
	@UserPhoto varchar(100), 
	@Password varchar(100), 
	@Email varchar(100), 
	@UserType varchar(10), 
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [User] VALUES (@UserName, @FullName, @UserPhoto, @Password, @Email, @UserType, 0, @AuditedUser, 'A', GETDATE())
END
GO


-- =============================================
-- Author:		Angela Muliawan
-- Create date: 21 Mei 2014
-- Description:	Check Login
-- =============================================
CREATE PROCEDURE [dbo].[CheckLogin]
	-- Add the parameters for the stored procedure here
	@UserName varchar(20), 
	@Password varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT * FROM [User] WHERE UserName = @UserName AND Password = @Password AND AuditedActivity <> 'D')
	BEGIN
		SELECT UserID, UserName, UserType, [Role]
		FROM [User]
		WHERE 
		UserName = @UserName 
		AND 
		Password = @Password 
		AND 
		AuditedActivity <> 'D'
	END
	ELSE
	BEGIN
		SELECT -1 'UserID'
	END
END
GO