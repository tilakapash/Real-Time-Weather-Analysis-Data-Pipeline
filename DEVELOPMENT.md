# Development Notes

## Database Setup
- PostgreSQL installed via Homebrew
- Database initialization order:
  1. `db/setup.sql` - Creates database
  2. `db/schema.sql` - Creates tables
  3. `db/init.sql` - Inserts initial data

## Project Structure
```
.
├── db/
│   ├── init.sql      # Initial data
│   ├── run.sh        # Setup automation
│   ├── schema.sql    # Table definitions
│   └── setup.sql     # Database creation
...
```

## Environment Setup
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Configure PostgreSQL:
   ```bash
   brew install postgresql@15
   brew services start postgresql@15
   ```

## Important Commands
```bash
# Database setup
./db/run.sh

# Start services
./scripts/start_kafka.sh
./scripts/start_spark.sh
./scripts/start_airflow.sh
```