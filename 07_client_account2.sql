with client_account as (
select 
  calls_ivr_id,
  billing_account_id
from `keepcoding.ivr_detail`
where billing_account_id <> 'UNKNOWN'
qualify row_number() over (PARTITION BY cast(calls_ivr_id as string) ORDER BY calls_end_date asc) = 1
)
select 
  distinct det.calls_ivr_id,
  ifnull(ide.billing_account_id,'UNKNOWN') as customer_phone,
from `keepcoding.ivr_detail` det
left join client_account ide using(calls_ivr_id)