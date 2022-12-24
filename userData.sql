CREATE TABLE [userData].[Table]
(
	[userID] INT NOT NULL PRIMARY KEY IDENTITY(1000, 1), 
    [username] NVARCHAR(50) NOT NULL, 
    [password] NVARCHAR(50) NOT NULL,
    [firstname] NVARCHAR(50) NULL DEFAULT 'John' , 
    [lastname] NVARCHAR(50) NULL DEFAULT 'Doe' , 
    [emailaddress] NVARCHAR(50) NULL DEFAULT 'Unspecified', 
    [gender] NCHAR(10) NULL DEFAULT 'U', 
    [profileimg] NVARCHAR(50) NULL, 
)
