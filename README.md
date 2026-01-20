# nodegoat-infra

Infrastructure to put together a nodegoat instance

## About

This is the NodeGoat we care about -- it's the Digital Humanities one, not the OWASP one.

Source repository: https://github.com/nodegoat/nodegoat

NodeGoat runs on the 1100CC framework: https://github.com/LAB1100/1100CC

## Prerequisites

- Docker and Docker Compose installed
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

# Edit .env and set your passwords and domain
# IMPORTANT: Change the default passwords for production use!
```

### 3. Start the containers

```bash
docker-compose up -d
```

### 4. Import database schemas

After the containers are running, import the SQL schema files:

```bash
# Import 1100CC core schema
docker exec -i nodegoat-db mysql -uroot -p$MYSQL_ROOT_PASSWORD 1100CC < ./1100CC/setup/1100CC.sql

# Import NodeGoat schemas (check the nodegoat/setup directory for all required files)
docker exec -i nodegoat-db mysql -uroot -p$MYSQL_ROOT_PASSWORD nodegoat_cms < ./nodegoat/setup/nodegoat_cms.sql
docker exec -i nodegoat-db mysql -uroot -p$MYSQL_ROOT_PASSWORD nodegoat_content < ./nodegoat/setup/nodegoat_content.sql
# ... import other SQL files as needed
```

### 5. Access NodeGoat

- Main interface: http://localhost:8080
- CMS interface: http://cms.localhost:8080 (may require hosts file entry)

## Directory Structure

```
nodegoat-infra/
├── Dockerfile              # Main container image
├── docker-compose.yml      # Service orchestration
├── .env.example            # Environment template
├── apache/
│   └── nodegoat.conf       # Apache virtual host config
├── php/
│   └── php.ini             # PHP configuration
├── scripts/
│   └── entrypoint.sh       # Container startup script
├── db/
│   └── init/               # Database initialization scripts
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
| `DB_TYPE` | mysql | Database type (mysql or pgsql) |
| `DB_HOST` | db | Database host |
| `DB_PORT` | 3306 | Database port |
| `MYSQL_ROOT_PASSWORD` | rootpassword | MySQL root password |
| `DB_PASSWORD_CMS` | changeme_cms | CMS user password |
| `DB_PASSWORD_HOME` | changeme_home | Home user password |

### Database Users

The setup creates two MySQL users with different privilege levels:

- **1100CC_cms**: Full CRUD + schema modification (for CMS/admin)
- **1100CC_home**: Read/write access (for public interface)

## PostgreSQL Alternative

To use PostgreSQL with PostGIS instead of MySQL:

1. Update `docker-compose.yml` to use the PostgreSQL service
2. Set `DB_TYPE=pgsql` in `.env`
3. Enable PostGIS extension in the database

A PostgreSQL compose override is available in `docker-compose.postgres.yml`.

## Volumes

The following Docker volumes persist data:

- `nodegoat-storage`: Uploaded files and media
- `nodegoat-cache`: Application cache
- `nodegoat-db-data`: Database files

## Useful Commands

```bash
# View logs
docker-compose logs -f nodegoat

# Access container shell
docker exec -it nodegoat-app bash

# Access MySQL shell
docker exec -it nodegoat-db mysql -uroot -p

# Rebuild after changes
docker-compose build --no-cache

# Stop and remove containers
docker-compose down

# Stop and remove containers + volumes (WARNING: deletes data)
docker-compose down -v
```

## Troubleshooting

### Database connection errors
- Ensure the database container is healthy: `docker-compose ps`
- Check logs: `docker-compose logs db`
- Verify passwords match between `.env` and the init script

### 1100CC/NodeGoat not loading
- Verify the repositories are cloned to the correct locations
- Check that volumes are mounted correctly: `docker exec nodegoat-app ls -la /var/1100CC/APP/`

### Permission errors
- The entrypoint script sets permissions, but you may need to run:
  ```bash
  docker exec nodegoat-app chown -R www-data:www-data /var/1100CC/APP/STORAGE
  ```

## References

- [NodeGoat GitHub](https://github.com/nodegoat/nodegoat)
- [1100CC Framework](https://github.com/LAB1100/1100CC)
- [NodeGoat Official Site](https://nodegoat.net/)
- [LAB1100](https://lab1100.com/)
