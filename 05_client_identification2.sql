with client_identification as (
select 
  calls_ivr_id,
  document_type,
  document_identification
from `keepcoding.ivr_detail`
where document_type <> 'UNKNOWN'
qualify row_number() over (PARTITION BY cast(calls_ivr_id as string) ORDER BY calls_end_date asc) = 1
)
select 
  DISTINCT det.calls_ivr_id,
  ifnull(ide.document_type,'UNKNOWN') as document_type,
  ifnull(ide.document_identification,'UNKNOWN') as document_identification,
from `keepcoding.ivr_detail` det
left join client_identification ide using(calls_ivr_id)