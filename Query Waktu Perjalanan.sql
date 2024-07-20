select
  format_date('%A', date(trip_start_timestamp)) as weekday,
  avg(trip_seconds) as avg_seconds,
  approx_quantiles(trip_seconds, 2)[offset(1)] as median_seconds,
  stddev(trip_seconds) as stddev_seconds
from 
  bigquery-public-data.chicago_taxi_trips.taxi_trips
where 
  extract(dayofweek FROM trip_start_timestamp) in (2,7)
group by 
  weekday
order by 
  weekday
limit 1000