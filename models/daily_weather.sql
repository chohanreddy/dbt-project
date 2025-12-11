WITH daily_weather AS (

select 

date(time) as daily_weather,
weather,
pressure,
humidity,
clouds



FROM {{ source('demo', 'weather') }}


),

daily_weather_agg AS (

select
daily_weather,
weather,
--
avg(pressure),
avg(humidity),
avg(clouds)


from daily_weather
group by daily_weather,weather

qualify ROW_NUMBER() over (PARTITION BY daily_weather order by count(weather) DESC) = 1



)





select * from daily_weather_agg