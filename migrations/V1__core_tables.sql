CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO students(name)
VALUES
('Kofi'),
('Amina'),
('Ama');
