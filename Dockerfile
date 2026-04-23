FROM python:3.11-slim

WORKDIR /app

# instalacja uv
RUN pip install uv

# kopiujemy dependency files (cache layer)
COPY pyproject.toml uv.lock ./

# instalacja zależności
RUN uv sync

# kopiujemy kod
COPY . .

# uruchomienie ETL
CMD ["uv", "run", "python", "main.py"]