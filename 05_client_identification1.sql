select 
  calls_ivr_id,
  document_type,
  document_identification
from `keepcoding.ivr_detail`
qualify row_number() over (
  PARTITION BY cast(calls_ivr_id as string) 
  ORDER BY (
    case 
      when document_type = 'UNKNOWN' then null 
      else document_type 
    end
  ) asc nulls last) = 1