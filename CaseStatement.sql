SELECT order_id, order_date,
       CASE
          WHEN order_total <= 100 THEN 'Low'
          WHEN order_total <= 500 THEN 'Medium'
          ELSE 'High'
       END AS order_level
FROM orders;
