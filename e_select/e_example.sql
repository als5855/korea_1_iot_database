### d_example ###

use korea_db;

select * from members
order by name asc; ---

select * from members
limit 2 offset 2;
# limit 2,2;

select * from members
order by points desc
limit 3;

select distinct grade from members;

select area_code, max(points) as max_points
from members
group by area_code;

select gender, avg(points) as avg_points 
from members
group by gender;


select grade
from members
having avg(points) >= 250;

select grade, min(points) as min_points
from members
group by grade
having min(points) >= 100;




