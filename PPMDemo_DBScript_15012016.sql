USE [master]
GO
/****** Object:  Database [PPMDemo]    Script Date: 15-01-2017 21:43:25 ******/
CREATE DATABASE [PPMDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPMDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PPMDemo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PPMDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PPMDemo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PPMDemo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPMDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPMDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPMDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPMDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPMDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPMDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPMDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PPMDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPMDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPMDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPMDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPMDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPMDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPMDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPMDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPMDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PPMDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPMDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPMDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPMDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPMDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPMDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PPMDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPMDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PPMDemo] SET  MULTI_USER 
GO
ALTER DATABASE [PPMDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPMDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPMDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPMDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PPMDemo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PPMDemo]
GO
/****** Object:  Table [dbo].[Checklist]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checklist](
	[checklist_id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_name] [nvarchar](100) NULL,
	[checklist_version] [nvarchar](50) NULL,
	[checklist_created_on_date] [date] NULL,
	[checklist_created_by] [nvarchar](100) NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Checklist] PRIMARY KEY CLUSTERED 
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Checklist_Question]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checklist_Question](
	[checklist_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[sort_order] [int] NOT NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Checklist_Questions_Mapping] PRIMARY KEY CLUSTERED 
(
	[checklist_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_code] [nvarchar](100) NULL,
	[department_name] [nvarchar](300) NULL,
	[department_head] [int] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_code] [nvarchar](100) NOT NULL,
	[equipment_name] [nvarchar](100) NULL,
	[equipment_description] [nvarchar](500) NULL,
	[department_id] [int] NOT NULL,
	[unit_id] [int] NOT NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Equipment_Master] PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Completion_Details]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Completion_Details](
	[completion_event_id] [int] IDENTITY(1,1) NOT NULL,
	[ppm_event_id] [int] NULL,
	[actual_week] [int] NULL,
	[actual_year] [char](4) NULL,
	[job_completion_date] [date] NULL,
	[job_completed_by] [nvarchar](100) NULL,
	[approved_by] [nvarchar](100) NULL,
	[approved_on_date] [date] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Job_Completion_Details] PRIMARY KEY CLUSTERED 
(
	[completion_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[user_name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NULL,
	[user_id] [int] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PPM_Schedule]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PPM_Schedule](
	[ppm_event_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_id] [nvarchar](100) NULL,
	[from_year] [char](4) NULL,
	[to_year] [char](4) NULL,
	[scheduled_week] [int] NULL,
	[scheduled_date] [date] NULL,
	[checklist_id] [int] NULL,
	[approved_by] [nvarchar](100) NULL,
	[approval_date] [date] NULL,
	[requested_by] [nvarchar](100) NULL,
	[requested_date] [date] NULL,
	[ppm_event_frequency] [char](1) NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_PPM_Schedule] PRIMARY KEY CLUSTERED 
(
	[ppm_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[display_text] [nvarchar](500) NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Checklist_Questions] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions_Options]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Options](
	[option_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[option_text] [nvarchar](100) NULL,
	[option_type] [nvarchar](50) NULL,
	[sort_order] [int] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Responses_Master] PRIMARY KEY CLUSTERED 
(
	[option_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Response]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[response_id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[ppm_event_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[response_description] [nvarchar](500) NULL,
	[user_id] [int] NOT NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Checklist_Responses] PRIMARY KEY CLUSTERED 
(
	[response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[unit_id] [int] IDENTITY(1,1) NOT NULL,
	[unit_code] [nvarchar](100) NULL,
	[unit_name] [nvarchar](300) NULL,
	[unit_location] [nvarchar](100) NULL,
	[address_line1] [nvarchar](100) NULL,
	[address_line2] [nvarchar](100) NULL,
	[landmark] [nvarchar](100) NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[state] [nvarchar](100) NULL,
	[pin] [nvarchar](6) NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] NOT NULL,
	[employee_id] [nvarchar](100) NULL,
	[first_name] [nvarchar](100) NULL,
	[middle_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[common_name] [nvarchar](300) NULL,
	[role] [nvarchar](100) NULL,
	[reporting_manager] [int] NULL,
	[department_id] [int] NULL,
	[unit_id] [int] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Weeks_Details]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weeks_Details](
	[year] [int] NOT NULL,
	[week_id] [int] NOT NULL,
	[month] [nvarchar](50) NOT NULL,
	[week_start_date] [datetime] NULL,
	[week_end_date] [datetime] NULL,
	[creation_datetime] [datetime] NULL,
	[last_modified_datetime] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_PPMEventsByWeek] PRIMARY KEY CLUSTERED 
(
	[year] ASC,
	[week_id] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PPM_Schedule]    Script Date: 15-01-2017 21:43:25 ******/
