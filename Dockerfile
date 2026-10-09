# Playwright's image ships Chromium and its system dependencies.
FROM mcr.microsoft.com/playwright/python:v1.56.0-noble
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV SANDBOX_URL=http://127.0.0.1:8800 SANDBOX_BIND=0.0.0.0 PYTHONUNBUFFERED=1
EXPOSE 8000 8800
CMD ["python", "-m", "atlas", "console", "--host", "0.0.0.0"]
