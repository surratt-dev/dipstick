# Docker Configuration

This directory contains Docker-related configuration files for the Engineering Health Check Tool.

## Directory Structure

```
docker/
├── postgres/
│   └── init/
│       └── 01-init-databases.sql    # Database initialization script
└── pgadmin/
    └── servers.json                  # pgAdmin server configuration
```

## PostgreSQL Initialization

The `postgres/init/01-init-databases.sql` script runs automatically when the PostgreSQL container is first created. It:

1. Creates both `dipstick_dev` and `dipstick_test` databases
2. Installs required PostgreSQL extensions:
   - `uuid-ossp` - For UUID generation
   - `pgcrypto` - For encryption functions
3. Sets up proper permissions for the `dipstick_user`

## pgAdmin Configuration

The `pgadmin/servers.json` file pre-configures pgAdmin with a connection to the development database, making it easy to manage and inspect the database through a web UI.

## Usage

### Start all services:
```bash
docker-compose up -d
```

### Start with pgAdmin (database management UI):
```bash
docker-compose --profile tools up -d
```

### Start with all optional services (including Redis):
```bash
docker-compose --profile full up -d
```

### View logs:
```bash
docker-compose logs -f postgres
```

### Stop all services:
```bash
docker-compose down
```

### Reset database (removes all data):
```bash
docker-compose down -v
docker-compose up -d
```

## Accessing Services

| Service | URL | Credentials |
|---------|-----|-------------|
| PostgreSQL | `localhost:5432` | User: `dipstick_user`<br>Password: `dipstick_dev_password`<br>Database: `dipstick_dev` |
| pgAdmin | `http://localhost:5050` | Email: `admin@dipstick.local`<br>Password: `admin` |
| Redis | `localhost:6379` | No authentication (dev only) |

## Environment Variables

All PostgreSQL configuration can be customized via environment variables in `docker-compose.yml` or by creating a `.env` file. See `.env.example` for available options.

## Data Persistence

Data is persisted in Docker volumes:
- `postgres_data` - PostgreSQL database files
- `pgadmin_data` - pgAdmin configuration
- `redis_data` - Redis data (when using full profile)

To completely remove all data:
```bash
docker-compose down -v
```

## Profiles

The Docker Compose configuration supports profiles for optional services:

- **Default** (no profile): PostgreSQL only
- **tools**: Adds pgAdmin for database management
- **full**: Adds pgAdmin and Redis for production-like environment

## Health Checks

All services include health checks:
- **PostgreSQL**: Checks database connectivity
- **Redis**: Checks Redis server response

View health status:
```bash
docker-compose ps
```

## Troubleshooting

### PostgreSQL won't start
1. Check if port 5432 is already in use: `lsof -i :5432`
2. Check logs: `docker-compose logs postgres`
3. Verify volumes aren't corrupted: `docker volume ls`

### Can't connect to database
1. Ensure container is running: `docker-compose ps`
2. Check health status: `docker-compose ps postgres`
3. Test connection: `docker-compose exec postgres psql -U dipstick_user -d dipstick_dev`

### Reset initialization scripts
If you modify the init scripts, you need to recreate the container:
```bash
docker-compose down -v
docker-compose up -d
```

## Production Considerations

This configuration is designed for **development only**. For production:

1. Use strong passwords (not defaults)
2. Enable SSL/TLS for PostgreSQL
3. Use secrets management (Docker secrets, Kubernetes secrets)
4. Configure proper backup strategies
5. Adjust PostgreSQL performance settings based on load
6. Use managed database services for better reliability
7. Remove pgAdmin or secure it properly
8. Enable Redis authentication
