--Interview Scenario 1: Join Columns having Unique Values
-- Create TableA
drop table TableB;
CREATE TABLE TableA (
    ID INT PRIMARY KEY
);

-- Insert values into TableA
INSERT INTO TableA (ID) VALUES (1), (2), (3), (4), (5);

-- Create TableB
CREATE TABLE TableB (
    ID INT PRIMARY KEY
);

-- Insert values into TableB
INSERT INTO TableB (ID) VALUES (1), (2), (4);

-- INNER JOIN: Returns only the rows where there is a match in both tables
SELECT TableA.ID AS A_ID, TableB.ID AS B_ID
FROM TableA
INNER JOIN TableB ON TableA.ID = TableB.ID;

-- LEFT JOIN: Returns all rows from the left table (TableA), and the matched rows from the right table (TableB)
SELECT TableA.ID AS A_ID, TableB.ID AS B_ID
FROM TableA
LEFT JOIN TableB ON TableA.ID = TableB.ID;

-- RIGHT JOIN: Returns all rows from the right table (TableB), and the matched rows from the left table (TableA)
SELECT TableA.ID AS A_ID, TableB.ID AS B_ID
FROM TableA
RIGHT JOIN TableB ON TableA.ID = TableB.ID;

-- FULL OUTER JOIN: Returns all rows when there is a match in either table
-- If there is no match, the result will contain NULL values for columns from the table without a match
SELECT TableA.ID AS A_ID, TableB.ID AS B_ID
FROM TableA
FULL OUTER JOIN TableB ON TableA.ID = TableB.ID;

-- CROSS JOIN: Returns the Cartesian product of both tables (all possible combinations of rows)
SELECT TableA.ID AS A_ID, TableB.ID AS B_ID
FROM TableA
CROSS JOIN TableB;
-------------------------------------------------------------------------------
--now Scenario 2: Join columns having duplicate values using above table
-- Create TableX
CREATE TABLE TableX (
    ID INT PRIMARY KEY,
    ValueX VARCHAR(255)
);

-- Insert values into TableX
INSERT INTO TableX (ID, ValueX) VALUES 
    (1, 'Apple'),
    (2, 'Banana'),
    (3, 'Orange'),
    (4, 'Apple'),
    (5, 'Grapes');

-- Create TableY
CREATE TABLE TableY (
    ID INT PRIMARY KEY,
    ValueY VARCHAR(255)
);

-- Insert values into TableY
INSERT INTO TableY (ID, ValueY) VALUES 
    (1, 'Red'),
    (2, 'Yellow'),
    (3, 'Orange'),
    (4, 'Green'),
    (6, 'Purple');

   
   -- INNER JOIN: Returns only the rows where there is a match in both tables
SELECT TableX.ID, TableX.ValueX, TableY.ValueY
FROM TableX
INNER JOIN TableY ON TableX.ID = TableY.ID;

-- LEFT JOIN: Returns all rows from the left table (TableX), and the matched rows from the right table (TableY)
SELECT TableX.ID, TableX.ValueX, TableY.ValueY
FROM TableX
LEFT JOIN TableY ON TableX.ID = TableY.ID;

-- RIGHT JOIN: Returns all rows from the right table (TableY), and the matched rows from the left table (TableX)
SELECT TableX.ID, TableX.ValueX, TableY.ValueY
FROM TableX
RIGHT JOIN TableY ON TableX.ID = TableY.ID;

-- FULL OUTER JOIN: Returns all rows when there is a match in either table
-- If there is no match, the result will contain NULL values for columns from the table without a match
SELECT TableX.ID, TableX.ValueX, TableY.ValueY
FROM TableX
FULL OUTER JOIN TableY ON TableX.ID = TableY.ID;

----------------------------------------------------------------------
--Scenario 3: One Join table contains Null Value
-- Create TableW
CREATE TABLE W (
    ID INT PRIMARY KEY,
    ValueW VARCHAR(255)
);

-- Insert values into TableW
INSERT INTO W (ID, ValueW) VALUES 
    (1, '1'),
    (2, '2'),
    (3, '3'),
    (4, NULL);

-- Create TableE
CREATE TABLE E (
    ID INT PRIMARY KEY,
    ValueE VARCHAR(255)
);

-- Insert values into TableE
INSERT INTO E (ID, ValueE) VALUES 
    (1, '1'),
    (2, '1'),
    (3, '2'),
    (4, '3'),
    (5, '4'),
    (6, '5');
   
   -- INNER JOIN: Returns only the rows where there is a match in both tables
SELECT W.ID, W.ValueW, E.ValueE
FROM W
INNER JOIN E ON W.ID = E.ID;

-- LEFT JOIN: Returns all rows from the left table (TableW), and the matched rows from the right table (TableE)
SELECT W.ID, W.ValueW, E.ValueE
FROM W
LEFT JOIN E ON W.ID = E.ID;

-- RIGHT JOIN: Returns all rows from the right table (TableE), and the matched rows from the left table (TableW)
SELECT W.ID, W.ValueW, E.ValueE
FROM W
RIGHT JOIN E ON W.ID = E.ID;

-- FULL OUTER JOIN: Returns all rows when there is a match in either table
-- If there is no match, the result will contain NULL values for columns from the table without a match
SELECT W.ID, W.ValueW, E.ValueE
FROM W
FULL OUTER JOIN E ON W.ID = E.ID;

