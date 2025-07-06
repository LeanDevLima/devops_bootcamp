# before - FROM python:3.13-slim AS builder
FROM cgr.dev/chainguard/python:latest-dev AS builder
ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/venv/bin:$PATH"
WORKDIR /app

RUN python -m venv /app/venv
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Estágio final
# before - FROM python:3.13-slim
FROM cgr.dev/chainguard/python:latest
ENV PYTHONUNBUFFERED=1 \
    PATH="/app/venv/bin:$PATH"
WORKDIR /app

COPY --from=builder /app/venv /app/venv
COPY . .

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]