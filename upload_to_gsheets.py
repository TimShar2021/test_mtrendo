import gspread
from oauth2client.service_account import ServiceAccountCredentials
import pandas as pd
from pathlib import Path
from credentials import json_path

# Настройка доступа к Google Sheets API
scope = ["https://spreadsheets.google.com/feeds", "https://www.googleapis.com/auth/drive"]
creds = ServiceAccountCredentials.from_json_keyfile_name(json_path, scope)
client = gspread.authorize(creds)

# Открытие Google Sheets по названию или ID
spreadsheet = client.open("final_tips_changes")

# Выбор рабочего листа по названию
worksheet = spreadsheet.worksheet("taxi")

# Чтение данных из CSV файла
csv_path = Path('final_tips_changes.csv')
df = pd.read_csv(csv_path)
df = df.fillna(0)

# Преобразование DataFrame в формат для Google Sheets
data_list = [df.columns.values.tolist()] + df.values.tolist()

# Очистка рабочего листа и запись новых данных
worksheet.clear()
worksheet.update('A1', data_list)