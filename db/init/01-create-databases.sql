-- NodeGoat Database Initialization
-- This script creates the required databases and users for 1100CC and NodeGoat

-- Create databases with UTF8MB4 encoding
CREATE DATABASE IF NOT EXISTS `1100CC` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_cms` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_home` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_content` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_temp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create CMS user with full privileges
-- This user is used by the CMS/admin interface
CREATE USER IF NOT EXISTS '1100CC_cms'@'%' IDENTIFIED BY 'changeme_cms';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON `1100CC`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON `nodegoat_cms`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON `nodegoat_content`.* TO '1100CC_cms'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
      CREATE TEMPORARY TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON `nodegoat_temp`.* TO '1100CC_cms'@'%';

-- Create HOME user with read/limited write privileges
-- This user is used by the public-facing interface
CREATE USER IF NOT EXISTS '1100CC_home'@'%' IDENTIFIED BY 'changeme_home';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON `1100CC`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON `nodegoat_home`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON `nodegoat_content`.* TO '1100CC_home'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES
ON `nodegoat_temp`.* TO '1100CC_home'@'%';

FLUSH PRIVILEGES;

-- Note: After initial setup, you'll need to import the SQL schema files from:
-- 1. 1100CC repository: setup/*.sql files
-- 2. NodeGoat repository: setup/*.sql files
--
-- Example (run from host after containers are up):
-- docker exec -i nodegoat-db mysql -uroot -p < ./1100CC/setup/1100CC.sql
-- docker exec -i nodegoat-db mysql -uroot -p < ./nodegoat/setup/nodegoat_cms.sql
-- etc.
