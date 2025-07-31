WITH sub AS 
(
    SELECT date_date,
    COUNT(DISTINCT orders_id) AS nb_transactions,
SUM(quantity) As total_daily_quantity,
ROUND(SUM(revenue),2) AS total_daily_revenue,
ROUND(SUM(purchase_cost),2) As total_daily_purchase_cost,
ROUND(SUM(margin),2) AS total_daily_margin,
ROUND(SUM(operational_margin),2) AS total_daily_op_margin,
ROUND(SUM(shipping_fee),2) AS total_daily_shippingfee,
ROUND(SUM(logcost),2) AS total_daily_logcost,
ROUND(SUM(ship_cost),2) AS total_daily_shipcost
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
) 
SELECT * ,
    ROUND(total_daily_revenue/NULLIF(nb_transactions, 0), 2) AS average_daily_basket
FROM sub
ORDER by date_date DESC
