CREATE VIEW customers_view
AS
SELECT customer_id, first_name, last_name, email
FROM customers
WHERE city = 'New York';
