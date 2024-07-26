SELECT * 
FROM `lina_s employee data`;

## IDENTIFY CLIENTS WHO HAVE WORKED LONGER THAN 15 YEARS
SELECT UPPER(Employee_name), `Tenure-years`
FROM `lina_s employee data`
WHERE `Tenure-years` >= 15
ORDER BY `Tenure-years` DESC;

## Identify top performing employees and their by their department
SELECT Employee_Id, UPPER(Employee_name), Department, Performance_rating
FROM `lina_s employee data`
WHERE Performance_rating >= 4
ORDER BY Performance_rating DESC;


## THE TOP MANAGEMENT WANTS TO REWARD PERFORMANCE AMONG THE INTERNS AND REQUEST FOR ME AS AN ANALYST TO IDENTIFY THEM.
WITH Top_interns AS (
    SELECT Employee_name, Employee_Id,`Level`,Performance_rating, Department
	FROM `lina_s employee data`
    WHERE `Level` = 'intern'
)
SELECT Employee_Id, UPPER(Employee_name), Department
FROM Top_interns
WHERE Performance_rating = 5;

## BEST PERFORMING DEPARTMENT 
SELECT Department, SUM(ROUND(Performance_rating)) AS Performace_rate
FROM `lina_s employee data`
GROUP BY Department
ORDER BY SUM(Performance_rating) DESC;












