FROM public.ecr.aws/docker/library/python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
RUN pip install --no-cache-dir uv==0.8.9
COPY pyproject.toml README.md ./
COPY src ./src
RUN uv pip install --system .

EXPOSE 8000
CMD ["uvicorn", "petshop_api.main:app", "--host", "0.0.0.0", "--port", "8000"]