CREATE NONCLUSTERED INDEX [IX_PPM_Schedule] ON [dbo].[PPM_Schedule]
(
	[equipment_id] ASC,
	[from_year] ASC,
	[to_year] ASC,
	[scheduled_week] ASC,
	[scheduled_date] ASC,
	[checklist_id] ASC,
	[ppm_event_frequency] ASC,
	[is_active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 15-01-2017 21:43:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Checklist_Question]  WITH CHECK ADD  CONSTRAINT [FK_Checklist_Questions_Mapping_Checklist_Details] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Checklist] ([checklist_id])
GO
ALTER TABLE [dbo].[Checklist_Question] CHECK CONSTRAINT [FK_Checklist_Questions_Mapping_Checklist_Details]
GO
ALTER TABLE [dbo].[Checklist_Question]  WITH CHECK ADD  CONSTRAINT [FK_Checklist_Questions_Mapping_Questions_Master] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[Checklist_Question] CHECK CONSTRAINT [FK_Checklist_Questions_Mapping_Questions_Master]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Department]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Unit] ([unit_id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Unit]
GO
ALTER TABLE [dbo].[Job_Completion_Details]  WITH CHECK ADD  CONSTRAINT [FK_Job_Completion_Details_PPM_Schedule] FOREIGN KEY([ppm_event_id])
REFERENCES [dbo].[PPM_Schedule] ([ppm_event_id])
GO
ALTER TABLE [dbo].[Job_Completion_Details] CHECK CONSTRAINT [FK_Job_Completion_Details_PPM_Schedule]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_User]
GO
ALTER TABLE [dbo].[PPM_Schedule]  WITH CHECK ADD  CONSTRAINT [FK_PPM_Schedule_Checklist] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Checklist] ([checklist_id])
GO
ALTER TABLE [dbo].[PPM_Schedule] CHECK CONSTRAINT [FK_PPM_Schedule_Checklist]
GO
ALTER TABLE [dbo].[Questions_Options]  WITH CHECK ADD  CONSTRAINT [FK_Responses_Master_Questions_Master] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[Questions_Options] CHECK CONSTRAINT [FK_Responses_Master_Questions_Master]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Checklist] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Checklist] ([checklist_id])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Checklist]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_PPM_Schedule] FOREIGN KEY([ppm_event_id])
REFERENCES [dbo].[PPM_Schedule] ([ppm_event_id])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_PPM_Schedule]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Question]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Unit] ([unit_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Unit]
GO
/****** Object:  StoredProcedure [dbo].[CreateEquipmentWisePPMPlanner]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CreateEquipmentWisePPMPlanner]

@equipment_id nvarchar(100),
           @from_year char(4),
           @to_year char(4),
       
           @checklist_m_id int, -- checklist for every event, other than half-yearly and annual events
		   @checklist_s_id int, -- checklist for half-yearly event
		   @checklist_a_id int, -- checklist for annual event
           @requested_by nvarchar(100),
           @requested_date date,
           @ppm_event_frequency char(1)
as           
Declare @ctr int
declare @weeksd date
declare @maxcount int
declare @week_of_the_year int
declare @start_date date
declare @end_date date

SET @ctr=1
--IF @ppm_event_frequency = 'M'
--set @maxcount=12

--else if @ppm_event_frequency = 'W'
--SELECT @maxcount=max(week_id) from Weeks_Details where year= @from_year

SET @start_date = CAST(@from_year AS VARCHAR)+ '/01/01'
SET @end_date = CAST(@from_year AS VARCHAR) + '/12/31'


EXEC @maxcount= [dbo].[GetCountOfWeeksBetweenDates] @start_date,@end_date,@maxcount OUTPUT


PRINT @maxcount

DECLARE @last_PPM_Event date
select @last_PPM_Event=max(scheduled_date) from [dbo].[PPM_Schedule] where from_year=@from_year-1 AND [equipment_id] = @equipment_id
PRINT concat('Last PPM Event is ', @last_PPM_Event)

IF @last_PPM_Event is null
	Begin
		select @weeksd = week_start_date from Weeks_Details where year=@from_year and week_id=@ctr
		
	end
	else
	begin
		if @ppm_event_frequency = 'M'
		begin
			Set @weeksd= DATEADD(week,4, @last_PPM_Event)
			PRINT concat('Week start date is ', @weeksd)
		end
		else if @ppm_event_frequency = 'W'
		begin
			Set @weeksd= DATEADD(week,1, @last_PPM_Event)
		end 
	
	end


update [dbo].[PPM_Schedule] set is_active=0 where year([scheduled_date])=@from_year

declare @checklist int
declare @flag int
set @checklist=@checklist_m_id
set @flag=1
	
 

while @ctr<=@maxcount and year(@weeksd)=@from_year
begin



--	select @weeksd = week_start_date from Weeks_Details where year=@from_year and week_id=@ctr
	SET @week_of_the_year=DATEPART(week,@weeksd)

		if @week_of_the_year>=24 and @flag=1
			begin
				set @checklist=@checklist_s_id
				set @flag=0
			end
		else if @week_of_the_year>=52 and @flag=0
			begin
				set @checklist=@checklist_a_id
				set @flag=1
			end
		else
			begin
				set @checklist=@checklist_m_id
			end








	Print @ctr
	INSERT INTO [dbo].[PPM_Schedule]
           ([equipment_id]
           ,[from_year]
           ,[to_year]
           ,[scheduled_week]
           ,[scheduled_date]
           ,[checklist_id]
           ,[approved_by]
           ,[approval_date]
           ,[requested_by]
           ,[requested_date]
           ,[ppm_event_frequency]
           ,[creation_datetime]
           ,[last_modified_datetime]
           ,[is_active])
     VALUES
           (@equipment_id,
           @from_year
           ,@to_year
           --,@ctr
		   ,@week_of_the_year
           ,@weeksd
           ,@checklist
           ,null
           ,null
           ,@requested_by
           ,@requested_date
           ,@ppm_event_frequency
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP
           ,1)

	Set @last_PPM_Event=@weeksd

if @ppm_event_frequency = 'M'
	begin
		Set @ctr=@ctr+4
		
		Set @weeksd= DATEADD(week,4, @last_PPM_Event)


	end
	
	else if @ppm_event_frequency = 'W'
	Begin
		Set @ctr=@ctr+1
		Set @weeksd= DATEADD(week,1, @last_PPM_Event)
	End
	
end





GO
/****** Object:  StoredProcedure [dbo].[GetChecklistQuestionsOptions]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetChecklistQuestionsOptions]
@checklist_id int
as

select cq.checklist_id,cq.question_id,q.display_text,Qo.option_id,Qo.option_text,Qo.option_type,Qo.sort_order from Checklist_Question CQ, Question Q, Questions_Options QO
where CQ.question_id=Q.question_id and cq.question_id=Qo.question_id and checklist_id=@checklist_id
GO
/****** Object:  StoredProcedure [dbo].[GetChecklistQuestionsOptions_Not_In_Use]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetChecklistQuestionsOptions_Not_In_Use]
@checklist_id int,
@question_id int
as
--Search and return records for the given checklist_id and question_id combination
if @checklist_id>0 AND @question_id>0
select cd.checklist_id,cd.checklist_name,cqm.question_id,qm.display_text,rm.response_id,rm.response_text,rm.response_type from 
Checklist_Details CD, Checklist_Questions_Mapping CQM, Questions_Master QM, Questions_Options RM
where cd.checklist_id=cqm.checklist_id and cqm.question_id=qm.question_id and qm.question_id=rm.question_id
and CD.checklist_id=@checklist_id and cqm.question_id=@question_id and CD.is_active=1 and cqm.is_active=1 and qm.is_active=1 and rm.is_active=1
--Search and return records from all checklists with matching question_id
else if @checklist_id=0 AND @question_id>0
select cd.checklist_id,cd.checklist_name,cqm.question_id,qm.display_text,rm.response_id,rm.response_text,rm.response_type from 
Checklist_Details CD, Checklist_Questions_Mapping CQM, Questions_Master QM, Questions_Options RM
where cd.checklist_id=cqm.checklist_id and cqm.question_id=qm.question_id and qm.question_id=rm.question_id
and cqm.question_id=@question_id and CD.is_active=1 and cqm.is_active=1 and qm.is_active=1 and rm.is_active=1
--Search and return all active questions from the given checklist_id
else if @checklist_id>0 AND @question_id=0
select cd.checklist_id,cd.checklist_name,cqm.question_id,qm.display_text,rm.response_id,rm.response_text,rm.response_type from 
Checklist_Details CD, Checklist_Questions_Mapping CQM, Questions_Master QM, Questions_Options RM
where cd.checklist_id=cqm.checklist_id and cqm.question_id=qm.question_id and qm.question_id=rm.question_id
and CD.checklist_id=@checklist_id  and CD.is_active=1 and cqm.is_active=1 and qm.is_active=1 and rm.is_active=1

--Search and return all checklists and all questions from checklists

else if @checklist_id=0 AND @question_id=0
select cd.checklist_id,cd.checklist_name,cqm.question_id,qm.display_text,rm.response_id,rm.response_text,rm.response_type from 
Checklist_Details CD, Checklist_Questions_Mapping CQM, Questions_Master QM, Questions_Options RM
where cd.checklist_id=cqm.checklist_id and cqm.question_id=qm.question_id and qm.question_id=rm.question_id
and CD.is_active=1 and cqm.is_active=1 and qm.is_active=1 and rm.is_active=1



GO
/****** Object:  StoredProcedure [dbo].[GetCountOfWeeksBetweenDates]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create proc [dbo].[GetCountOfWeeksBetweenDates]
	
	@StartDate datetime,
	@EndDate datetime,
--	@frequency char,
	@count int OUTPUT
	as

	Declare @ctr int
	
	Declare @add_days int
	
	SET @add_days=7

	


--if @frequency='W' select @add_days=7
--if @frequency='F' select @add_days=15
--if @frequency='M' select @add_days=30
--if @frequency='S' select @add_days=180
	SET @ctr = 0

	WHILE @enddate >= @startdate
	BEGIN

		SET @ctr = @ctr + 1
		SET @startdate = @startdate + @add_days
	END
	SET @count=@ctr
	RETURN @count
	--select * from #TblTemp
	--drop table #TblTemp
GO
/****** Object:  StoredProcedure [dbo].[GetEquipmentYearPPMEvents]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetEquipmentYearPPMEvents]

@equipment_id nvarchar(100),
@from_year char(4)
as
select scheduled_week from PPM_Schedule
where [equipment_id]=@equipment_id and from_year=@from_year
GO
/****** Object:  StoredProcedure [dbo].[GetJobCompletionDetails]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetJobCompletionDetails]
@equipment_id nvarchar(100),
@year char(4)
as
select Ps.ppm_event_id,PS.equipment_id,PS.from_year,Ps.scheduled_week,jc.actual_year, jc.actual_week,ps.scheduled_date,jc.job_completion_date,ps.checklist_id,ppm_event_frequency,ps.approved_by,ps.approval_date,jc.approved_by,jc.approved_on_date,jc.job_completed_by from PPM_Schedule PS, Job_Completion_Details JC where PS.ppm_event_id=JC.ppm_event_id And equipment_id=@equipment_id and from_year=@year

GO
/****** Object:  StoredProcedure [dbo].[GetMonthWiseWeeksCount]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMonthWiseWeeksCount]
@year char(4)
as


select month Month,count(*) WeeksCount from [dbo].[Weeks_Details] where year=@year group by month 
GO
/****** Object:  StoredProcedure [dbo].[GetPendingJobs]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPendingJobs]
@equipment_id nvarchar(100),
@year nvarchar(4)
as
select * from PPM_Schedule where ppm_event_id not in (select jc.ppm_event_id from PPM_Schedule PS, Job_Completion_Details JC
where PS.ppm_event_id=JC.ppm_event_id and ps.equipment_id=@equipment_id and from_year=@year) 
and equipment_id=@equipment_id and from_year=@year
 order by scheduled_week
GO
/****** Object:  StoredProcedure [dbo].[GetYearlyPPMEventsByFrequency]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetYearlyPPMEventsByFrequency]

@StartDate datetime
,@EndDate datetime
,@frequency char
as
begin


declare @add_days int
	declare @ctr int
	declare @year int
if @frequency='W' select @add_days=7
if @frequency='F' select @add_days=15
if @frequency='M' select @add_days=30
if @frequency='S' select @add_days=180

--	create table #TblTemp(EVENTID  INT, YEAR  INT, Month nvarchar(50),STARTDATE  DATETIME, ENDDATE DATETIME)
	
--	SET @startdate = CAST(@year AS VARCHAR)+ '/02/01'
	--SET @enddate = CAST(@year AS VARCHAR) + '/12/31'
	--SET @startdate = '2016/02/01'
	--SET @enddate = '2016/12/31'
	
	
	SET @year=year(@startdate)
	SET @ctr = 0
	Delete Weeks_Details WHERE [YEAR]=(select year(@startdate))
	WHILE @enddate >= @startdate
	BEGIN

		SET @ctr = @ctr + 1
		
	--	INSERT INTO #TblTemp
		INSERT INTO [dbo].Weeks_Details
		values(year(@startdate),@ctr,DateName( month , DateAdd( month , month(@startdate) , 0 ) - 1 ),  @startdate, @startdate + 6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,1)
		
		SET @startdate = @startdate + @add_days
	END
	SELECT * FROM Weeks_Details WHERE [YEAR]=@year
	--select * from #TblTemp
	--drop table #TblTemp
end

GO
/****** Object:  StoredProcedure [dbo].[ReplicateChecklist]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ReplicateChecklist] 
@checklist_existing_id int,
@checklist_version nvarchar(50),
@checklist_name nvarchar(100),
           
		   @checklist_created_by nvarchar(100)
		   as


INSERT INTO [dbo].[Checklist_Details]
           ([checklist_name]
           ,[checklist_version]
           ,[checklist_created_on_date]
           ,[checklist_created_by]
           ,[creation_datetime]
           ,[last_modified_datetime]
           ,[is_active])
     VALUES
           (@checklist_name,
           @checklist_version,
           CURRENT_TIMESTAMP
           ,@checklist_created_by
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP
           ,1)

Declare @checklist_new_id int

select @checklist_new_id = SCOPE_IDENTITY() 


Insert into checklist_questions_mapping
select @checklist_new_id,question_id,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,1 from Checklist_Questions_Mapping


GO
/****** Object:  StoredProcedure [dbo].[SetChecklistResponses]    Script Date: 15-01-2017 21:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SetChecklistResponses]
@ppm_event_id int,
@checklist_id int,
@question_id int,
@responses_id int
as
INSERT INTO [dbo].[Checklist_Responses]
           ([ppm_event_id]
           ,[checklist_id]
           ,[question_id]
           ,[responses_id]
           
           ,[creation_datetime]
           ,[last_modified_datetime]
           ,[is_active])
     VALUES
           (@ppm_event_id,
           @checklist_id,
           @question_id, 
           @responses_id,
           CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP
           ,1)

GO
USE [master]
GO
ALTER DATABASE [PPMDemo] SET  READ_WRITE 
GO
