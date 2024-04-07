

create table Department(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[DepartmentId] int,
foreign key ([DepartmentId]) references Department([Id])
)

create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(100),
[Age] int,
[Salary] int,
[CityId] int
foreign key ([CityId]) references Cities([Id])
)

create table RoleStaffMembers(
[Id] int primary key identity(1,1),
[RoleId] int,
[StaffMemberId] int,
foreign key ([RoleId]) references Roles([Id]),
foreign key ([StaffMemberId]) references StaffMembers([Id])
)

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CountryId] int,
foreign key ([CountryId]) references Countries ([Id])
)


create table Education(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)


create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int
)

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Surname] nvarchar(100),
[Address] nvarchar(200),
[Age] int,
[Email] nvarchar(200),
[CityId] int,
foreign key ([CityId]) references Cities([Id])
)


create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(200),
[Salary] float,
[Address] nvarchar(200),
[Email] nvarchar(200)
)




create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int,
[RoomId] int,
[EducationId] int,
foreign key ([RoomId]) references Rooms([Id]),
foreign key ([EducationId]) references Education([Id])
)

create table StudentGroups(
[Id] int primary key identity(1,1),
[StudentId] int,
[GroupId] int,
foreign key ([StudentId]) references Students([Id]),
foreign key ([GroupId]) references Groups([Id])
)

create table GroupTeachers(
[Id] int primary key identity(1,1),
[TeacherId] int,
[GroupId] int,
foreign key ([TeacherId]) references Teachers([Id]),
foreign key ([GroupId]) references Groups([Id])
)


create procedure usp_createDepartment
@name nvarchar(100)
as
begin
	insert into Department([Name])
	values(@name)
end

create procedure usp_createRoles
@name nvarchar(100),
@departmentId int
as
begin
	insert into Roles([Name],[DepartmentId])
	values(@name, @departmentId)
end


create procedure usp_createStaffMembers
@fullname nvarchar(100),
@age int,
@salary int,
@cityId int
as
begin
	insert into StaffMembers([FullName],[Age],[Salary],[CityId])
	values(@fullname, @age, @salary, @cityId)
end


create procedure usp_createRoleStaffMembers
@roleId int,
@staffMemberId int
as
begin
	insert into RoleStaffMembers([RoleId],[StaffMemberId])
	values(@roleId, @staffMemberId)
end


create procedure usp_createCountries
@name nvarchar(100)
as
begin
	insert into Countries([Name])
	values(@name)
end


create procedure usp_createCities
@name nvarchar(100),
@countryId int
as
begin
	insert into Cities ([Name], [CountryId])
	values(@name, @countryId)
end

create procedure usp_createEducation
@name nvarchar(100)
as
begin
	insert into Education ([Name])
	values(@name)
end


create procedure usp_createRooms
@name nvarchar(100),
@capacity int
as
begin
	insert into Rooms([Name], [Capacity])
	values(@name, @capacity)
end



create procedure usp_createStudents
@name nvarchar(100),
@surname nvarchar(100),
@address nvarchar(200),
@age int,
@email nvarchar(200),
@cityId int
as
begin
	insert into Students([Name], [Surname], [Address], [Age], [Email], [CityId])
	values(@name, @surname, @address, @age, @email, @cityId)
end



create procedure usp_createTeachers
@fullname nvarchar(100),
@salary int,
@address nvarchar(200),
@email nvarchar(200)
as
begin
	insert into Teachers([FullName], [Salary], [Address], [Email])
	values(@fullname, @salary, @address, @email)
end



create procedure usp_createGroups
@name nvarchar(100),
@capacity int,
@roomId int,
@educationId int
as
begin
	insert into Groups([Name], [Capacity], [RoomId], [EducationId])
	values(@name, @capacity, @roomId, @educationId)
end



create procedure usp_createGroupTeachers
@teachertId int,
@groupIdId int
as
begin
	insert into GroupTeachers([TeacherId], [GroupId])
	values(@teachertId, @groupIdId)
end

create procedure usp_createStudentGroups
@studentId int,
@groupIdId int
as
begin
	insert into StudentGroups([StudentId], [GroupId])
	values(@studentId, @groupIdId)
end



exec usp_createDepartment 'Technician Department'
select * from Department

exec usp_createRoles 'Technical specialist', 5
select * from Roles

exec usp_createCountries 'India'
select * from Countries

exec usp_createCities 'Kargil',7
select * from Cities

exec usp_createStaffMembers 'Malak Bayramova', 39, 700, 1
select * from StaffMembers

exec usp_createRoleStaffMembers 8, 
select * from RoleStaffMembers

exec usp_createStudents 'Margaret', 'John', 'Nesimi', 24, 'Margat@gmai.com', 6
select * from Students		

exec usp_createTeachers 'Kamran Muradov', 4000, 'Sumqayit', 'kamran@gmail.com'
select * from Teachers

exec usp_createRooms 'Moon', 12
select * from Rooms

exec usp_createEducation 'Data science'
select * from Education

exec usp_createGroups 'CS110', 12, 4, 5
select * from Groups

exec usp_createStudentGroups 5,4
select * from StudentGroups

exec usp_createGroupTeachers 4,4
select * from GroupTeachers