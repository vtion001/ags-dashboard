"""
WSGI entry point for Render.com deployment.
Exposes the Dash app server for Gunicorn/Waitress.
"""
from app import app

# Render requires 'server' as the WSGI callable
server = app.server

if __name__ == "__main__":
    app.run()
