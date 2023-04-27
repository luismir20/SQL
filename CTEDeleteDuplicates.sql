WITH CTE AS (
  SELECT column_name, ROW_NUMBER() OVER (
    PARTITION BY column_name
    ORDER BY (SELECT 0)
  ) AS rn
  FROM table_name
)
DELETE FROM CTE WHERE rn > 1;
