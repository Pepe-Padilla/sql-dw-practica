select 
  calls_ivr_id,
  case 
    when countif(step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = 'OK' ) > 0 then 1
    else 0
  end as info_by_phone_lg
from `keepcoding.ivr_detail`
group by 1