CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Mouse', 'Electronics', 500),
(3, 'Keyboard', 'Electronics', 1200),
(4, 'Chair', 'Furniture', 4500),
(5, 'Desk', 'Furniture', 8000);

INSERT INTO orders VALUES
(101, 1, 2, '2026-09-01'),
(102, 2, 5, '2026-09-02'),
(103, 3, 3, '2026-09-03'),
(104, 4, 4, '2026-09-04'),
(105, 5, 2, '2026-09-05'),
(106, 1, 1, '2026-09-06'),
(107, 2, 10, '2026-09-07');


SELECT 
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
