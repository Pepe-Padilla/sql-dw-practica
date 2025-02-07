-- keepcoding.ivr_calls   ivr_id
-- keepcoding.ivr_modules ivr_id module_sequece
-- keepcoding.ivr_steps   ivr_id module_sequece step_sequence
SELECT 
  call.ivr_id as calls_ivr_id,
  call.phone_number as calls_phone_number,
  call.ivr_result as calls_ivr_result,
  call.vdn_label as calls_vdn_label,
  call.start_date as calls_start_date,
  FORMAT_TIMESTAMP('%Y%m%d',call.start_date) as calls_start_date_id,
  call.end_date as calls_end_date,
  FORMAT_TIMESTAMP('%Y%m%d',call.end_date) as calls_end_date_id,
  call.total_duration as calls_total_duration,
  call.customer_segment as calls_customer_segment,
  call.ivr_language as calls_ivr_language,
  call.steps_module as calls_steps_module,
  call.module_aggregation as calls_module_aggregation,
  module.module_sequece,
  module.module_name,
  module.module_duration,
  module.module_result,
  step.step_sequence,
  step.step_name,
  step.step_result,
  step.step_description_error,
  step.document_type,
  step.document_identification,
  step.customer_phone,
  step.billing_account_id
FROM `keepcoding.ivr_calls` call
inner join `keepcoding.ivr_modules` module using (ivr_id)
inner join `keepcoding.ivr_steps` step using (ivr_id,module_sequece)
;