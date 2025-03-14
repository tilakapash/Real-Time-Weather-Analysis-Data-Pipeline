# Real-Time Weather Analysis Data Pipeline

### **Project Overview**

This project builds a **real-time weather analysis pipeline** that collects data from the **OpenWeatherMap API**, processes it using **Apache Kafka** and **Apache Spark**, stores the processed data in **PostgreSQL**, and visualizes it with **Tableau** and **Power BI** dashboards.

The pipeline leverages **Apache Airflow** for orchestrating the flow of tasks and automating the ETL process. It is designed for scalability and efficiency, utilizing streaming technologies like Kafka and distributed processing with Spark.

---

### **Tech Stack**

- **Python**: For API integration, Kafka producer, and processing data with PySpark.
- **Apache Kafka**: For real-time streaming of weather data.
- **Apache Spark**: For distributed data processing.
- **PostgreSQL**: For data storage.
- **Apache Airflow**: For task orchestration and automation of the pipeline.
- **Tableau**: For visualizing weather data insights.
- **Power BI**: For creating alternate visualizations of weather data.
- **Docker**: For containerization of services and infrastructure.

---

### **Project Components**

1. **Data Ingestion**: 
   - Weather data is ingested from the **OpenWeatherMap API** using Python and streamed to **Kafka**.
   
2. **Data Processing**:
   - Data is consumed by **Apache Spark** in real-time via Spark's **Structured Streaming**. It performs necessary transformations, including temperature conversion and data cleaning.

3. **Data Storage**:
   - Processed weather data is stored in a **PostgreSQL** database for historical analysis.

4. **Task Orchestration**:
   - **Apache Airflow** schedules and manages the entire pipeline from data ingestion to storage.

5. **Visualization**:
   - Dashboards are created in **Tableau** and **Power BI** to display the real-time weather data insights, trends, and statistics.

---

### **UML Diagram - Data Model**

Below is the **UML diagram** for the data model that will store processed weather data in the PostgreSQL database.

#### **Weather Data Model (UML Diagram)**

```plaintext
+-----------------+   
|    WeatherData  |   
+-----------------+   
| - id: INT       |   
| - city: STRING  |   
| - weather: STRING|  
| - temperature: FLOAT | 
| - humidity: FLOAT    |
| - wind_speed: FLOAT  |
| - timestamp: TIMESTAMP|
+-----------------+
        |
        |   +--------------------------+
        |   |        WeatherDataTable   |
        |   +--------------------------+
        |   | id INTEGER PRIMARY KEY    |
        |   | city VARCHAR(255)         |
        |   | weather VARCHAR(255)      |
        |   | temperature FLOAT         |
        |   | humidity FLOAT            |
        |   | wind_speed FLOAT          |
        |   | timestamp TIMESTAMP       |
        +--------------------------+
```

- The **WeatherData** model consists of:
  - `id`: Unique identifier for the record.
  - `city`: The name of the city for which the weather data is recorded.
  - `weather`: Weather conditions (e.g., "Clear", "Rain", etc.).
  - `temperature`: Current temperature in Celsius.
  - `humidity`: Humidity percentage.
  - `wind_speed`: Speed of the wind (in km/h).
  - `timestamp`: The timestamp when the data was collected.

---
### **File Structure**

```plaintext
.
├── .gitignore
├── airflow.cfg
├── dags/
│   ├── __init__.py
│   └── weather_data_pipeline.py
├── db/
│   ├── init.sql
│   ├── run.sh
│   ├── schema.sql
│   └── setup.sql
├── docker/
│   ├── docker-compose.yml
│   └── Dockerfile
├── kafka/
│   ├── kafka_consumer.py
│   └── kafka_producer.py
├── LICENSE
├── notebooks/
│   └── data_exploration.ipynb
├── README.md
├── requirements.txt
├── scripts/
│   ├── start_airflow.sh
│   ├── start_kafka.sh
│   └── start_spark.sh
├── setup.py
├── spark/
│   ├── __init__.py
│   └── weather_data_processor.py
└── tests/
    ├── test_airflow_dag.py
    ├── test_kafka_producer.py
    └── test_spark_processor.py
```

