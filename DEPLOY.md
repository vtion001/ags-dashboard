# AGS Phillies KPI Dashboard — Deployment Guide

## Option A: Render.com (Recommended — Free)

### Prerequisites
- A [Render.com](https://render.com) account (free)
- A GitHub repository to host the code

### Steps

**1. Create a GitHub repository**
- Go to https://github.com/new
- Name it `ags-phillies-kpi`
- Set it to **Private** or **Public**
- Do NOT initialize with README

**2. Push the code**
```bash
cd ags-dashboard
git remote add origin https://github.com/YOUR_USERNAME/ags-phillies-kpi.git
git push -u origin main
```

**3. Deploy on Render**
- Log in to https://render.com
- Click **"+ New"** → **"Blueprint"**
- Connect your GitHub repo
- Render auto-detects `render.yaml` and deploys
- Free tier: service sleeps after 15 min of inactivity (spins up on first request)

---

## Option B: PythonAnywhere (Manual Upload)

**1. Create account at https://www.pythonanywhere.com**

**2. Open a Bash console and run:**
```bash
pip install dash plotly pandas openpyxl gunicorn
# Then upload all files via the Files UI
# Run: python app.py
# Note: Only works on paid plans for web apps
```

---

## Option C: Run Locally (No Deployment)

```bash
cd ags-dashboard
pip install -r requirements.txt
python app.py
# Open http://127.0.0.1:8050
```

---

## Files Included

| File | Purpose |
|------|---------|
| `app.py` | Main Dash application |
| `wsgi.py` | WSGI entry point for production servers |
| `render.yaml` | Render.com deployment config |
| `requirements.txt` | Python dependencies |
| `generate_image.py` | Standalone PNG report generator |
| `ags_kpi_score.png` | Screenshot — KPI Score tab |
| `ags_attendance_trends.png` | Screenshot — Charts tab |
| `DEPLOY.md` | This file |
