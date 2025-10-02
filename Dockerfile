FROM python:3.13-alpine AS BUILD

WORKDIR /app

COPY pyproject.toml ./
RUN python -m venv /opt/venv \
  && /opt/venv/bin/pip install --no-cache-dir --upgrade pip
COPY . .
RUN /opt/venv/bin/pip install --no-cache-dir .

ENV PATH=/opt/venv/bin:$PATH

CMD ["python", "-m", "sleeper_mcp_server"]