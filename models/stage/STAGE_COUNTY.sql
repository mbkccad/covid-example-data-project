
{{ config(materialized='table') }}

select day_date,county,state,fips,cases,deaths 
from stage_covid.stage.Stage_County_Information