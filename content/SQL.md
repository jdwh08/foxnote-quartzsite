---
aliases:
  - Structured Query Language
tags: []
edited: 2025-09-27T19:41
created: 2024-03-19T22:06
---
# Definition:
A business friendly [[Interface]] to extract data from SQL-compatible Databases.

Alternative: [[NoSQL]], which removes this nice syntax for better scale.

---
# Notes:

### Commands to Remember
1. [[Common Table Expression]] (CTE): A nice way to have a pre-computed subquery table.
```SQL
WITH cte AS (
	SELECT ...
)
SELECT *
FROM cte
...
;
```
2. **Subquery**: We can use nested subqueries in `FROM`, `JOIN`, and `WHERE`.
- `WHERE table.col = (SELECT MIN(tbl.col) FROM tbl)`

2. Numbers and Aggregations: `MAX, MIN, AVG, ROUND`

3. DATE PARTS: `EXTRACT(YEAR / MONTH / DAY FROM datecol)`
	1. Date Maths: you can do basic subtraction to get days.

4. Replacing Values
	1. `COALESCE(column, 0)` for NA

5. If/Else and Case/When
	1. `(CASE WHEN (...) THEN ... ELSE ... END`

6. Window Functions
	1. `DENSE_RANK() OVER(PARTITION BY col ORDER BY col ASC|DESC)`
	2. `RANK()` to allow gaps for ties
	3. `ROW_NUMBER()` for row number

---
# Examples:
Examples

----
# Source:
Source