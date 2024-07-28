from google.cloud import bigquery
from pathlib import Path
from credetials import json_path

# Инициализация клиента BigQuery
client = bigquery.Client.from_service_account_json(json_path)

# Запрос для получения данных из таблицы
query = """
SELECT * FROM `flash-student-337912.chicago_taxi_trips.final_tips_changes`
"""

# Выполнение запроса и получение результатов
df = client.query(query).to_dataframe()

# Сохранение данных в CSV файл
output_path = Path('final_tips_changes.csv')
df.to_csv(output_path, index=False)
