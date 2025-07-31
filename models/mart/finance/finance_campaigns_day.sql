select
    f.date_date,
    (f.operational_margin - c.ads_cost) as ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.impression,
    c.click,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.log_cost,
    f.ship_cost
from {{ ref('finance_days') }} f
join {{ ref('int_campaigns_day') }} c
using(date_date)
ORDER BY date_date DESC