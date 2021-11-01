DROP TABLE workers;

CREATE TABLE workers(
  id SERIAL PRIMARY KEY,
  birthday DATE NOT NULL CHECK(
    birthday > '1930-1-1'
    AND birthday < CURRENT_DATE
  ),
  "name" VARCHAR(64) NOT NULL CHECK("name" != ''),
  salary_$ NUMERIC (6,2) NOT NULL
);

INSERT INTO workers (birthday, "name", salary_$) VALUES
(DATE '1990-9-9', 'Nikita', 300),
(DATE '1980-8-8', 'Svetlana', 1200),
(DATE '1980-6-24', 'Yaroslav', 1200),
(DATE '1993-3-5', 'Petr', 1000),
(DATE '1988-11-10', 'Nikolay', 1100),
(DATE '1994-3-28', 'Akhmed', 400),
(DATE '1970-10-7', 'Mark', 2600),
(DATE '1998-2-16', 'Nursultan', 900),
(DATE '1995-4-13', 'Ksystof', 1200),
(DATE '1999-1-27', 'Vasya', 3000),
(DATE '2000-2-20', 'Mike', 1100);

UPDATE workers SET 
birthday = make_date(1987, CAST(EXTRACT(MONTH FROM birthday) as int), CAST (EXTRACT(DAY FROM birthday) as int)) WHERE id=4;

UPDATE workers SET 
salary_$ = 700 WHERE salary_$ = 500;

UPDATE workers SET
birthday = make_date(1999, CAST(EXTRACT(MONTH FROM birthday) as int), CAST (EXTRACT(DAY FROM birthday) as int)) WHERE
id >= 2 and id <=5;

UPDATE workers SET
"name" = 'Zhenya', salary_$ = 900 WHERE
"name" = 'Vasya';

SELECT * 
FROM workers 
WHERE id=3;

SELECT * 
FROM workers 
WHERE salary_$ > 400;

SELECT * 
FROM workers 
WHERE salary_$ != 500;

SELECT salary_$, age(birthday) 
FROM workers 
WHERE "name" = 'Zhenya';

SELECT * 
FROM workers 
WHERE "name" = 'Petr';

SELECT * 
FROM workers 
WHERE "name" != 'Petr';

SELECT * 
FROM workers 
WHERE age(birthday) > interval '23 years' 
AND age(birthday) < interval '24 years' 
OR salary_$ = 1000;

SELECT *
FROM workers
WHERE age(birthday) > interval '25 years' 
AND age(birthday) <= interval '28 years';

SELECT * 
FROM workers 
WHERE age(birthday) > interval '23 years' 
AND age(birthday) < interval '27 years' 
OR salary_$ > 400 AND salary_$ < 1000;

SELECT * 
FROM workers 
WHERE age(birthday) > interval '23 years' 
AND age(birthday) < interval '24 years'
OR salary_$ != 400;

DELETE FROM workers
WHERE id=7
RETURNING *;

DELETE FROM workers
WHERE "name" = 'Nikolay'
RETURNING *;

DELETE FROM workers
WHERE age(birthday) > interval '23 years'
AND age(birthday) < interval '24 years'
RETURNING *;