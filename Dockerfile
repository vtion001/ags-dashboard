FROM python:3.12-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app.py wsgi.py ./

# Expose port (Render/Railway use PORT, Fly uses 8080)
ENV PORT=8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Run with gunicorn (1 worker on free tier)
CMD ["gunicorn", "wsgi:server", "-w", "1", "-b", "0.0.0.0:8080", "--timeout", "120"]
