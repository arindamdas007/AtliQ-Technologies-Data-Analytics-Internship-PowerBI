CREATE TABLE delivery_quantity AS
SELECT
    b.mmm_yy,
    b.customer_id,
    b.customer_name,
    b.city,
    b.total_delivery_quantity AS benchmark_delivery_qty,
    f.recorded_delivery_qty,
    ABS((b.total_delivery_quantity-f.recorded_delivery_qty)) AS diff_delivery_qty,
    CONCAT(
           ROUND(
				(ABS((b.total_delivery_quantity - f.recorded_delivery_qty)) 
                / b.total_delivery_quantity) 
                * 100,
				2
           ),
           '%'
	) AS delivery_percent_from_benchmark
FROM benchmarks b
LEFT JOIN fact_orders_enriched f
    ON b.mmm_yy = f.mmm_yy
   AND b.customer_id = f.customer_id;
