# Engineering Health Check Tool - Makefile
# Convenient shortcuts for common development tasks

.PHONY: help up down logs db-shell db-reset clean test

# Default target
help:
	@echo "Engineering Health Check Tool - Development Commands"
	@echo ""
	@echo "Docker & Database:"
	@echo "  make up           - Start PostgreSQL database"
	@echo "  make up-tools     - Start PostgreSQL + pgAdmin"
	@echo "  make up-full      - Start all services (PostgreSQL + pgAdmin + Redis)"
	@echo "  make down         - Stop all services"
	@echo "  make logs         - View PostgreSQL logs"
	@echo "  make db-shell     - Open PostgreSQL shell"
	@echo "  make db-reset     - Reset database (DELETES ALL DATA)"
	@echo "  make clean        - Stop services and remove all data"
	@echo ""
	@echo "Environment:"
	@echo "  make env          - Create .env from .env.example"
	@echo ""
	@echo "Testing (when implemented):"
	@echo "  make test         - Run all tests"
	@echo ""

# Docker Commands
up:
	@echo "Starting PostgreSQL..."
	docker-compose up -d postgres
	@echo "PostgreSQL is running at localhost:5432"
	@echo "Database: dipstick_dev"
	@echo "User: dipstick_user"
	@echo "Password: dipstick_dev_password"

up-tools:
	@echo "Starting PostgreSQL + pgAdmin..."
	docker-compose --profile tools up -d
	@echo "PostgreSQL: localhost:5432"
	@echo "pgAdmin: http://localhost:5050"

up-full:
	@echo "Starting all services..."
	docker-compose --profile full up -d
	@echo "PostgreSQL: localhost:5432"
	@echo "pgAdmin: http://localhost:5050"
	@echo "Redis: localhost:6379"

down:
	@echo "Stopping all services..."
	docker-compose down

logs:
	@echo "Showing PostgreSQL logs (Ctrl+C to exit)..."
	docker-compose logs -f postgres

db-shell:
	@echo "Connecting to PostgreSQL..."
	docker-compose exec postgres psql -U dipstick_user -d dipstick_dev

db-reset:
	@echo "WARNING: This will delete ALL database data!"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		echo "Resetting database..."; \
		docker-compose down -v; \
		docker-compose up -d postgres; \
		echo "Database reset complete."; \
	else \
		echo "Cancelled."; \
	fi

clean:
	@echo "Stopping services and removing all data..."
	docker-compose down -v
	@echo "Cleanup complete."

# Environment Setup
env:
	@if [ ! -f .env ]; then \
		echo "Creating .env from .env.example..."; \
		cp .env.example .env; \
		echo ".env file created. Please update with your configuration."; \
	else \
		echo ".env file already exists. Skipping."; \
	fi

# Testing (placeholder for future implementation)
test:
	@echo "Tests not yet implemented."
	@echo "When backend is ready, this will run the test suite."
