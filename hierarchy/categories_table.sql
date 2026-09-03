CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    parent_id INT REFERENCES categories(id)
);

INSERT INTO categories (id, name, parent_id)
VALUES
(1, 'Electronics', NULL),
(2, 'Computers', 1),
(3, 'Laptops', 2),
(4, 'Phones', 1);
