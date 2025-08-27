Create Database DA

USE [DA]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/27/2025 12:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeProjects]    Script Date: 8/27/2025 12:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProjects](
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[HoursWorked] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/27/2025 12:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DepartmentID] [int] NULL,
	[Salary] [int] NULL,
	[JoiningDate] [date] NULL,
	[DOB] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 8/27/2025 12:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 8/27/2025 12:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[EmployeeID] [int] NULL,
	[SalaryAmount] [int] NULL,
	[EffectiveFrom] [date] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'IT')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'HR')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Finance')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Marketing')
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (101, 201, 120)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (101, 205, 90)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (102, 202, 100)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (103, 201, 60)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (103, 205, 70)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (104, 203, 110)
GO
INSERT [dbo].[EmployeeProjects] ([EmployeeID], [ProjectID], [HoursWorked]) VALUES (105, 204, 80)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary], [JoiningDate], [DOB]) VALUES (101, N'Alice', N'Smith', 1, 85000, CAST(N'2020-03-15' AS Date), CAST(N'1999-02-12' AS Date))
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary], [JoiningDate], [DOB]) VALUES (102, N'Bob', N'Johnson', 2, 62000, CAST(N'2019-06-01' AS Date), CAST(N'1996-03-25' AS Date))
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary], [JoiningDate], [DOB]) VALUES (103, N'Charlie', N'Williams', 1, 85000, CAST(N'2021-01-20' AS Date), CAST(N'2000-08-19' AS Date))
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary], [JoiningDate], [DOB]) VALUES (104, N'Diana', N'Brown', 3, 90000, CAST(N'2018-09-10' AS Date), CAST(N'1988-02-27' AS Date))
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary], [JoiningDate], [DOB]) VALUES (105, N'Evan', N'Davis', 4, 55000, CAST(N'2022-07-05' AS Date), CAST(N'2002-01-26' AS Date))
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [DepartmentID]) VALUES (201, N'Migration Project', 1)
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [DepartmentID]) VALUES (202, N'Recruitment Drive', 2)
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [DepartmentID]) VALUES (203, N'Budget Planning', 3)
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [DepartmentID]) VALUES (204, N'Product Launch', 4)
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [DepartmentID]) VALUES (205, N'Cloud Transformation', 1)
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (101, 70000, CAST(N'2020-03-15' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (101, 75000, CAST(N'2022-03-15' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (102, 60000, CAST(N'2019-06-01' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (102, 62000, CAST(N'2021-06-01' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (103, 85000, CAST(N'2021-01-20' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (104, 85000, CAST(N'2018-09-10' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (104, 90000, CAST(N'2020-09-10' AS Date))
GO
INSERT [dbo].[Salaries] ([EmployeeID], [SalaryAmount], [EffectiveFrom]) VALUES (105, 50000, CAST(N'2022-07-05' AS Date))
GO
ALTER TABLE [dbo].[EmployeeProjects]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeProjects]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
