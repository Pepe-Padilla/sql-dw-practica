with calls_numbers_date as (
  -- Primero sacamos, para cada llamada su teléfono y su fecha
  SELECT 
    distinct ivr_id as call_ivr_id, 
    first_value(phone_number) OVER(
      partition by cast(ivr_id as string)
      ORDER BY phone_number asc
    ) as call_phone_number,
    first_value(start_date) OVER(
      partition by cast(ivr_id as string)
      ORDER BY start_date asc
    ) as call_start_date
  from `keepcoding.ivr_calls`
),
calls_24H_more as (
  -- Buscamos los teléfonos que tengan llamada hasta 24h después
  select 
    distinct ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from calls_numbers_date cnd
    where cnd.call_ivr_id <> det.ivr_id
      and det.phone_number = cnd.call_phone_number
      and TIMESTAMP_DIFF(det.start_date, cnd.call_start_date, HOUR) <= 24
  )
),
calls_24H_less as (
  -- Lo mismo pero que tengan llamada hasta 24h antes
  select 
    distinct ivr_id as calls_ivr_id,
    1 as reapeted_phone_24H_fl
  from `keepcoding.ivr_calls` det
  where phone_number in (
    select phone_number 
    from calls_numbers_date cnd
    where cnd.call_ivr_id <> det.ivr_id
      and det.phone_number = cnd.call_phone_number
      and TIMESTAMP_DIFF(cnd.call_start_date,det.start_date,HOUR) <= 24
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
