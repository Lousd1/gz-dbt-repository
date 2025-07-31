SELECT
    sales.orders_id,
    sales.date_date,
    sales.quantity,
    sales.revenue,
    product.purchase_price,
    ROUND(sales.revenue - (sales.quantity*product.purchase_price),2) as margin,
    ROUND(sales.quantity*product.purchase_price,2) as purchase_cost
from {{ ref("stg_raw__sales") }} AS sales
JOIN {{ ref("stg_raw__product") }} AS product
ON sales.products_id = product.products_id

