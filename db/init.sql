-- Create a new database
CREATE DATABASE weather_analysis;

-- Connect to the new database (psql command-line tool)
\c weather_analysis;

-- For other SQL execution environments, use the appropriate method to connect to the database
-- Example: In a script, you might need to establish a new connection using your database client

-- Only insert initial data
INSERT INTO weather_stations (station_name, latitude, longitude, elevation) 
VALUES ('Station A', 40.7128, -74.0060, 10.0);

INSERT INTO weather_data (station_id, timestamp, temperature, humidity, wind_speed, precipitation)
VALUES (1, CURRENT_TIMESTAMP, 25.5, 65.0, 10.2, 0.0);