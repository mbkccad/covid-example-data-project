

{{ config(materialized='table') }}

select STATE AS state_name,state_abbreviation 
FROM STAGE_COVID.STAGE.STAGE_STATE
