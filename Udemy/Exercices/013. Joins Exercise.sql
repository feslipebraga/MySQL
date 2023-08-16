-- write the given schema

CREATE TABLE students(
    id int primary key AUTO_INCREMENT,
    first_name varchar(15)
);

CREATE TABLE papers (
    title varchar(50),
    grade int,
    student_id int,
    foreign key (student_id) references students(id) on delete cascade
);

-- print the selection

select first_name, title, grade from students s
join papers p on s.id = p.student_id
order by grade desc;

-- print the selection

select first_name, title, grade from students s
left join papers p on s.id = p.student_id;

-- print the selection

select first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) from students s
left join papers p on s.id = p.student_id;

-- print the selection

select first_name, ifnull(avg(grade), '0') as average from students s
left join papers p on s.id = p.student_id
group by first_name
order by average desc;

-- print the selection

select first_name, ifnull(avg(grade), '0') as average,
CASE
    when avg(grade) > 70 then 'PASSING'
    else 'FAILING'
END as passing_status
from students s
left join papers p on s.id = p.student_id
group by first_name
order by average desc;