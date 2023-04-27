WITH cte_orders AS (
    SELECT order_id, customer_id, order_date, order_total
    FROM orders
    WHERE order_date >= '2022-01-01'
)
SELECT cte_orders.order_id, cte_orders.customer_id, cte_orders.order_date, cte_orders.order_total, customers.first_name, customers.last_name
FROM cte_orders
JOIN customers ON cte_orders.customer_id = customers.customer_id;
