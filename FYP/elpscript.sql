USE [master]
GO
/****** Object:  Database [EL_Professora]    Script Date: 12/7/2020 12:15:21 PM ******/
CREATE DATABASE [EL_Professora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EL_Professora', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYSERVER\MSSQL\DATA\EL_Professora.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EL_Professora_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYSERVER\MSSQL\DATA\EL_Professora_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EL_Professora] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EL_Professora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EL_Professora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EL_Professora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EL_Professora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EL_Professora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EL_Professora] SET ARITHABORT OFF 
GO
ALTER DATABASE [EL_Professora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EL_Professora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EL_Professora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EL_Professora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EL_Professora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EL_Professora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EL_Professora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EL_Professora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EL_Professora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EL_Professora] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EL_Professora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EL_Professora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EL_Professora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EL_Professora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EL_Professora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EL_Professora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EL_Professora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EL_Professora] SET RECOVERY FULL 
GO
ALTER DATABASE [EL_Professora] SET  MULTI_USER 
GO
ALTER DATABASE [EL_Professora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EL_Professora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EL_Professora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EL_Professora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EL_Professora] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EL_Professora', N'ON'
GO
ALTER DATABASE [EL_Professora] SET QUERY_STORE = OFF
GO
USE [EL_Professora]
GO
/****** Object:  Table [dbo].[tbl_Admin]    Script Date: 12/7/2020 12:15:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Announcement]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[instructorID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tbl_announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Assignments]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Assignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NULL,
	[CourseID] [int] NULL,
	[UploadDate] [datetime] NULL,
	[FileName] [varchar](max) NULL,
	[AssignmentTypeId] [int] NULL,
	[AssignmentName] [varchar](50) NULL,
 CONSTRAINT [PK__tbl_Assi__6D16C86D33C65E19] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AssignmentType]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AssignmentType](
	[AssignmentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[image] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Contact]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Message] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Courses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NULL,
	[CategoryID] [int] NULL,
	[Picture] [varchar](max) NULL,
	[InstructorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Instructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Instructors](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Education] [varchar](50) NULL,
	[DateOFBirth] [date] NULL,
	[Status] [bit] NULL,
	[Gender] [bit] NULL,
	[DateOfJoin] [date] NULL,
	[CNIC] [varchar](50) NULL,
	[Picture] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Instructors] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Gender] [bit] NULL,
	[Address] [varchar](100) NULL,
	[Status] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Picture] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AuthUser]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AuthUser]
@Email varchar(50),
@Mobile varchar(50)
as
select * from tbl_user where Email=@Email or Mobile=@Mobile
GO
/****** Object:  StoredProcedure [dbo].[CheckInst]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckInst]
@Email varchar(50),
@Mobile varchar(50),
@CNIC varchar(50)
as
select * from tbl_Instructors where Email=@Email or Mobile=@Mobile or CNIC=@CNIC
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminAuth]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AdminAuth]
@Email varchar(50),
@Password varchar(50)
as
select * from tbl_admin where Email=@Email and Password=@Password
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminInfo]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AdminInfo]
@AdminID int
as
select * from tbl_admin where AdminID=@AdminID

GO
/****** Object:  StoredProcedure [dbo].[sp_Announcement]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_Announcement]
@ID int,
@Name varchar(MAX),
@instructorID int,
@StartDate datetime,
@EndDate datetime,
@Status bit
as
insert into tbl_Announcement values(@Name,@instructorID,@StartDate,@EndDate,@Status)
GO
/****** Object:  StoredProcedure [dbo].[sp_Assignments]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE proc [dbo].[sp_Assignments]    
@AssignmentId int,    
@AssignmentName varchar(50),    
@AssignmentTypeId int,    
@InstructorID int,    
@CourseID int,    
@UploadDate datetime,    
@FileName varchar(max),    
@Isnew bit    
as    
if(@Isnew=1)
BEGIN    
insert into tbl_Assignments values(@InstructorID,@CourseID,@UploadDate,@FileName,@AssignmentTypeId,@AssignmentName)    
 END 
else 
BEGIN   
   
update tbl_Assignments set FileName=@FileName,AssignmentName=@AssignmentName,AssignmentTypeId=@AssignmentTypeId where AssignmentId=@AssignmentId  
END  
GO
/****** Object:  StoredProcedure [dbo].[sp_AuthInst]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AuthInst]
@Email varchar(50),
@Password varchar(50)
as
select * from tbl_Instructors where Email=@Email and Password=@Password
GO
/****** Object:  StoredProcedure [dbo].[sp_CataCount]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CataCount] 
as  
begin  
select COUNT(*) from tbl_Category 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_categname]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_categname]
@CategoryID int
as
select * from tbl_Category where CategoryID=@CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeAnnouncementStatus]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_ChangeAnnouncementStatus]
@InstructorID int
as

declare @status bit =(select Status from tbl_Instructors where InstructorID=@InstructorID)

if(@status=0)
update tbl_Instructors set Status=1  where InstructorID=@InstructorID
else if(@status=1)
update tbl_Instructors set Status=0 where InstructorID=@InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeCategoryStatus]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChangeCategoryStatus]
@CategoryId int
as
select * from tbl_Category where CategoryID=@CategoryId
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeInstructorStatus]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChangeInstructorStatus]
@InstructorID int
as

declare @status bit =(select Status from tbl_Instructors where instructorID=@InstructorID)

if(@status=0)
update tbl_Instructors set Status=1  where instructorID=@InstructorID
else if(@status=1)
update tbl_Instructors set Status=0 where instructorID=@InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_changestatus]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_changestatus]
@User_ID int

as
declare @Status bit=(select Status from tbl_user where User_ID=@User_ID)

if(@Status=1)
update tbl_user set Status=0 where User_ID=@User_ID
 else
 update tbl_user set Status=1 where User_ID=@User_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_Contact]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_Contact]  
@Name varchar(50),  
@Email varchar(50),  
@Mobile varchar(50),  
@Message varchar(max)  
as  
insert into tbl_Contact values(@Name,@Email,@Mobile,@Message)
GO
/****** Object:  StoredProcedure [dbo].[sp_CountInst]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CountInst]
as 
select count(*) from tbl_Instructors   
GO
/****** Object:  StoredProcedure [dbo].[sp_courcecategory]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_courcecategory]
as
select * from tbl_Category

GO
/****** Object:  StoredProcedure [dbo].[sp_CourseCategory]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CourseCategory]
as
select * from tbl_Category

GO
/****** Object:  StoredProcedure [dbo].[sp_coursecount]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_coursecount]
as
select count(*) from tbl_Courses
GO
/****** Object:  StoredProcedure [dbo].[sp_CoursesByCategoryId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_CoursesByCategoryId]
@CategoryID int
as
select c.*,ct.CategoryName from tbl_Courses c inner join tbl_Category ct on c.CategoryID=ct.CategoryID  
where c.CategoryID=@CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAnnouncement]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_DeleteAnnouncement]
@ID int
as
delete from tbl_announcement where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteCategory]
@CategoryID int
as
delete from tbl_Category where CategoryID=@CategoryID

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCourse]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteCourse]
@CourseId int
as
delete from tbl_Courses where CourseId=@CourseId
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteFavInstructor]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteFavInstructor]
@InstructorId int,
@StudentId int
as
delete from tbl_FollowInstructor where InstructorId=@InstructorId and StudentId=@StudentId
GO
/****** Object:  StoredProcedure [dbo].[sp_deletefavrtinstr]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_deletefavrtinstr]
@User_ID int,
@instructorID int
as
delete from favorite where InstructorID=@instructorID and User_ID=@User_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteInstructor]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_deleteInstructor]
@InstructorID int
as
delete from tbl_Instructors where instructorID=@InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_deletestd]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_deletestd]
@instructorID int,
@User_ID int
as

delete from favorite where User_ID=@User_ID and InstructorID=@instructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteuser]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_deleteuser]
@User_ID int
as
delete from tbl_user where User_ID=@User_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_favorite]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_favorite]

@InstructorID int,
@User_ID int
as

select * from tbl_addinstructors i inner join 
tbl_user u on i.instructorID=@InstructorID where u.User_ID=@User_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_FollowCourse]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FollowCourse] --1,1,1
@FollowCourseId int=0,
@StudentId int=0,
@CourseId int=0
as
if(@FollowCourseId=0)
insert into tbl_FollowCourse values(@StudentId,@CourseId)
else
delete from tbl_FollowCourse where FollowCourseId=@FollowCourseId
GO
/****** Object:  StoredProcedure [dbo].[sp_FollowInstructor]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FollowInstructor] --1,1,1
@FollowInstuctorId int=0,
@StudentId int=0,
@InstructorId int=0
as
if(@FollowInstuctorId=0)
insert into tbl_FollowInstructor values(@StudentId,@InstructorId)
else
delete from tbl_FollowInstructor where FollowInstuctorId=@FollowInstuctorId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAnnouncements]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GetAllAnnouncements] 
@instructorID int = null
as
if(@instructorID is not null)
select *,case when Status=1 then 'Active' else 'End' end as
 newstatus from tbl_Announcement
 where instructorID=@instructorID

 else
 select i.FirstName+' '+i.LastName as fullname,a.*,case when a.Status=1 then 'Active' else 'End' end as
 newstatus from tbl_Announcement a inner join tbl_Instructors i on a.instructorID=i.instructorID 


GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCata]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllCata]
as 
select * from tbl_Category
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAllCourses]    
@CategoryId int=null,    
@InstructorId int=null,  
@Record int
as    
select * from tbl_Courses as c inner join    
tbl_Category as ca on c.CategoryID=ca.CategoryID inner join    
tbl_Instructors as i on c.InstructorID=i.InstructorID    
    
where (@CategoryId is null or c.CategoryID=@CategoryId) and    
(@InstructorId is null or c.InstructorId=@InstructorId) order by c.CourseId offset @Record  rows fetch next 6 rows only
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllInstructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAllInstructors]
as 
select a.FirstName+' '+a.lastName as FullName,* from tbl_Instructors as a
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GetAllUsers]
as
select *,FirstName+' '+LastName as UserName,case when Gender=1 then 'Male' else 'Female'end as usergender 
from tbl_user
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAnnouncements]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAnnouncements]  --'2020/10/27',1
@EndDate varchar(50)
as
select a.Name,i.FirstName+' '+i.LastName as FullName, a.Status,a.EndDate from tbl_Announcement a inner join
tbl_Instructors i on a.instructorID=i.InstructorID

 where a.Status=1 and EndDate>=@EndDate
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssignmentCount]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAssignmentCount]  
@CourseId int
as    
select count(AssignmentId) as Total from tbl_Assignments
where CourseId=@CourseId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssignments]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAssignments]    
@AssignmentId int=null,    
@InstructorId int=null ,
@CourseId int=null   
as    
select a.*,c.CategoryName,cc.CourseName from tbl_Assignments a inner join    
tbl_Courses cc on a.CourseID=cc.CourseID  inner join    
tbl_Category c on cc.CategoryID=c.CategoryID   
  
    
where (@AssignmentId is null or AssignmentId=@AssignmentId) and     
(@InstructorId is null or a.InstructorId=@InstructorId) and
(@CourseId is null or a.CourseId=@CourseId)
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCataType]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetCataType]
as
select * from tbl_AssignmentType
GO
/****** Object:  StoredProcedure [dbo].[sp_getcities]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_getcities]
@Country_ID int
as
select * from tbl_city where Country_ID=@Country_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_getcountries]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_getcountries]
as
select * from tbl_country
GO
/****** Object:  StoredProcedure [dbo].[sp_getcourse]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_getcourse]
as
select count (*) as courseid from tbl_AddCources
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourseByCourseId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetCourseByCourseId]  
@CourseId int  
as  
select c.*,ct.CategoryName,i.FirstName+' '+i.LastName as FullName from tbl_Courses c inner join 
tbl_Category ct on c.CategoryID=ct.CategoryID inner join
tbl_Instructors i on c.InstructorID=i.InstructorID   
where c.CourseId=@CourseId  
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetCourses]
@CategoryID int
as
select c.*,ct.CategoryName from tbl_Courses c inner join tbl_Category ct on c.CategoryID=ct.CategoryID  
where c.CategoryID=@CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesAssignmntBYCataID]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetCoursesAssignmntBYCataID]  
@CategoryID int,
@Record int    
as    
select a.*,c.CategoryName,c.CategoryID,cc.CourseName from tbl_Assignments a inner join        
tbl_Courses cc on a.CourseID=cc.CourseID  inner join        
tbl_Category c on c.CategoryID=@CategoryID  order by a.AssignmentId offset @Record  rows fetch next 6 rows only
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesByCategoryId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_GetCoursesByCategoryId]
@CategoryID int
as
select c.*,ct.CategoryName from tbl_Courses c inner join tbl_Category ct on c.CategoryID=ct.CategoryID  
where c.CategoryID=@CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesByCourseId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetCoursesByCourseId]
@CoursesId int
as
select * from tbl_Courses where CourseID=@CoursesId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFavCourse]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetFavCourse]
@UserId int
as
select c.CourseName,c.Picture from tbl_FollowCourse f inner join 
tbl_Courses c on c.CourseId=f.CourseId
where f.StudentId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFavInst]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_GetFavInst]
@UserId int
as
select i.FirstName+' '+i.lastName as FullName,i.Picture,f.InstructorID from tbl_FollowInstructor f 
inner join 
tbl_Instructors i on f.InstructorID=i.instructorID 
where f.StudentId=@UserID  
GO
/****** Object:  StoredProcedure [dbo].[sp_getfvrtinstr]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_getfvrtinstr]
@USerID int 
as

select i.FirstName+' '+i.lastName as FullName,c.CourceName,i.Picture,f.InstructorID from favorite f inner join tbl_addinstructors i on f.InstructorID=i.instructorID
inner join tbl_AddCources c on i.CourceID=c.CourceID where f.User_ID=@USerID

GO
/****** Object:  StoredProcedure [dbo].[sp_getinfo]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_getinfo]
as

select (select count(*) from tbl_Courses) as courses,(select count(*) from tbl_Instructors where Status=1) as instructors,(select count(*) from tbl_Courses) as students
GO
/****** Object:  StoredProcedure [dbo].[sp_getinstr]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_getinstr]
as
select count (*) as instrid from tbl_addinstructors
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInstructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GetInstructors]  
as  
select i.*, FirstName+' '+LastName as FullName ,case when i.status =1 then 'Available' else 'Unavailable' end as   
newStatus,case when gender =1 then 'Male' else 'Female' end as newGender from tbl_Instructors i  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_getmyuploads]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[sp_getmyuploads]

@InstructorID int

as

select u.*,c.CategoryName,ac.CourceName from tbl_AssigmentUpload u 
inner join tbl_Category c on u.CategoryID=c.CategoryID inner join tbl_AddCources ac on u.CourceID=ac.CourceID

where u.InstructorID=@InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsByInstructorId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_GetStudentsByInstructorId]
@instructorID int
as

select u.FirstName+' '+u.lastName as FullName,u.Mobile,u.Email,u.Picture,u.Address, case when u.Gender=1 then 'Male' else 'Female'
 end as newGender from tbl_FollowInstructor f 
inner join tbl_User u on f.StudentId=u.User_ID where f.instructorID=@instructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_getuploads]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_getuploads]
@UploadID int
as
select i.FirstName+' '+i.LastName as FullName,c.CourceName,u.FileName,u.UploadDate from tbl_AssigmentUpload u
inner join tbl_addinstructors i on u.InstructorID=i.instructorID
inner join tbl_AddCources c on u.CourceID=c.CourceID where u.UploadID=@UploadID
GO
/****** Object:  StoredProcedure [dbo].[sp_getusers]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_getusers]
as
select count (*) as userid from tbl_user
GO
/****** Object:  StoredProcedure [dbo].[sp_instdata]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_instdata]
as
select ROW_NUMBER() over (order by a.UploadID) as RNO,a.*,c.Courcename,i.firstname+' '+i.LastName as Fullname,c.Picture as courceimg from tbl_AssigmentUpload a inner join tbl_addinstructors i

on a.InstructorID=i.instructorID inner join tbl_AddCources c on a.CourceID=c.CourceID
GO
/****** Object:  StoredProcedure [dbo].[sp_instructorbycourseid]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_instructorbycourseid] --1,1
@Courseid int,
@UserId int
as
declare @c int=(select count(*) as userid from favorite where User_ID=@UserId and CourseId=@Courseid)
if(@c!>0)
select i.*,FirstName+' '+Lastname as fullname,c.CourceName from tbl_addinstructors i inner join tbl_AddCources c
on i.CourceID=c.CourceID where i.CourceID=@Courseid
GO
/****** Object:  StoredProcedure [dbo].[sp_InstructorID]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InstructorID]
@instructorID int
as
select * from tbl_addinstructors where instructorID=@instructorID

GO
/****** Object:  StoredProcedure [dbo].[sp_InstructorProfile]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InstructorProfile] 
@instructorID int 
as
select *,FirstName+' '+LastName as fullname from tbl_instructors where instructorID=@instructorID

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadAssigmentType]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_LoadAssigmentType]
as
select * from tbl_AssignmentType 

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadAssignments]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_LoadAssignments]
@InstructorId int
as


select ROW_NUMBER() over (order by a.AssignmentId) as RNO,a.*,c.Coursename,i.firstname+' '+i.LastName as
 Fullname,c.CourseName from tbl_Assignments a inner join tbl_Instructors i

on a.InstructorID=i.instructorID inner join tbl_Courses c on a.CourseID=c.CourseID

 where a.InstructorID=@InstructorId and AssignmentID=2

 
select ROW_NUMBER() over (order by a.AssignmentId) as RNO,a.*,c.Coursename,i.firstname+' '+i.LastName as
 Fullname,c.CourseName from tbl_Assignments a inner join tbl_Instructors i

on a.InstructorID=i.instructorID inner join tbl_Courses c on a.CourseID=c.CourseID

 where a.InstructorID=@InstructorId and AssignmentID=1

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadCourseByCategoryId]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_LoadCourseByCategoryId]
@CategoryID int
As
select * from tbl_Courses where CategoryID=@CategoryID

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadInstructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_LoadInstructors]
as
select top(6)* from tbl_Instructors
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadTopCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_LoadTopCourses]
as

select top(6) * from tbl_Courses as co inner join
tbl_Category as c on co.CategoryID=c.CategoryID  inner join
tbl_Instructors as i on co.InstructorID=i.InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_login]
@Email varchar(50),
@Password varchar(50)
as
select * from tbl_user where Email=@Email and Password=@Password
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveAdmin]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SaveAdmin]
@AdminID int = null,
@AdminName varchar(50),
@Email varchar(50),
@Password varchar(50),
@Mobile varchar(50),
@Image varchar(Max),
@IsNew bit
as
if(@IsNew=1)
	insert into tbl_admin values(@AdminName,@Email,@Password,@Mobile,@Image)
else
	update tbl_admin set AdminName=@AdminName, Email=@Email,Password=@Password, Mobile=@Mobile, Image=@Image where AdminID=@AdminID

GO
/****** Object:  StoredProcedure [dbo].[sp_Savecategory]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Savecategory]
@CategoryID int,
@Isnew bit,
@CategoryName varchar(50),
@image varchar(100)
as

if(@Isnew=1)
insert into tbl_Category values(@CategoryName,@image)

else

update tbl_Category set CategoryName=@CategoryName,image=@image where CategoryID=@CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SaveCourses]
@CourseName varchar(50),
@CategoryID int,
@Picture varchar(Max),
@IsNew bit,
@CourseID int,
@InstructorID int

as

if(@IsNew=1)
insert into tbl_Courses values(@CourseName,@CategoryID,@Picture,@InstructorID)
else

update tbl_Courses set CourseName=@CourseName,CategoryID=@CategoryID,Picture=@Picture,InstructorID=@InstructorID where CourseID=@CourseID

GO
/****** Object:  StoredProcedure [dbo].[sp_savefavrt]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_savefavrt]
@instructorID int,
@User_ID int,
@CourseId int
as
insert into favorite values(@instructorID,@User_ID,@CourseId)

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveInstructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_SaveInstructors]    
@InstructorID int,    
@FirstName varchar(50),    
@LastName varchar(50),    
@Email varchar(50),    
@Password varchar(50),    
@Mobile varchar(50),    
@Address varchar(100),    
@Education varchar(50),    
@DateOfBirth date,    
@Status bit=null,    
@Gender bit,    
@DateOfJoin date=null,        
@CNIC varchar(50),    
@Picture varchar(MAX),    
@IsNew bit    
    
as    
if(@IsNew=1)    
insert into tbl_Instructors values(@FirstName,@LastName,@Email,@Password,    
@Mobile,@Address,@Education,@DateOfBirth,@Status,@Gender,@DateOfJoin,@CNIC,@Picture)    
else    
update tbl_Instructors set FirstName=@FirstName, LastName=@LastName,Email=@Email,    
Password=@Password,Mobile=@Mobile,Address=@Address,Education=@Education,    
DateOFBirth=@DateOfBirth,Gender=Gender,    
CNIC=@CNIC,Picture=@Picture where InstructorID=@InstructorID  

GO
/****** Object:  StoredProcedure [dbo].[sp_showCategory]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_showCategory]
as
select * from tbl_Category 

GO
/****** Object:  StoredProcedure [dbo].[sp_ShowCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[sp_ShowCourses]  
  @InstructorId int=null
as  
select c.*,ct.CategoryName from tbl_Courses c inner join tbl_Category ct on c.CategoryID=ct.CategoryID    

where (@InstructorId is null or c.InstructorId=@InstructorId)
  
GO
/****** Object:  StoredProcedure [dbo].[sp_ShowCoursess]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ShowCoursess]
as  
select * from tbl_Courses as a inner join tbl_Category  as b on a.CategoryID=b.CategoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_sp_CountInst]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sp_CountInst]   
as    
begin    
select COUNT(*) from tbl_Instructors   
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_TopCata]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TopCata]  
as   
select top(4) c.CourseID,c.CourseName,c.Picture,c.CategoryID,cc.CategoryName,cc.image,i.FirstName,
i.LastName  from tbl_Courses as c inner join tbl_Category as cc
on c.CategoryID=cc.CategoryID inner join tbl_Instructors as i on i.InstructorID=c.InstructorID
GO
/****** Object:  StoredProcedure [dbo].[sp_Topcatapager]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_Topcatapager]   
@rec int     
as     
begin    
select * from tbl_Category order by CategoryID offset @rec  rows fetch next 6 rows only    
end    
GO
/****** Object:  StoredProcedure [dbo].[sp_TopCourses]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TopCourses]
as
select top(15) * from tbl_Courses order by CourseId desc
GO
/****** Object:  StoredProcedure [dbo].[sp_TopIns]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TopIns]     
@rec int       
as       
begin      
select * from tbl_Instructors order by InstructorID offset @rec  rows fetch next 6 rows only      
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TopInstructors]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TopInstructors]
as
select top(15) *,firstname+' '+lastname as fullname from tbl_Instructors where status=1 order by instructorID desc
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAssignments]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE proc [dbo].[sp_UpdateAssignments] --2,'so',2,'C__Users_Rizwan khan_Desktop_El_Proffesora_El_Proffesora_Admin_UploadFiles_8.mp4'  
@AssignmentId int,    
@AssignmentName varchar(50),    
@AssignmentTypeId int,
@FileName nvarchar(max)  
as    

update tbl_Assignments set FileName=@FileName,AssignmentName=@AssignmentName,AssignmentTypeId=@AssignmentTypeId where AssignmentId=@AssignmentId  
 
GO
/****** Object:  StoredProcedure [dbo].[sp_user]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_user]
@FirstName varchar(50),
@LastName varchar(50),
@Address varchar(50),
@Mobile varchar(50),
@Gender bit,
@Email varchar(50),
@Password varchar(50),
@Status bit,
@Picture varchar(MAX),
@User_ID int=null,
@IsNew bit
as

if(@IsNew=1)
insert into tbl_user values(@FirstName,@LastName,@Mobile,@Gender,@Address,@Status,@Email,
@Password,@Picture)

else

update tbl_user set FirstName=@FirstName,LastName=@LastName,Mobile=@Mobile,Address=@Address,Email=@Email,
Password=@Password,Gender=@Gender,Picture=@Picture where User_ID=@User_ID

GO
/****** Object:  StoredProcedure [dbo].[sp_userprofile]    Script Date: 12/7/2020 12:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_userprofile]
@ID int
as
select u.*,FirstName+' '+LastName as Name, case when Gender=1 then'Male' else 'Female'
 end as uGender from tbl_user u where u.User_ID=@ID
GO
USE [master]
GO
ALTER DATABASE [EL_Professora] SET  READ_WRITE 
GO
