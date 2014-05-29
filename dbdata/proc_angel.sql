-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Get Level
-- =============================================
CREATE PROCEDURE [dbo].[GetLevel]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Level
	WHERE AuditedActivity <> 'D'
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Insert Level
-- =============================================
CREATE PROCEDURE [dbo].[InsertLevel]
	-- Add the parameters for the stored procedure here
	@LevelName varchar(50),
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Level VALUES (@LevelName, @AuditedUser, 'A', GETDATE())
END
GO



-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Edit Level
-- =============================================
CREATE PROCEDURE [dbo].[EditLevel]
	-- Add the parameters for the stored procedure here
	@LevelID int,
	@LevelName varchar(50),
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Level]
	SET LevelName = @LevelName,
	AuditedUser = @AuditedUser,
	AuditedActivity = 'E',
	AuditedTime = GETDATE()
	WHERE LevelID = @LevelID
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 18 Mei 2014
-- Description:	Delete Level
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLevel]
	-- Add the parameters for the stored procedure here
	@LevelID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Level]
	SET AuditedUser = @AuditedUser,
	AuditedActivity = 'D',
	AuditedTime = GETDATE()
	WHERE LevelID = @LevelID
END
GO

-- =============================================
-- Author:		Angela Muliawan
-- Create date: 16 Mei 2014
-- Description:	EDIT Degree
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDegree]
	-- Add the parameters for the stored procedure here
	@DegreeID int,
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Degree
	SET 
		AuditedUser = @AuditedUser,
		AuditedActivity = 'D',
		AuditedTime = GETDATE()
	WHERE DegreeID = @DegreeID
END



-- =============================================
-- Author:		Angela Muliawan
-- Create date: 16 Mei 2014
-- Description:	EDIT Degree
-- =============================================
CREATE PROCEDURE [dbo].[EditDegree]
	-- Add the parameters for the stored procedure here
	@DegreeID int,
	@DegreeName varchar(50),
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Degree
	SET 
		DegreeName = @DegreeName,
		AuditedUser = @AuditedUser,
		AuditedActivity = 'E',
		AuditedTime = GETDATE()
	WHERE DegreeID = @DegreeID
END


-- =============================================
-- Author:		Angela Muliawan
-- Create date: 16 Mei 2014
-- Description:	Get Degree
-- =============================================
CREATE PROCEDURE [dbo].[GetDegree]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DegreeID, DegreeName FROM [Degree]
	WHERE AuditedActivity <> 'D'
END



-- =============================================
-- Author:		Angela Muliawan
-- Create date: 16 Mei 2014
-- Description:	Insert Degree
-- =============================================
CREATE PROCEDURE [dbo].[InsertDegree]
	-- Add the parameters for the stored procedure here
	@DegreeName varchar(50),
	@AuditedUser varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Degree VALUES (@DegreeName, @AuditedUser, 'A', GETDATE())
END
