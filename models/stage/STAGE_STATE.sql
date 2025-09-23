

{{ config(materialized='table') }}

select distinct 
    State_Name,
    State_Abbreviation
from {{source('stage_covid','stage_state')}}
