-- NodeGoat PostgreSQL Database Initialization
-- This script creates the required databases and users for 1100CC and NodeGoat

-- Create databases
CREATE DATABASE nodegoat_cms;
CREATE DATABASE nodegoat_home;
CREATE DATABASE nodegoat_content;
CREATE DATABASE nodegoat_temp;

-- Create users
CREATE USER nodegoat_cms WITH PASSWORD 'changeme_cms';
CREATE USER nodegoat_home WITH PASSWORD 'changeme_home';

-- Enable PostGIS extension on content database (required for NodeGoat)
\c nodegoat_content
CREATE EXTENSION IF NOT EXISTS postgis;

\c nodegoat_temp
CREATE EXTENSION IF NOT EXISTS postgis;

-- Grant privileges to CMS user (full access)
\c nodegoat_cms
GRANT ALL PRIVILEGES ON DATABASE nodegoat_cms TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO nodegoat_cms;

\c nodegoat_content
GRANT ALL PRIVILEGES ON DATABASE nodegoat_content TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO nodegoat_cms;

\c nodegoat_temp
GRANT ALL PRIVILEGES ON DATABASE nodegoat_temp TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO nodegoat_cms;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO nodegoat_cms;

-- Grant privileges to HOME user (limited access)
\c nodegoat_home
GRANT CONNECT ON DATABASE nodegoat_home TO nodegoat_home;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO nodegoat_home;

\c nodegoat_content
GRANT CONNECT ON DATABASE nodegoat_content TO nodegoat_home;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO nodegoat_home;

\c nodegoat_temp
GRANT CONNECT ON DATABASE nodegoat_temp TO nodegoat_home;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO nodegoat_home;

-- Note: After initial setup, you'll need to use PGLoader to import
-- the MySQL schema if migrating, or import PostgreSQL-specific schemas
-- from the 1100CC and NodeGoat repositories.
