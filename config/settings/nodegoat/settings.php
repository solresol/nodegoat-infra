<?php

/**
 * NodeGoat settings for Docker deployment with MySQL/MariaDB
 */

// Database names
define('DATABASE_NODEGOAT_CONTENT', 'nodegoat_content');
define('DATABASE_NODEGOAT_TEMP', 'nodegoat_temp');

// Set database references for the framework
// 1100CC core tables (core_labels, core_language, core_users) are in 1100CC database
DB::$database_core = '1100CC';
DB::$database_cms = 'nodegoat_cms';
DB::$database_home = 'nodegoat_home';

// Database connection details
// Host is the Docker MySQL service name
$db_host = getenv('DB_HOST') ?: 'db';
$db_port = getenv('DB_PORT') ?: '3306';

// Connection details - using SAFE directory for password files
// For MySQL: setConnectionDetails(host:port, username, password_file, level)
// Password files contain plain text password, read via getSafeText()
DB::setConnectionDetails($db_host.':'.$db_port, '1100CC_cms', 'cms', DB::CONNECT_CMS);
DB::setConnectionDetails($db_host.':'.$db_port, '1100CC_home', 'home', DB::CONNECT_HOME);

// Graph analysis service (optional - disabled for now)
Settings::set('graph_analysis_service', false);
