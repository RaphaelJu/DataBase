-- This is the solution for Leetcode database part, medium level

-- 178. Rank Scores
select score, dense_rank() over (order by score desc) Rank
from scores

-- 180. Consecutive Numbers
select distinct l1.num as ConsecutiveNums
from (logs l1 join logs l2 on l1.id = l2.id+1)
join logs l3 on l1.id = l3.id -1
where l1.Num = l2.Num and l2.Num = l3.Num

-- 184. Department Highest Salary
select department.Name as Department, temp.Name as Employee, temp.Salary as 
Salary from
(select *, dense_rank() over (partition by departmentid order by salary desc) as SalaryRank
from employee) as temp inner join department on temp.departmentid = department.id
where SalaryRank = 1

-- 570. Managers with at Least 5 Direct Reports
select Name from employee
where Id in
(select e1.id
from employee e1 join employee e2 on e1.id = e2.managerid
group by e1.id
having count(e2.managerid) >=5)

-- 574. Winning Candidate
select Name from
Candidate where id =
(select top 1 CandidateId
from vote
group by CandidateId
order by count(id) desc)

