# Use slim Python base
FROM python:3.10-slim

WORKDIR /app

# Install deps first for caching
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y gcc build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy all app folders
COPY server/ ./server/
COPY streamlit_app/ ./streamlit_app/
COPY client/ ./client/
COPY server/data ./server/data

ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Expose both ports (FastAPI + Streamlit)
EXPOSE 8000 8501

# Start both processes in parallel
CMD bash -c "uvicorn server.main:app --host 0.0.0.0 --port 8000 & streamlit run streamlit_app/app.py --server.port=8501 --server.address=0.0.0.0 --server.headless=true"