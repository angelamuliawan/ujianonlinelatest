-- =============================================
-- Author:		Angela Muliawan
-- Create date: 1 Juni 2014
-- Description:	Insert Category
-- =============================================
CREATE PROCEDURE [dbo].[InsertCategory]
	-- Add the parameters for the stored procedure here
	@CategoryName varchar(50),
	@DegreeID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Category VALUES (@CategoryName,@DegreeID, @AuditedUser, 'A', GETDATE())
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Edit Category
-- =============================================
CREATE PROCEDURE [dbo].[EditCategory] 1, 'WebDatabase1', 3, admin
	-- Add the parameters for the stored procedure here
	@CategoryID int,
	@CategoryName varchar(50),
	@DegreeID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Category
	SET CategoryName = @CategoryName,
	DegreeID = @DegreeID,
	AuditedUser = @AuditedUser,
	AuditedActivity = 'E',
	AuditedTime = GETDATE()
	WHERE CategoryID = @CategoryID
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Delete Level
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCategory]
	-- Add the parameters for the stored procedure here
	@CategoryID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Category]
	SET AuditedUser = @AuditedUser,
	AuditedActivity = 'D',
	AuditedTime = GETDATE()
	WHERE CategoryID = @CategoryID
END
GO