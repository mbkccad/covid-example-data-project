
{{ config(materialized='table') }}

select 
{{ dbt_utils.generate_surrogate_key(['county','state_abbreviation']) }} as County_ID
,sc.county as county_name
,ss.state_abbreviation 
from {{ref('STAGE_COUNTY')}} sc --stage_covid.covid_stg.stage_county sc 
inner join {{ref('STAGE_STATE')}} ss--stage_covid.covid_stg.stage_state ss 
on sc.state = ss.state_name
group by sc.county,ss.state_abbreviation