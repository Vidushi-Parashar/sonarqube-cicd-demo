# small, production-acceptable image for demo
FROM python:3.9-slim

WORKDIR /app

# copy only requirements first to allow Docker cache
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "-m", "app.main"]
