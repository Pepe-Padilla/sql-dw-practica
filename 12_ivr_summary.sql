with vdn_agregation_t as (
  select 
    ivr_id as calls_ivr_id,
    phone_number as calls_phone_number,
    start_date as calls_start_date,
    case
      when left(vdn_label,3) = 'ATC' then 'FRONT'
      when left(vdn_label,4) = 'TECH' then 'TECH'
      when vdn_label = 'ABSORPTION' then 'ABSORPTION'
      else 'RESTO'
    end as vdn_aggregation
  from `keepcoding.ivr_calls`
), client_identification as (
  select 
    distinct ivr_id as calls_ivr_id,
    document_type,
    document_identification
  from `keepcoding.ivr_steps`
  where document_type <> 'UNKNOWN'
  qualify row_number() over (PARTITION BY cast(ivr_id as string) ORDER BY module_sequece asc, step_sequence asc) = 1
), client_phone as (
  select 
    ivr_id as calls_ivr_id,
    customer_phone
  from `keepcoding.ivr_steps`
  where customer_phone <> 'UNKNOWN'
  qualify row_number() over (PARTITION BY cast(ivr_id as string) ORDER BY module_sequece asc, step_sequence asc) = 1
), client_account as (
  select 
    ivr_id as calls_ivr_id,
    billing_account_id
  from `keepcoding.ivr_steps`
  where billing_account_id <> 'UNKNOWN'
  qualify row_number() over (PARTITION BY cast(ivr_id as string) ORDER BY module_sequece asc, step_sequence asc) = 1
), is_masiva as (
  select 
    ivr_id as calls_ivr_id,
    case 
      when countif(module_name = 'AVERIA_MASIVA') > 0 then 1
      else 0
    end as masiva_lg
  from `keepcoding.ivr_modules`
  group by 1
), info_by as (
  select 
    ivr_id as calls_ivr_id,
    case 
      when countif(step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = 'OK' ) > 0 then 1
      else 0
    end as info_by_phone_lg,
    case 
      when countif(step_name = 'CUSTOMERINFOBYDNI.TX' and step_result = 'OK' ) > 0 then 1
      else 0
    end as info_by_dni_lg
  from `keepcoding.ivr_steps`
  group by 1
), calls_24H_more as (
  -- Buscamos los teléfonos que tengan llamada hasta 24h después
  select 
    ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from vdn_agregation_t cnd
    where cnd.calls_ivr_id <> det.ivr_id
      and det.phone_number = cnd.calls_phone_number
      and TIMESTAMP_DIFF(cnd.calls_start_date,det.start_date, MINUTE) between 0 and 1440
  )
), calls_24H_less as (
  -- Lo mismo pero que tengan llamada hasta 24h antes
  select 
    ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from vdn_agregation_t cnd
    where cnd.calls_ivr_id <> det.ivr_id
      and det.phone_number = cnd.calls_phone_number
      and TIMESTAMP_DIFF(det.start_date,cnd.calls_start_date,MINUTE) between 0 and 1440
  )
)
select
  distinct det.calls_ivr_id,
  det.calls_phone_number,
  det.calls_ivr_result,
  agreg.vdn_aggregation as vdn_agregation,
  det.calls_start_date,
  det.calls_end_date,
  det.calls_total_duration,
  det.calls_customer_segment,
  det.calls_ivr_language,
  det.calls_steps_module,
  det.calls_module_aggregation,
  ifnull(ide.document_type,'UNKNOWN') as document_type,
  ifnull(ide.document_identification,'UNKNOWN') as document_identification,
  ifnull(pho.customer_phone,'UNKNOWN') as customer_phone,
  ifnull(acc.billing_account_id,'UNKNOWN') as billing_account_id,
  mas.masiva_lg as masiva_lg,
  iby.info_by_phone_lg as info_by_phone_lg,
  iby.info_by_dni_lg as info_by_dni_lg,
  ifnull(less24.reapeted_phone_24H_fl,0) as repeated_phone_24H,
  ifnull(more24.reapeted_phone_24H_fl,0) as cause_recall_phone_24H
from `keepcoding.ivr_detail` det
left join vdn_agregation_t agreg using (calls_ivr_id)
left join client_identification ide using (calls_ivr_id)
left join client_phone pho using (calls_ivr_id)
left join client_account acc using (calls_ivr_id)
left join is_masiva mas using (calls_ivr_id)
left join info_by iby using (calls_ivr_id)
left join calls_24H_less less24 using(calls_ivr_id)
left join calls_24H_more more24 using(calls_ivr_id)