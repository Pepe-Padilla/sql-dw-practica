select 
  calls_ivr_id,
  billing_account_id
from `keepcoding.ivr_detail`
qualify row_number() over (
  PARTITION BY cast(calls_ivr_id as string) 
  ORDER BY (
    case 
      when billing_account_id = 'UNKNOWN' then null 
      else billing_account_id 
    end
  ) asc nulls last) = 1