FROM python:3.10-slim

# Avoid prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

EXPOSE 8003

WORKDIR /app

# Copy and install requirements
COPY rqs.txt .
RUN pip install --no-cache-dir -r rqs.txt
COPY . .

CMD ["gunicorn", "--chdir", "src", "--bind", "0.0.0.0:8003", "--workers=2", "demoscraper.wsgi:application"]
