with client_phone as (
select 
  calls_ivr_id,
  customer_phone
from `keepcoding.ivr_detail`
where customer_phone <> 'UNKNOWN'
qualify row_number() over (PARTITION BY cast(calls_ivr_id as string) ORDER BY calls_end_date asc) = 1
)
select 
  DISTINCT det.calls_ivr_id,
  ifnull(ide.customer_phone,'UNKNOWN') as customer_phone,
from `keepcoding.ivr_detail` det
left join client_phone ide using(calls_ivr_id)
limit 10