FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# Use Heroku's PORT with 8080 fallback
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT:-8080} bot:app"]