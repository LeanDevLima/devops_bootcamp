FROM python:3.12-slim AS builder
WORKDIR /app

# Install uv.
RUN pip install --upgrade pip && pip install uv

COPY app ./app
COPY pyproject.toml uv.lock ./

# Install the application dependencies.
RUN uv sync --frozen --no-cache

# Final stage
FROM python:3.12-slim
WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY app ./app
COPY pyproject.toml uv.lock ./

EXPOSE 80

# Run the application.
CMD ["/app/.venv/bin/uvicorn", "app.main:app", "--port", "80", "--host", "0.0.0.0"]

# docker build -t demo_day_project .
# docker run -p 8000:80 demo_day_project