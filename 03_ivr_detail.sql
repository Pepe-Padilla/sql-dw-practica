-- keepcoding.ivr_calls   ivr_id
-- keepcoding.ivr_modules ivr_id module_sequece
-- keepcoding.ivr_steps   ivr_id module_sequece step_sequence
SELECT 
  call.ivr_id,
  call.phone_number,
  call.ivr_result,
  call.vdn_label,
  call.start_date,
  FORMAT_TIMESTAMP('%Y%m%d',call.start_date) as start_date_id,
  call.end_date,
  FORMAT_TIMESTAMP('%Y%m%d',call.end_date) as end_date_id,
  call.total_duration,
  call.customer_segment,
  call.ivr_language,
  call.steps_module,
  call.module_aggregation,
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