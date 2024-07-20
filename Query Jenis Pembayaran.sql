select 
  payment_type,
  AVG(fare) as average_fare,
  AVG(tips) as average_tips,
  AVG(tolls) as average_tolls,
from bigquery-public-data.chicago_taxi_trips.taxi_trips
where extract (year from trip_start_timestamp) = 2019
group by payment_type
order by average_fare desc
limit 1000
