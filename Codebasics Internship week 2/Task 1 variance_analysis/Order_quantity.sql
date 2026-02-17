CREATE TABLE order_quantity AS
SELECT
    b.mmm_yy,
    b.customer_id,
    b.customer_name,
    b.city,
    b.total_order_quantity AS benchmark_order_qty,
    f.recorded_order_qty,
    (f.recorded_order_qty - b.total_order_quantity) AS diff_order_qty,
    CONCAT(
           ROUND(
				((f.recorded_order_qty - b.total_order_quantity) 
                / b.total_order_quantity) 
                * 100,
				2
		   ),
           '%'
    ) AS order_percent_benchmark
FROM benchmarks b
LEFT JOIN fact_orders_enriched f
    ON b.mmm_yy = f.mmm_yy
   AND b.customer_id = f.customer_id;
