SELECT 
  pickup_community_area,
  dropoff_community_area,
  COUNT(*) AS num_trips
FROM 
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE 
  EXTRACT(YEAR FROM trip_start_timestamp) = 2023
  AND dropoff_community_area IS NOT NULL
GROUP BY 
  pickup_community_area, 
  dropoff_community_area
ORDER BY 
  num_trips DESC
LIMIT 5;
