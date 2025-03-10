# test_mtrendo

## Задача

Найдите три машины, получившие наибольшее количество чаевых в апреле 2018 года, и выведите, как изменялась эта сумма в процентах в последующие месяцы по сравнению с предыдущим в таблице со столбцами `taxi_id`, `year_month`, `tips_sum`, `tips_change`. В качестве даты поездки возьмите дату начала поездки. В качестве источника данных используйте `bigquery-public-data.chicago_taxi_trips`. 

Пришлите нам ссылку на публичный репозиторий в GitHub с проектом dbt, в котором производится расчет, и выгрузку таблицы с результатом в Google Sheets. Дополнительным плюсом будет, если вы определите источники, разнесёте CTE по разным моделям, опишете столбцы моделей и сделаете финальную таблицу инкрементальной.

## Для запуска проекта

1. Убедитесь, что у вас установлен Python и настроен виртуальный окружение.

2. В файле `credentials` пропишите путь к вашему ключу JSON для GCP.

3. Установите все необходимые зависимости:

    ```sh
    pip install -r requirements.txt
    ```

4. Запустите dbt модели:

    ```sh
    dbt run
    ```

5. Экспортируйте данные из BigQuery в CSV файл:

    ```sh
    python scripts/export_to_csv.py
    ```

6. Загрузите данные в Google Sheets:

    ```sh
    python scripts/upload_to_gsheets.py
    ```



