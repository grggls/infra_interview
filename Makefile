.PHONY: build up down logs clean help
.DEFAULT_GOAL := help

# Show help for all targets
help:
	@echo "Docker Development Environment Commands:"
	@echo "  make build             # Build all images"
	@echo "  make up                # Start services in detached mode"
	@echo "  make up-build          # Build and start services"
	@echo "  make down              # Stop all services"
	@echo "  make logs              # View all logs"
	@echo "  make logs-client       # View client logs"
	@echo "  make logs-server       # View server logs"
	@echo "  make logs-db           # View database logs"
	@echo "  make logs-redis        # View Redis logs"
	@echo "  make clean             # Remove containers, networks, images"
	@echo "  make clean-volumes     # Remove everything including data volumes"
	@echo "  make restart-client    # Restart client"
	@echo "  make restart-server    # Restart server"
	@echo "  make restart-db        # Restart database"
	@echo "  make restart-redis     # Restart Redis"
	@echo "  make status            # Show container status"

# Build all images
build:
	docker-compose build

# Start all services
up:
	docker-compose up -d

# Build and start all services
up-build:
	docker-compose up -d --build

# Stop all services
down:
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# View logs for a specific service
logs-client:
	docker-compose logs -f client

logs-server:
	docker-compose logs -f server

logs-db:
	docker-compose logs -f db

logs-redis:
	docker-compose logs -f redis

# Clean up - remove containers, networks, and images
clean:
	docker-compose down --rmi local

# Remove volumes too (WARNING: This will delete your database data)
clean-volumes:
	docker-compose down -v --rmi local

# Restart a specific service
restart-client:
	docker-compose restart client

restart-server:
	docker-compose restart server

restart-db:
	docker-compose restart db

restart-redis:
	docker-compose restart redis

# Show status of containers
status:
	docker-compose ps