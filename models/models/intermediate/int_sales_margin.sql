select
    s.orders_id,
    s.date_date,
    s.revenue,
    s.quantity,
    p.purchase_price,
    ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
    ROUND(s.revenue -(s.quantity*p.purchase_price), 2) AS margin
from {{ ref("stg_raw__sales") }} AS s
left join {{ ref("stg_raw__product") }} AS p 
ON s.products_id = p.products_id