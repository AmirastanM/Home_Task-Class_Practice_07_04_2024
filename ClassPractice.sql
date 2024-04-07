select [Age] from Students
union
select [Age] from Teachers

select count(*) as 'student count', Age
from Students
group by Age


declare @num1 int = 50;
declare @num2 int = 30;

if @num1 > @num2
	print 'Yes'

else 
	print 'No'


create function dbo.getStudentsAvgAge()
returns int
as
begin
	return (select AVG(Age) from Students)
end

create function dbo.getTeachersAvgAge()
returns int
as
begin
	return (select AVG(Age) from Teachers)
end

create procedure usp_checkStudentAndTeachersAvgAge
@studentAvgAge int,
@teacherAvgAge int
as
begin
	if @studentAvgAge > @teacherAvgAge
		print 'Student average age is bigger than teachers'
	else
		print 'Student average age is not bigger than teachers'
end

declare @stuAvgAge int = (select dbo.getStudentsAvgAge())
declare @teachAvgAge int = (select dbo.getTeachersAvgAge())

exec usp_checkStudentAndTeachersAvgAge @stuAvgAge, @teachAvgAge


declare @Counter int
set @Counter = 1
while (@Counter <= 10)
begin
	print ' the counter value = ' + convert(nvarchar,@Counter)
	set @Counter = @Counter + 1
end
