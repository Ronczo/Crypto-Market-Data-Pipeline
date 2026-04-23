# Project assumptions (targets)

* Zbudować system, który:

   * codziennie pobiera dane o rynku kryptowalut
   * zapisuje historię cen
   * umożliwia analizę trendów (np. średnia cena, zmienność, top 10)

* Use case:
  * Analiza wzrost i spadek cen kryptowalut
  * średnie ceny w czasie
  * ranking najdroższych aktywów

## Dane wejściowe
CoinGecko (https://api.coingecko.com/api/v3/coins/markets)

### Rodzaj importu
* FULL SNAPSHOT + historia
* Częstotliwość - 1x dziennie
* Airflow schedule - daily

### Zakres danych:
Top 20 kryptowalut

### Granularność:
1 obserwacja - coin + timestamp + cena

## Flow

API -> RAW -> TRANSFORM -> BIGQUERY -> SQL ANALYTICS

### Data approach 

Medallion Architecture

Bronze - full load, bez transormacji
Silver - full load. Cleaning, Standardization, Normalization, Derived Column, Enrichment
Gold - Data Integration, data aggregation, buisness logic



### Konsumenci
BI & Reporting
AD-Hoc SQL QUERIES

### Konwencja nazewnicta
* Język: angielski
* konwencja: snake_case
* tabela bronze: <sourcesystem>_<entity>
* tabela silver: <sourcesystem>_<entity>
* tabela gold: <category>_<entity>