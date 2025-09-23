
{{ config(materialized='table') }}

select 
{{ dbt_utils.generate_surrogate_key(['State_Name']) }} as State_ID
,state_name
,state_abbreviation
from {{ref('STAGE_STATE')}}