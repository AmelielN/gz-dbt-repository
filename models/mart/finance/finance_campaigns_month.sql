select
    format_date('%Y-%m', f.date_date) as datemonth,
    sum(f.operational_margin - c.ads_cost) as ads_margin,
    avg(f.average_basket) as average_basket,
    sum(f.operational_margin) as operational_margin,
    sum(c.ads_cost) as ads_cost,
    sum(c.impression) as impression,
    sum(c.click) as ads_click,
    sum(f.quantity) as quantity,
    sum(f.revenue) as revenue,
    sum(f.purchase_cost) as purchase_cost,
    sum(f.margin) as margin,
    sum(f.shipping_fee) as shipping_fee,
    sum(f.log_cost) as log_cost,
    sum(f.ship_cost) as ship_cost
from {{ ref('finance_campaigns_day') }} f
left join {{ ref('int_campaigns_day') }} c
using(date_date)
group by datemonth
order by datemonth desc