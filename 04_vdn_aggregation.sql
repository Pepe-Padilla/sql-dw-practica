select 
  calls_ivr_id,
  case
    when left(calls_vdn_label,3) = 'ATC' then 'FRONT'
    when left(calls_vdn_label,4) = 'TECH' then 'TECH'
    when calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
    else 'RESTO'
  end as vdn_aggregation
from `keepcoding.ivr_detail`