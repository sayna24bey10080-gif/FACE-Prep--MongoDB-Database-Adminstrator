use vitcampus;

show tables;

select*from worker;

#to print the largest

SELECT WORKER_ID,FIRST_NAME,DEPARTMENT,SALARY FROM Worker
WHERE DEPARTMENT='admin'
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;

select first_name,department,salary from worker 
where department ='admin'
order by salary desc
limit 1 offset 2;


# to select the 2nd max salary from every department 

SELECT first_name, department, salary
FROM worker w1
WHERE w1.salary = (
    SELECT DISTINCT w2.salary
    FROM worker w2
    WHERE w1.department = w2.department
    ORDER BY w2.salary DESC
    LIMIT 1 OFFSET 1
);



