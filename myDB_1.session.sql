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
(DATE '1994-3-28', 'Akhmed', 500),
(DATE '1970-10-7', 'Mark', 2600),
(DATE '1998-2-16', 'Nursultan', 900),
(DATE '1995-4-13', 'Ksystof', 1200),
(DATE '1999-1-27', 'Vasya', 3000);

UPDATE workers SET 
birthday = make_date(1987, EXTRACT(MONTH FROM birthday), EXTRACT(DAY FROM birthday)) WHERE id=4;


-- пишет function make_date(integer, numeric, numeric) does not exist

