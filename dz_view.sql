--1 показать имена студентов которые взяли но не вернули книги
select Student.first_name as Students, Student.last_name as Lastname
from S_Cards inner join Student on S_Cards.id_student = Student.id
where S_Cards.date_in is null

--2 Показать имена студентов никогда не бравших книг
select Student.first_name as Name
from Student
left join S_Cards on S_Cards.id_student  = Student.id
where S_Cards.id_student is null

--3 показать самого активного библиотекаря(выдал больше всего книг)
select top 1 Librarian.first_name, Librarian.last_name, count(*) as counter_lib
from (
select * from S_Cards where date_in is not null
union all
select * from T_Cards where date_in is not null
)as b

Join Librarian on b.id_librarian = Librarian.id
group by Librarian.first_name, Librarian.last_name
order by counter_lib Desc