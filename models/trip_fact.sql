with TRIPS as (

select 
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
start_statio_id,
END_STATION_ID,
MEMBER_CSUAL

from {{ source('demo', 'bike') }}
where RIDE_ID != 'ride_id'



)

SELECT * FROM TRIPS
