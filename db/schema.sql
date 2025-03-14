-- Define database structure
CREATE TABLE weather_stations (
    station_id SERIAL PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    elevation DECIMAL(5,2) NOT NULL
);

CREATE TABLE weather_data (
    data_id SERIAL PRIMARY KEY,
    station_id INT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    temperature DECIMAL(5,2) NOT NULL,
    humidity DECIMAL(5,2) NOT NULL,
    wind_speed DECIMAL(5,2) NOT NULL,
    precipitation DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (station_id) REFERENCES weather_stations(station_id)
);