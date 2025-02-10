with calls_numbers_date as (
  -- Primero sacamos, para cada llamada su teléfono y su fecha
  SELECT 
    ivr_id as calls_ivr_id, 
    phone_number as calls_phone_number,
    start_date as calls_start_date
  from `keepcoding.ivr_calls`
),
calls_24H_more as (
  -- Buscamos los teléfonos que tengan llamada hasta 24h después
  select 
    ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from calls_numbers_date cnd
    where cnd.calls_ivr_id <> det.ivr_id
      and det.phone_number = cnd.calls_phone_number
      and TIMESTAMP_DIFF(cnd.calls_start_date,det.start_date, MINUTE) between 0 and 1440
  )
),
calls_24H_less as (
  -- Lo mismo pero que tengan llamada hasta 24h antes
  select 
    ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from calls_numbers_date cnd
    where cnd.calls_ivr_id <> det.ivr_id
      and det.phone_number = cnd.calls_phone_number
      and TIMESTAMP_DIFF(det.start_date,cnd.calls_start_date,MINUTE) between 0 and 1440
  )
)
-- Finalmente unimos todo a ivr_detail
select 
 distinct det.calls_ivr_id,
 ifnull(less24.reapeted_phone_24H_fl,0) as cause_recall_phone_24H,
 ifnull(more24.reapeted_phone_24H_fl,0) as repeated_phone_24H
from `keepcoding.ivr_detail` det
left join calls_24H_less less24 using(calls_ivr_id)
left join calls_24H_more more24 using(calls_ivr_id)
