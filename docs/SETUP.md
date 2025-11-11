# Engineering Health Check Tool - Setup Guide

**Version:** 1.0
**Date:** November 11, 2025
**Status:** Development

---

## Table of Contents

1. [Overview](#overview)
2. [Technology Stack](#technology-stack)
3. [Prerequisites](#prerequisites)
4. [Initial Setup](#initial-setup)
5. [Development Environment](#development-environment)
6. [Database Setup](#database-setup)
7. [Running the Application](#running-the-application)
8. [Testing](#testing)
9. [Deployment](#deployment)
10. [Troubleshooting](#troubleshooting)

---

## Overview

This guide walks you through setting up the Engineering Health Check Tool on your local development machine. The tool is a web-based application that facilitates engineering team retrospectives through real-time anonymous voting and historical trend tracking.

---

## Technology Stack

Based on the project's Business Requirements Document (BRD) and technical architecture, the following technology stack will be used:

### Frontend
- **Framework:** React (with hooks and functional components)
- **Real-time Communication:** WebSocket client
- **UI Approach:** Mobile-first responsive design
- **Progressive Web App (PWA):** Offline resilience capabilities
- **State Management:** TBD (Context API, Redux, or Zustand)
- **Styling:** TBD (CSS Modules, Styled Components, or Tailwind CSS)
- **Build Tool:** TBD (Vite, Create React App, or Next.js)

### Backend
- **Application Server:** TBD (Node.js/Express, Python/FastAPI, or Go)
- **WebSocket Server:** For real-time voting updates
- **API Gateway:** RESTful API endpoints
- **Authentication:** Simple username/password (initial release)

### Database
- **Primary Database:** PostgreSQL
- **Schema:** See Data Model in BRD (docs/engineering-health-check-brd.md)

### Infrastructure
- **Cloud Provider:** TBD (AWS, GCP, or Azure)
- **Deployment:** TBD (Docker containers, Kubernetes, or serverless)
- **Scaling:** Horizontal scaling capability
- **Security:** TLS 1.3+ for data in transit, encryption at rest for sensitive data

---

## Prerequisites

Before setting up the project, ensure you have the following installed:

### Required Software

1. **Git** (version 2.30+)
   ```bash
   git --version
   ```

2. **PostgreSQL** (version 14+)
   ```bash
   psql --version
   ```

3. **Node.js** (version 18+ LTS) - if using Node.js backend
   ```bash
   node --version
   npm --version
   ```

4. **Python** (version 3.11+) - if using Python backend
   ```bash
   python3 --version
   pip3 --version
   ```

5. **Docker & Docker Compose** (optional, recommended for containerized development)
   ```bash
   docker --version
   docker-compose --version
   ```

### Recommended Tools

- **Code Editor:** VS Code, WebStorm, or your preferred IDE
- **API Testing:** Postman, Insomnia, or curl
- **Database Client:** pgAdmin, DBeaver, or TablePlus

---

## Initial Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd dipstick
```

### 2. Review Project Documentation

Before proceeding, familiarize yourself with:
- **BRD:** `docs/engineering-health-check-brd.md` - Business requirements
- **Decisions:** `docs/DECISIONS.md` - Key architectural decisions
- **Issues:** `docs/issues/github-issues.md` - Planned features and tasks

### 3. Set Up Environment Variables

Create environment configuration files for local development:

#### Frontend Environment (.env.local or .env)
```bash
# API Configuration
REACT_APP_API_URL=http://localhost:8000
REACT_APP_WS_URL=ws://localhost:8000/ws

# Environment
NODE_ENV=development

# Feature Flags (optional)
REACT_APP_ENABLE_DEV_TOOLS=true
```

#### Backend Environment (.env)
```bash
# Database Configuration
DATABASE_URL=postgresql://dipstick_user:password@localhost:5432/dipstick_dev
DATABASE_POOL_SIZE=20
DATABASE_MAX_OVERFLOW=0

# Server Configuration
PORT=8000
HOST=0.0.0.0
DEBUG=true

# Security
SECRET_KEY=your-secret-key-change-in-production
JWT_ALGORITHM=HS256
JWT_EXPIRATION_HOURS=4

# CORS
ALLOWED_ORIGINS=http://localhost:3000,http://localhost:5173

# WebSocket Configuration
WS_HEARTBEAT_INTERVAL=30
WS_MAX_CONNECTIONS=1000

# Session Configuration
SESSION_TIMEOUT_HOURS=4
```

**Security Note:** Never commit `.env` files to version control. These files are included in `.gitignore`.

---

## Development Environment

### Option A: Local Development (Without Docker)

#### Frontend Setup

1. **Navigate to frontend directory** (when created):
   ```bash
   cd frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Start development server:**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

The frontend should be accessible at `http://localhost:3000` or `http://localhost:5173` (depending on build tool).

#### Backend Setup (Node.js Example)

1. **Navigate to backend directory** (when created):
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run database migrations:**
   ```bash
   npm run migrate
   ```

4. **Start development server:**
   ```bash
   npm run dev
   ```

#### Backend Setup (Python/FastAPI Example)

1. **Create virtual environment:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run database migrations:**
   ```bash
   alembic upgrade head
   ```

4. **Start development server:**
   ```bash
   uvicorn main:app --reload --port 8000
   ```

### Option B: Docker Development Environment

1. **Build and start containers:**
   ```bash
   docker-compose up --build
   ```

2. **Run database migrations:**
   ```bash
   docker-compose exec backend npm run migrate
   # or
   docker-compose exec backend alembic upgrade head
   ```

3. **Access services:**
   - Frontend: `http://localhost:3000`
   - Backend API: `http://localhost:8000`
   - Database: `localhost:5432`

4. **Stop containers:**
   ```bash
   docker-compose down
   ```

---

## Database Setup

### 1. Create PostgreSQL Database

#### Using psql CLI:

```bash
# Connect to PostgreSQL
psql -U postgres

# Create database user
CREATE USER dipstick_user WITH PASSWORD 'password';

# Create databases
CREATE DATABASE dipstick_dev OWNER dipstick_user;
CREATE DATABASE dipstick_test OWNER dipstick_user;

# Grant privileges
GRANT ALL PRIVILEGES ON DATABASE dipstick_dev TO dipstick_user;
GRANT ALL PRIVILEGES ON DATABASE dipstick_test TO dipstick_user;

# Exit psql
\q
```

#### Using Docker:

```bash
docker run --name dipstick-postgres \
  -e POSTGRES_USER=dipstick_user \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_DB=dipstick_dev \
  -p 5432:5432 \
  -d postgres:14
```

### 2. Database Schema

The database schema is defined in the BRD (docs/engineering-health-check-brd.md). Key entities include:

- **TEAM:** Engineering teams
- **USER:** Team members, facilitators, managers, admins
- **PROMPT_SET:** Collections of prompts per team
- **PROMPT:** Individual voting questions
- **SESSION:** Health check sessions
- **VOTE:** Individual votes cast during sessions
- **NOTE:** Facilitator notes during sessions
- **ACTION_ITEM:** Action items captured during sessions

### 3. Seed Data (Optional)

For development, you may want to create seed data:

```bash
# Run seed script (when available)
npm run seed
# or
python scripts/seed_data.py
```

---

## Running the Application

### Full Stack Development

1. **Start PostgreSQL** (if not using Docker):
   ```bash
   # Check if PostgreSQL is running
   pg_isready
   ```

2. **Start Backend Server:**
   ```bash
   cd backend
   npm run dev
   # or
   uvicorn main:app --reload
   ```

3. **Start Frontend Development Server:**
   ```bash
   cd frontend
   npm run dev
   ```

4. **Access the application:**
   - Frontend: `http://localhost:3000`
   - Backend API docs: `http://localhost:8000/docs` (if using OpenAPI/Swagger)

### Verify WebSocket Connection

Test WebSocket connectivity:

```bash
# Using wscat (install via: npm install -g wscat)
wscat -c ws://localhost:8000/ws
```

---

## Testing

### Frontend Testing

```bash
cd frontend

# Run unit tests
npm test

# Run tests with coverage
npm test -- --coverage

# Run end-to-end tests (when configured)
npm run test:e2e
```

### Backend Testing

```bash
cd backend

# Run unit tests
npm test
# or
pytest

# Run tests with coverage
npm test -- --coverage
# or
pytest --cov=app tests/

# Run integration tests
npm run test:integration
# or
pytest tests/integration/
```

### Test-Driven Development (TDD)

This project follows TDD practices (NFR-5.1). When implementing features:

1. Write failing tests first
2. Implement minimal code to pass tests
3. Refactor while keeping tests green
4. Repeat

---

## Deployment

### Production Checklist

Before deploying to production, ensure:

- [ ] All environment variables are set securely (no hardcoded secrets)
- [ ] Database connection uses SSL/TLS
- [ ] TLS 1.3+ is enabled for all endpoints
- [ ] Secret keys are rotated from development defaults
- [ ] CORS is configured for production domains only
- [ ] Rate limiting is enabled
- [ ] Logging and monitoring are configured
- [ ] Database backups are automated
- [ ] Load testing has been performed (NFR-1.1: support 50 concurrent teams)

### Deployment Options

#### Option 1: Cloud Platform (Heroku, Railway, Render)

1. **Create application**
2. **Add PostgreSQL add-on**
3. **Configure environment variables**
4. **Deploy via Git push:**
   ```bash
   git push heroku main
   ```

#### Option 2: Container-Based (AWS ECS, GCP Cloud Run, Azure Container Instances)

1. **Build Docker images:**
   ```bash
   docker build -t dipstick-frontend ./frontend
   docker build -t dipstick-backend ./backend
   ```

2. **Push to container registry:**
   ```bash
   docker tag dipstick-frontend:latest <registry>/dipstick-frontend:latest
   docker push <registry>/dipstick-frontend:latest
   ```

3. **Deploy via cloud provider CLI or console**

#### Option 3: Kubernetes

1. **Create Kubernetes manifests** (deployment, service, ingress)
2. **Apply configurations:**
   ```bash
   kubectl apply -f k8s/
   ```

3. **Monitor deployment:**
   ```bash
   kubectl get pods
   kubectl logs -f <pod-name>
   ```

---

## Troubleshooting

### Common Issues

#### 1. Database Connection Fails

**Problem:** `FATAL: password authentication failed for user "dipstick_user"`

**Solution:**
- Verify DATABASE_URL in `.env` file
- Check PostgreSQL is running: `pg_isready`
- Verify user exists: `psql -U postgres -c "\du"`
- Reset password if needed

#### 2. WebSocket Connection Drops

**Problem:** Votes not appearing in real-time

**Solution:**
- Check WebSocket server is running
- Verify CORS settings allow WebSocket connections
- Check browser console for connection errors
- Ensure no proxy/firewall is blocking WebSocket protocol
- Review NFR-3.1: automatic reconnection should handle transient issues

#### 3. Frontend Can't Reach Backend

**Problem:** `Network Error` or `CORS Error`

**Solution:**
- Verify backend is running: `curl http://localhost:8000/health`
- Check `ALLOWED_ORIGINS` in backend `.env`
- Verify `REACT_APP_API_URL` in frontend `.env`
- Clear browser cache and restart dev server

#### 4. Port Already in Use

**Problem:** `EADDRINUSE: address already in use :::3000`

**Solution:**
```bash
# Find process using the port
lsof -i :3000

# Kill the process
kill -9 <PID>

# Or use a different port
PORT=3001 npm run dev
```

#### 5. Database Migration Fails

**Problem:** Migration errors or schema mismatches

**Solution:**
```bash
# Rollback migration
npm run migrate:down
# or
alembic downgrade -1

# Re-run migration
npm run migrate
# or
alembic upgrade head

# If all else fails, reset database (DEVELOPMENT ONLY)
dropdb dipstick_dev
createdb dipstick_dev -O dipstick_user
npm run migrate
```

### Performance Targets

When troubleshooting performance issues, reference these NFR targets:

- **NFR-1.1:** Support 50 concurrent team sessions
- **NFR-1.2:** Vote aggregation displays within 500ms
- **NFR-1.3:** Historical queries return within 2 seconds
- **NFR-2.3:** Session join requires ≤2 steps

### Getting Help

1. **Check documentation:**
   - BRD: `docs/engineering-health-check-brd.md`
   - Issues: `docs/issues/github-issues.md`

2. **Review logs:**
   - Frontend: Browser DevTools Console
   - Backend: Application logs
   - Database: PostgreSQL logs

3. **Create an issue:**
   - Document steps to reproduce
   - Include error messages and logs
   - Note your environment (OS, Node version, etc.)

---

## Next Steps

After completing setup:

1. **Review the codebase structure** (when development begins)
2. **Read contribution guidelines** (when created)
3. **Pick a task from GitHub issues:** `docs/issues/github-issues.md`
4. **Join the team communication channel** (if applicable)
5. **Set up your development workflow:**
   - Configure pre-commit hooks
   - Set up linting and formatting
   - Configure your IDE for the tech stack

---

## Additional Resources

### Project Documentation
- [Business Requirements Document](./engineering-health-check-brd.md)
- [Decision Log](./DECISIONS.md)
- [GitHub Issues](./issues/github-issues.md)

### External Documentation
- [React Documentation](https://react.dev/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [WebSocket API](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket)

### Best Practices
- Follow TDD principles (NFR-5.1)
- Write tests before implementation
- Keep functions small and focused
- Document complex logic
- Review security best practices regularly

---

**Document Control:**
- **Location:** `/home/user/dipstick/docs/SETUP.md`
- **Last Updated:** November 11, 2025
- **Next Review:** After technology stack decisions are finalized
