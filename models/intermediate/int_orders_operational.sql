SELECT orders_margin.*,
    ROUND(orders_margin.margin + ship.shipping_fee -(ship.logcost + ship_cost),2) as operational_margin,
     ship.shipping_fee,
    ship.logcost,
    ship.ship_cost
FROM {{ ref('int_orders_margin') }} as orders_margin
JOIN {{ ref('stg_raw__ship') }} as ship
ON orders_margin.orders_id = ship.orders_id

