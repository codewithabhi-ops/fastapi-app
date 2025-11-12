# Use slim python image for production
FROM python:3.11-slim

WORKDIR /app

# create non-root user
RUN addgroup --system app && adduser --system --ingroup app app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app /app

USER app
EXPOSE 80
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--workers", "1"]

