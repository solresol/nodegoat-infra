# nodegoat-infra

Infrastructure to put together a nodegoat instance

## About

This is the NodeGoat we care about -- it's the Digital Humanities one, not the OWASP one.

Source repository: https://github.com/nodegoat/nodegoat

NodeGoat runs on the 1100CC framework: https://github.com/LAB1100/1100CC

## Architecture

This setup uses:
- **Docker** for the PHP/Apache web application
- **Host PostgreSQL** with PostGIS for the database (not containerized)

## Prerequisites

- Docker and Docker Compose installed
- PostgreSQL 16+ with PostGIS extension on the host
- Git for cloning repositories

## Quick Start

### 1. Clone the required repositories

```bash
# Clone 1100CC framework
git clone https://github.com/LAB1100/1100CC.git

# Clone NodeGoat
git clone https://github.com/nodegoat/nodegoat.git
```

### 2. Configure environment

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env and set your database passwords
```

### 3. Start the container

```bash
docker-compose up -d
```

### 4. Import database schemas

After the container is running, import the SQL schema files:

```bash
# Import 1100CC core schemas (check ./1100CC/setup/ for all SQL files)
psql -U nodegoat_cms -h localhost -d nodegoat_cms -f ./1100CC/setup/1100CC.sql

# Import NodeGoat schemas (check ./nodegoat/setup/ for all SQL files)
psql -U nodegoat_cms -h localhost -d nodegoat_cms -f ./nodegoat/setup/nodegoat_cms.sql
psql -U nodegoat_cms -h localhost -d nodegoat_content -f ./nodegoat/setup/nodegoat_content.sql
# ... import other SQL files as needed
```

### 5. Access NodeGoat

- Main interface: http://localhost:8080
- CMS interface: http://cms.localhost:8080 (may require hosts file entry)

## Directory Structure

```
nodegoat-infra/
├── Dockerfile              # Main container image
├── docker-compose.yml      # Service orchestration (web only)
├── .env.example            # Environment template
├── apache/
│   └── nodegoat.conf       # Apache virtual host config
├── php/
│   └── php.ini             # PHP configuration
├── scripts/
│   └── entrypoint.sh       # Container startup script
├── config/
│   ├── settings/           # 1100CC settings (mount point)
│   └── safe/               # Database passwords (mount point)
├── 1100CC/                  # Clone of 1100CC framework (you create this)
└── nodegoat/                # Clone of NodeGoat (you create this)
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `NODEGOAT_HTTP_PORT` | 8080 | HTTP port mapping |
| `NODEGOAT_HTTPS_PORT` | 8443 | HTTPS port mapping |
| `NODEGOAT_DOMAIN` | localhost | Main domain |
| `NODEGOAT_CMS_DOMAIN` | cms.localhost | CMS subdomain |
| `DB_TYPE` | pgsql | Database type |
| `DB_HOST` | 172.17.0.1 | Database host (Docker bridge IP) |
| `DB_PORT` | 5432 | Database port |
| `DB_PASSWORD_CMS` | (required) | CMS user password |
| `DB_PASSWORD_HOME` | (required) | Home user password |

### Database Setup

The following PostgreSQL databases are required:
- `nodegoat_cms` - CMS/admin data
- `nodegoat_home` - Public interface data
- `nodegoat_content` - Content data (with PostGIS)
- `nodegoat_temp` - Temporary data (with PostGIS)

Two database users with different privilege levels:
- **nodegoat_cms**: Full CRUD + schema modification (for CMS/admin)
- **nodegoat_home**: Read/write access (for public interface)

### PostgreSQL Configuration

For Docker containers to connect to host PostgreSQL:

1. Add to `/etc/postgresql/16/main/pg_hba.conf`:
   ```
   host    all    all    172.17.0.0/16    scram-sha-256
   ```

2. Update `/etc/postgresql/16/main/postgresql.conf`:
   ```
   listen_addresses = 'localhost,172.17.0.1'
   ```

3. Restart PostgreSQL:
   ```bash
   sudo systemctl restart postgresql
   ```

## Volumes

The following Docker volumes persist data:

- `nodegoat-storage`: Uploaded files and media
- `nodegoat-cache`: Application cache

## Useful Commands

```bash
# View logs
docker-compose logs -f nodegoat

# Access container shell
docker exec -it nodegoat-app bash

# Access PostgreSQL shell
psql -U nodegoat_cms -h localhost -d nodegoat_cms

# Rebuild after changes
docker-compose build --no-cache

# Stop and remove containers
docker-compose down

# Stop and remove containers + volumes (WARNING: deletes uploaded files)
docker-compose down -v
```

## Troubleshooting

### Database connection errors
- Verify PostgreSQL is listening on Docker bridge: `ss -tlnp | grep 5432`
- Check pg_hba.conf allows connections from 172.17.0.0/16
- Test connection from container: `docker exec nodegoat-app psql -h 172.17.0.1 -U nodegoat_cms -d nodegoat_cms`

### 1100CC/NodeGoat not loading
- Verify the repositories are cloned to the correct locations
- Check that volumes are mounted correctly: `docker exec nodegoat-app ls -la /var/1100CC/APP/`

### Permission errors
- The entrypoint script sets permissions, but you may need to run:
  ```bash
  docker exec nodegoat-app chown -R www-data:www-data /var/1100CC/APP/STORAGE
  ```

## Alternative: Fully Containerized Setup

If you prefer to run PostgreSQL in Docker as well, use the `docker-compose.postgres.yml` override:

```bash
docker-compose -f docker-compose.yml -f docker-compose.postgres.yml up -d
```

## References

- [NodeGoat GitHub](https://github.com/nodegoat/nodegoat)
- [1100CC Framework](https://github.com/LAB1100/1100CC)
- [NodeGoat Official Site](https://nodegoat.net/)
- [LAB1100](https://lab1100.com/)
