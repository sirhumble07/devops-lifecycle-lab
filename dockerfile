
FROM python:3.11

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Copy app source
COPY app ./app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
