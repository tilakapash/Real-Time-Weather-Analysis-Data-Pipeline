#!/bin/bash

# Set PostgreSQL connection parameters
export PGUSER="your_username"
export PGPASSWORD="your_password"
export PGHOST="localhost"

echo "Creating database..."
psql -f setup.sql postgres

echo "Creating schema..."
psql -d weather_analysis -f schema.sql

echo "Initializing data..."
psql -d weather_analysis -f init.sql

echo "Database setup complete!"