1. **`dags/`**: Contains the Airflow DAG scripts.
   - `weather_data_pipeline.py`: The main Airflow DAG script for orchestrating the pipeline.

2. **`kafka/`**: Contains Kafka-related scripts.
   - `kafka_producer.py`: Script to produce weather data to Kafka.
   - `kafka_consumer.py`: Script to consume weather data from Kafka (if needed).

3. **`spark/`**: Contains Spark-related scripts.
   - `weather_data_processor.py`: Script to process weather data using Spark's Structured Streaming.

4. **`db/`**: Contains database initialization and schema scripts.
   - `run.sh`: shell script that automates the database setup process
   - `setup.sql`: Creates the database
   - `schema.sql`: Creates tables and relationships
   - `init.sql`: Populates initial data

6. **`docker/`**: Contains Docker-related files.
   - `Dockerfile`: Dockerfile to build the project container.
   - `docker-compose.yml`: Docker Compose file to set up the environment with Kafka, Spark, Airflow, and PostgreSQL.

7. **`notebooks/`**: Contains Jupyter notebooks for data exploration and analysis.
   - `data_exploration.ipynb`: Notebook for exploring and visualizing weather data.

8. **`scripts/`**: Contains bash scripts to start various components.
   - `start_airflow.sh`: Script to start Airflow web server and scheduler.
   - `start_kafka.sh`: Script to start Kafka services.
   - `start_spark.sh`: Script to start Spark services.

9. **`tests/`**: Contains test scripts.
   - `test_kafka_producer.py`: Tests for the Kafka producer.
   - `test_spark_processor.py`: Tests for the Spark data processing.
   - `test_airflow_dag.py`: Tests for the Airflow DAG.

10. **`airflow.cfg`**: Configuration file for Airflow.
11. **`requirements.txt`**: Lists Python dependencies.
12. **`README.md`**: Project overview and instructions.
13. **`LICENSE`**: License file.
14. **`setup.py`**: Setup script for the project.

---

### **Getting Started**

#### **Prerequisites**

- Docker and Docker Compose installed on your machine.
- PostgreSQL installed (or use Docker for containerized PostgreSQL).
- Python 3.8+ installed.
- Airflow, Kafka, and Spark configurations set up via Docker.

#### **Installation**

1. Clone the repository:

```bash
git clone https://github.com/your-username/real-time-weather-analysis.git
cd real-time-weather-analysis
```

2. Build and run the Docker containers:

```bash
docker-compose up -d
```

3. Install the required Python dependencies:

```bash
pip install -r requirements.txt
```

4. Start the Airflow web server and scheduler:

```bash
airflow webserver --port 8080
airflow scheduler
```

5. Start the Kafka producer (Python script that streams weather data):

```bash
python kafka_producer.py
```

6. Monitor the Airflow DAGs at `http://localhost:8080`.

---

### **Pipeline Workflow**

1. **Weather data ingestion**: The **Python Kafka producer** fetches weather data from OpenWeatherMap and streams it to Kafka.
2. **Data processing**: **Apache Spark** processes the Kafka data stream in real-time, performs transformations (such as converting temperature from Kelvin to Celsius), and prepares the data for storage.
3. **Data storage**: Processed data is saved to the **PostgreSQL** database for historical records.
4. **Task orchestration**: **Airflow** manages the scheduling of tasks (weather data fetching, Kafka producer, Spark processing, etc.) and ensures the pipeline runs automatically.
5. **Visualization**: The weather data is visualized in real-time in **Tableau** and **Power BI** dashboards by connecting directly to PostgreSQL.

---

### **Running the Dashboards**

1. **Tableau**:
   - Open Tableau and connect to the **PostgreSQL** database.
   - Create interactive visualizations (e.g., weather trends, temperature comparisons).

2. **Power BI**:
   - Open Power BI and connect to the **PostgreSQL** database.
   - Build custom dashboards (e.g., humidity levels, wind speeds, etc.).

---

### **Contributing**

1. Fork this repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a pull request.

---

### **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### **Contact**

For more details or inquiries, feel free to reach out at:  
- Email: your.email@example.com  
- GitHub: [your-username](https://github.com/your-username)
