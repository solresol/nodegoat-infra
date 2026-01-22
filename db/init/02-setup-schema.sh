#!/bin/bash
# NodeGoat Database Schema Setup
# This script creates users and imports all schema files

set -e

echo "=== NodeGoat Database Setup ==="

# Get passwords from environment (set in docker-compose.yml)
CMS_PASSWORD="${MYSQL_PASSWORD_CMS:-changeme_cms}"
HOME_PASSWORD="${MYSQL_PASSWORD_HOME:-changeme_home}"

echo "Creating database users..."

mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
-- Create CMS user with full privileges
CREATE USER IF NOT EXISTS '1100CC_cms'@'%' IDENTIFIED BY '${CMS_PASSWORD}';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON \`1100CC\`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON \`nodegoat_cms\`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON \`nodegoat_content\`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON \`nodegoat_temp\`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON \`nodegoat_home\`.* TO '1100CC_cms'@'%';

-- Create HOME user with limited privileges
CREATE USER IF NOT EXISTS '1100CC_home'@'%' IDENTIFIED BY '${HOME_PASSWORD}';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON \`1100CC\`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON \`nodegoat_home\`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON \`nodegoat_content\`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON \`nodegoat_temp\`.* TO '1100CC_home'@'%';

GRANT SELECT ON \`nodegoat_cms\`.* TO '1100CC_home'@'%';

FLUSH PRIVILEGES;
EOF

echo "Users created successfully"

# Import 1100CC core schema (into 1100CC database)
echo "Importing 1100CC core schema..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" 1100CC < /setup/1100CC/1100CC.sql

# Import 1100CC core labels
echo "Importing 1100CC core labels..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" 1100CC < /setup/1100CC/1100CC.core_language.sql
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" 1100CC < /setup/1100CC/1100CC.core_labels.en.sql

# Import CMS site schema (into nodegoat_cms database)
echo "Importing CMS site schema..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_cms < /setup/1100CC/SITE_cms.sql
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_cms < /setup/1100CC/SITE_cms.default.sql

# Import HOME site schema (into nodegoat_home database)
echo "Importing HOME site schema..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_home < /setup/1100CC/SITE_home.sql

# Import NodeGoat CMS-specific tables and labels
echo "Importing NodeGoat CMS schema..."
if [ -f /setup/nodegoat/nodegoat_cms.various.sql ]; then
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_cms < /setup/nodegoat/nodegoat_cms.various.sql
fi
if [ -f /setup/nodegoat/nodegoat_cms.cms_labels.sql ]; then
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_cms < /setup/nodegoat/nodegoat_cms.cms_labels.sql
fi

# Import NodeGoat home schema
echo "Importing NodeGoat home schema..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_home < /setup/nodegoat/nodegoat_home.sql
if [ -f /setup/nodegoat/nodegoat_home.various.sql ]; then
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_home < /setup/nodegoat/nodegoat_home.various.sql
fi
if [ -f /setup/nodegoat/nodegoat_home.changes.sql ]; then
    mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_home < /setup/nodegoat/nodegoat_home.changes.sql
fi

# Import NodeGoat content schema
echo "Importing NodeGoat content schema..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_content < /setup/nodegoat/nodegoat_content.sql

# Add default site host entries
echo "Adding default site host entries..."
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nodegoat_cms <<EOF
INSERT IGNORE INTO site_details_hosts (name) VALUES ('nodegoat.local');
INSERT IGNORE INTO site_details_hosts (name) VALUES ('cms.nodegoat.local');
INSERT IGNORE INTO site_details_hosts (name) VALUES ('localhost');
EOF

echo "=== NodeGoat Database Setup Complete ==="
