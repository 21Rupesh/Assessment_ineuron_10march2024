use ineuron;

create table test_a(id numeric);

create table test_b(id numeric);

insert into test_a(id) values
(10),
(20),
(30),
(40),
(50);

insert into test_b(id) values
(10),
(30),
(50);

#Q2. Write a query to fetch values in table test_a that are and not in test_b without using the NOT keyword.

SELECT a.id
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;


