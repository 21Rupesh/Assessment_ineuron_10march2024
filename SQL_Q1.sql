use ineuron;

-- Create the runners table
CREATE TABLE runners (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create the races table
CREATE TABLE races (
    id INT PRIMARY KEY,
    event VARCHAR(100) NOT NULL,
    winner_id INT,
    FOREIGN KEY (winner_id) REFERENCES runners(id)
);

-- Insert data into the runners table
INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Bobby Louis'),
(5, 'Lisa Romero');

-- Insert data into the races table
INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathalon', Null);

#What will be the result of the query below?
#SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races)
#Explain your answer and also provide an alternative version of this query that will avoid the issue that it exposes.

SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races);

/*However, using NOT IN with a subquery might lead to unexpected behavior if the subquery contains NULL values.
 If the subquery returns any NULL values, the entire WHERE condition becomes unknown, and the query might not produce the desired results.*/
 
 SELECT * FROM runners r
WHERE NOT EXISTS (SELECT 1 FROM races WHERE winner_id = r.id);

