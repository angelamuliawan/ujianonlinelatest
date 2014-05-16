CREATE TABLE [User](
	UserID int identity primary key,
	UserName varchar(20),
	FullName varchar(100),
	UserPhoto varchar(100),
	[Password] varchar(100),
	Email varchar(100),
	UserType varchar(10), --company or private
	[Role] varchar(10), --admin, user
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime
)

CREATE TABLE Degree(
	DegreeID int identity primary key,
	DegreeName varchar(50),
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime
)

CREATE TABLE [Category](
	CategoryID int identity primary key,
	CategoryName varchar(50),
	DegreeID int,
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime,
	CONSTRAINT fkDegree FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)
)

CREATE TABLE [Level](
	LevelID int identity primary key,
	LevelName varchar(50),
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime
)

CREATE TABLE Test(
	TestID int identity primary key,
	TestName varchar(30),
	TestDescription varchar(100),
	CategoryID int,
	LevelID int,
	AccessType int, -- 1 public, 0 private
	UserID int,
	PublishStartDate datetime,
	PublishEndDate datetime,
	UploadTutorial varchar(100), --if there any tutorial uploaded
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime,
	CONSTRAINT fkCategory FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	CONSTRAINT fkLevel FOREIGN KEY (LevelID) REFERENCES [Level](LevelID),
	CONSTRAINT fkUser FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

CREATE TABLE TestDetail(
	TestDetailID int identity primary key,
	TestQuestion varchar(200),
	TestURL varchar(100), -- if any additional image/video/music as a question
	TestID int,
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime,
	CONSTRAINT fkTestDetail FOREIGN KEY (TestID) REFERENCES Test(TestID)
)

CREATE TABLE TestDetailAnswer(
	TestDetailAnswerID int identity primary key,
	TestDetailAnswerName varchar(100),
	TestDetailURL varchar(100),
	isAnswer int, -- 1 if the tuple is answer, else 0
	TestDetailID int,
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime,
	CONSTRAINT fkTestDetailAnswer FOREIGN KEY (TestDetailID) REFERENCES TestDetail(TestDetailID)
)

CREATE TABLE UserAnswer(
	UserAnswerID int identity primary key,
	TestID int,
	isInvited int, -- 1 if the user is invited
	UserID int NULL,
	UserEmail varchar(100),--if invited but not user, userid null but fill this
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime	
)
 
CREATE TABLE UserAnswerDetail(--allow user to try test more than 1 times
	UserAnswerDetailID int identity primary key,
	UserAnswerID int,
	TestDetailID int,
	TestDetailAnswerID int,
	AuditedUser varchar(20),
	AuditedActivity char(1),
	AuditedTime datetime	
	CONSTRAINT fkTestDetailA FOREIGN KEY (TestDetailID) REFERENCES TestDetail(TestDetailID),
	CONSTRAINT fkUserAnswerA FOREIGN KEY (UserAnswerID) REFERENCES UserAnswer(UserAnswerID),
	CONSTRAINT fkTestDetailAnswerA FOREIGN KEY (TestDetailAnswerID) REFERENCES TestDetailAnswer(TestDetailAnswerID)
)