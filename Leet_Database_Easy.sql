-- This is the solution for Leetcode database part, easy level


-- 175. Combine Two Tables
select FirstName, LastName, City, State
from Person p left join Address a on p.personid = a.personid

-- 176. Second Highest Salary
select max(Salary) as SecondHighestSalary
from Employee
where salary <> 
(select max(salary) from employee)

-- 181. Employees Earning More Than Their Managers
select e1.Name as Employee
from employee e1  join employee e2 on e1.managerid = e2.id
where e1.salary > e2.salary

-- 182. Duplicate Emails
select email
from Person 
group by email
having count(email) > 1

-- 183. Customers Who Never Order
select c.Name as Customers
from Customers c left join Orders o on c.id = o.customerid
where o.id is null

-- 196. Delete Duplicate Emails
DELETE p1
from person p1 join person p2
where p1.email=p2.email
and p1.id > p2.id

-- 197. Rising Temperature
select w2.id
from weather w1 join weather w2 on w1.recorddate = DateAdd(dd,-1,w2.recorddate)
where w2.temperature > w1.temperature

-- 511. Game Play Analysis I
select player_id,min(event_date) as first_login
from Activity
group by player_id

-- 512. Game Play Analysis II
select a1.player_id,a1.device_id
from 
(select player_id,min(event_date) as event_date
from Activity
group by player_id) as a2
join Activity as a1
on a1.player_id = a2.player_id
where a1.player_id = a2.player_id and a1.event_date = a2.event_date

-- 577. Employee Bonus
select Employee.name, bonus.bonus
from Employee left join Bonus on Employee.empId = bonus.empId
where bonus.bonus < 1000 or bonus.bonus is NULL
order by bonus.bonus desc

-- 584. Find Customer Referee
select name
from customer
where referee_id <> 2 or referee_id is NULL

-- 586. Customer Placing the Largest Number of Orders
select TOP 1 customer_number
from orders
group by customer_number
order by count(order_number) desc

-- 595. Big Countries
select name, population, area
from World
where area > 3000000  or population > 25000000

select name, population, area
from World
where area > 3000000 
union
select name, population, area
from World
where population > 25000000

-- 596. Classes More Than 5 Students    
select class
from courses
group by class
having count(distinct student) >= 5

-- 603. Consecutive Available Seats
select distinct c1.seat_id
from(cinema c1 join cinema c2 on abs(c1.seat_id - c2.seat_id)= 1)
where c1.free = 1 and c2.free = 1
order by seat_id

-- 607.Sales Person
select name from salesperson
where sales_id not in
    (select orders.sales_id from 
        (orders left join company  on orders.com_id = company.com_id)
        where company.name = 'Red'
    )

-- 610. Triangle Judgement
select x,y,z, case
when x + y <= z or x+z <= y or z+y <= x then 'No'
else 'Yes'
end
as triangle
from triangle

-- 613. Shortest Distance in a Line
select min(abs(p1.x-p2.x)) as shortest from point p1, point p2
where p1.x <> p2.x

-- 619. Biggest Single Number
select max(num) as num
from 
(select num,count(num) as counts
from my_numbers
group by num
having count(num) = 1
) as temp

-- 620. Not Boring Movies 
select *
from cinema
where (id%2 = 1) and description <> 'boring'
order by rating desc

-- 1050. Actors and Directors Who Cooperated At Least Three Times
select actor_id,director_id
from ActorDirector
group by actor_id, director_id
having count(actor_id) >= 3

-- 1068. Product Sales Analysis I
select product.product_name, sales.year,sales.price
from sales left join product on sales.product_id = product.product_id

-- 1068. Product Sales Analysis II
select product_id, sum(quantity) as total_quantity
from sales
group by product_id
