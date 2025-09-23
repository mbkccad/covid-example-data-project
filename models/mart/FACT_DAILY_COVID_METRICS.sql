{{ config(materialized='table') }}

select
 d.date_id as date_id
 ,ds.state_id
 ,dc.county_id
 ,c.cases
 ,c.cases - lag(c.cases) over (partition by c.county, s.state_name order by d.full_date) as new_cases
 ,c.deaths
 ,c.deaths - lag(c.deaths) over (partition by c.county, s.state_name order by d.full_date) as new_deaths
from {{ ref('STAGE_COUNTY') }} c
join {{ ref('STAGE_STATE') }} s
    on c.state = s.state_name
join {{ ref('DIM_DATE') }} d
    on c.day_date = d.full_date
left join {{ ref('DIM_STATE') }} ds
    on ds.state_name = s.state_name
left join {{ ref('DIM_COUNTY') }} dc
    on dc.county_name = c.county and dc.state_abbreviation = ds.state_abbreviation