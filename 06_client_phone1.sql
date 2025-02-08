select 
  calls_ivr_id,
  customer_phone
from `keepcoding.ivr_detail`
qualify row_number() over (
  PARTITION BY cast(calls_ivr_id as string) 
  ORDER BY (
    case 
      when customer_phone = 'UNKNOWN' then null 
      else customer_phone 
    end
  ) asc nulls last) = 1