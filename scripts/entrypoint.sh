#!/bin/bash
set -e

echo "=== NodeGoat Container Starting ==="

# Substitute environment variables in Apache config
envsubst '${NODEGOAT_DOMAIN} ${NODEGOAT_CMS_DOMAIN}' < /etc/apache2/sites-available/nodegoat.conf > /etc/apache2/sites-available/nodegoat.conf.tmp
mv /etc/apache2/sites-available/nodegoat.conf.tmp /etc/apache2/sites-available/nodegoat.conf

# Create alias file if it doesn't exist
if [ ! -f /var/1100CC/APP/alias ]; then
    echo "Creating alias file..."
    cat > /var/1100CC/APP/alias <<EOF
${NODEGOAT_DOMAIN}	nodegoat
${NODEGOAT_CMS_DOMAIN}	nodegoat
cms.${NODEGOAT_DOMAIN}	nodegoat
EOF
fi

# Ensure proper permissions on writable directories
chown -R www-data:www-data /var/1100CC/APP/STORAGE
chown -R www-data:www-data /var/1100CC/APP/CACHE
chmod -R 775 /var/1100CC/APP/STORAGE
chmod -R 775 /var/1100CC/APP/CACHE

# Create password files in SAFE directory if they don't exist
SAFE_DIR="/var/1100CC/SAFE/nodegoat"
mkdir -p "$SAFE_DIR"

if [ ! -f "$SAFE_DIR/cms" ]; then
    echo "Creating CMS database password file..."
    echo "${DB_PASSWORD_CMS:-changeme_cms}" > "$SAFE_DIR/cms"
    chmod 600 "$SAFE_DIR/cms"
fi

if [ ! -f "$SAFE_DIR/home" ]; then
    echo "Creating HOME database password file..."
    echo "${DB_PASSWORD_HOME:-changeme_home}" > "$SAFE_DIR/home"
    chmod 600 "$SAFE_DIR/home"
fi

chown -R www-data:www-data /var/1100CC/SAFE

# Wait for database to be ready
echo "Waiting for database connection..."
MAX_RETRIES=30
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    if [ "${DB_TYPE}" = "pgsql" ]; then
        if pg_isready -h "${DB_HOST}" -p "${DB_PORT:-5432}" > /dev/null 2>&1; then
            echo "PostgreSQL is ready!"
            break
        fi
    else
        if mysqladmin ping -h "${DB_HOST}" -P "${DB_PORT:-3306}" --silent 2>/dev/null; then
            echo "MySQL is ready!"
            break
        fi
    fi

    RETRY_COUNT=$((RETRY_COUNT + 1))
    echo "Database not ready yet, waiting... (attempt $RETRY_COUNT/$MAX_RETRIES)"
    sleep 2
done

if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
    echo "WARNING: Could not connect to database after $MAX_RETRIES attempts"
fi

# Check if 1100CC core is mounted
if [ ! -d /var/1100CC/APP/CORE ] || [ -z "$(ls -A /var/1100CC/APP/CORE 2>/dev/null)" ]; then
    echo "WARNING: 1100CC core not found at /var/1100CC/APP/CORE"
    echo "Please mount the 1100CC repository to this location"
fi

# Check if NodeGoat is mounted
if [ ! -d /var/1100CC/APP/nodegoat ] || [ -z "$(ls -A /var/1100CC/APP/nodegoat 2>/dev/null)" ]; then
    echo "WARNING: NodeGoat not found at /var/1100CC/APP/nodegoat"
    echo "Please mount the NodeGoat repository to this location"
fi

echo "=== Starting Apache ==="

# Execute the main command
exec "$@"
