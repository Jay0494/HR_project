# HR tasks with python and SQL 
## Project: HR Data Analysis for Linas Stores

This project demonstrates the application of Python and SQL to tackle real-world HR challenges within a fictional retail company, Linas Stores. By effectively cleaning and analyzing HR datasets, valuable insights were extracted to address specific departmental requests. This repository showcases the data manipulation and analysis process, highlighting the synergy between these powerful tools in generating actionable business intelligence. 

**Data Exploration and Cleaning**
Before delving into the HR department's specific requests, a thorough exploration and cleaning of the Linas Stores' HR dataset was essential. This foundation ensures the accuracy and reliability of subsequent analyses. Python's Pandas library was instrumental in this process. 
Clean data is the cornerstone of effective data analysis. Inconsistencies, missing values etc can significantly distort insights. By meticulously addressing these issues, we laid the groundwork for robust and meaningful findings. 
Check out my notebook to view the cleaning process.
After cleaning the data I exported the clean file and using SQL dealt with the task presented to me by the HR department.

## Analysis and Insights
1- The upper management wanted to reward excellence among the interns within the company so we ran an SQL query to determine the best intern/interns in the company.
```sql
## THE TOP MANAGEMENT WANTS TO REWARD PERFORMANCE AMONG THE INTERNS AND REQUEST FOR ME AS AN ANALYST TO IDENTIFY THEM.
WITH Top_interns AS (
    SELECT Employee_name, Employee_Id,`Level`,Performance_rating, Department
	FROM `lina_s employee data`
    WHERE `Level` = 'intern'
)
SELECT Employee_Id, UPPER(Employee_name), Department
FROM Top_interns
WHERE Performance_rating = 5;
```
This query selects the Employee_Id, converts the Employee_name to uppercase using the UPPER function, and the Department from the previously defined CTE Top_interns. It then filters the results to only include employees with a Performance_rating of 5.

![BEST INTERN ](https://github.com/user-attachments/assets/c649347b-248f-4434-8bdd-7af252be862d)

2- Another important task was to list out the departments according their performance from top to bottom
``` sql
## BEST PERFORMING DEPARTMENT 
SELECT Department, SUM(ROUND(Performance_rating)) AS Performance_rate
FROM `lina_s employee data`
GROUP BY Department
ORDER BY SUM(Performance_rating) DESC;
```
- SELECT Department, SUM(ROUND(Performance_rating)) AS Performance_rate: This part selects the Department column and calculates the sum of the rounded Performance_rating for each department, assigning the result to a new column named Performance_rate.
- FROM lina_s employee data`: Specifies the table from which to retrieve data.
- GROUP BY Department: Groups the results by Department to calculate the sum of Performance_rating for each department.
- ORDER BY SUM(Performance_rating) DESC: Sorts the results in descending order based on the calculated Performance_rate.

# SUMMARY
In this project we have seen how important a clean dataset is. Data is a valuable tool to any company and can also be destructive when not used properly for instance imagine I attempted this tasks without exploring and subsequently cleaning the data my results would have brought about an unpleasant outcome. A clean data equals better, accurate insights/results. With this results the appropriate employee and department recieves their reward for outstanding performance which inturn encourages others to be more productive.
