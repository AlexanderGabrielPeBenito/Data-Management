/* Selects all from customers table */
SELECT * FROM customers; 

/* Displays IT employees' full name */
SELECT first_name, last_name FROM employees WHERE department = 'IT'; 

/* Inserts Laptop with a price of 1,200 under products name and price */
INSERT INTO products (product_name, product_price) VALUES ('Laptop', 1200);

/* Updates order to Shipped status for order id 1001 */
UPDATE orders SET status = 'Shipped' WHERE order_id = 1001;

/* Deletes all data from customers table with purchase dates before January 2023 */
DELETE FROM customers WHERE last_purchase_date < '2023-01-01';

/* Displays products' average pricing */
SELECT AVG(price) AS average_price FROM products;

/* Selects full name from customers table and order date from orders table and joining them based on the customer ID as a common value */
SELECT customers.first_name, customers.last_name, orders.order_date
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;
SELECT * FROM customers;