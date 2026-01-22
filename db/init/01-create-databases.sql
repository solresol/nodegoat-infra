-- NodeGoat Database Initialization
-- This script creates the required databases and users for 1100CC and NodeGoat
-- Note: Passwords are set via environment variables in 02-setup-schema.sh

-- Create databases with UTF8MB4 encoding
CREATE DATABASE IF NOT EXISTS `1100CC` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_cms` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_home` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_content` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `nodegoat_temp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
